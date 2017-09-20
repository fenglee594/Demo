//
//  HttpUtils.m
//  Demo
//
//  Created by 李峰 on 2017/9/8.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "HttpUtils.h"
#import <AFNetworking.h>
#import "MainConfigure.h"

#define kServerDomain @"www.baidu.com"
#define HttpManager [HttpUtils manager]
#define kTimeoutInterval 10.f

#define kServerDebugDomain      /*@"http://test.omengo.com"///*@"http://192.168.9.33:8080"*/@"http://192.168.9.43:8086"
#define kServerDebugDomainKey   @"kServerDebugDomain_key"
#define kServerProductDomain    @"https://www.omengo.com"//@"http://www.omengo.com"

#define TOKEN_KEY @"Authorization"

#define UN_STATABLE_NET_MESSAGE @"当前网络环境较差"

@interface HTTPSessionManager : AFHTTPSessionManager
@end
@implementation HTTPSessionManager
@end

@implementation HttpUtils

/**
 * 单例实现初始化
 */
static HttpUtils *_shareInstance = nil;
NSString * _serverDomain = nil;
AFNetworkReachabilityManager *_reachabilityManager = nil;
+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_shareInstance == nil) {
            HttpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
            [HttpManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            HttpManager.requestSerializer.timeoutInterval = kTimeoutInterval;
            HttpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
            [HttpManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            
            //设置URL的前缀
            [self reloadServerDomain];
            
            _shareInstance = [[self alloc] init];
        }
    });
    return _shareInstance;
}

/**
 * 设置请求工具类
 * return manager
 */
+ (HTTPSessionManager *) manager
{
    HTTPSessionManager *manager = [HTTPSessionManager manager];
    
    //设置请求头
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //设置响应头
//    NSNumber *value = SMUserDefaultGet(IS_DEBUGING_KEY) ;
//    BOOL isDebug = [value boolValue];
//    if (!isDebug) {
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        manager.securityPolicy.validatesDomainName = NO; // 关键语句1
//        manager.securityPolicy.allowInvalidCertificates = YES; // 关键语句2
//    }
    return manager;
}

+ (void)reloadServerDomain
{
    _serverDomain = [_serverDomain stringByAppendingString:@"/api/"];
    [self AFNetworkStatusObserve];
}

//监测网络
+ (void)AFNetworkStatusObserve{
    
    _reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [_reachabilityManager startMonitoring];
    [_reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                break;
        }
    }] ;
}

/**
 *  获取当前的Domain，用于拼接访问的接口
 */
+ (NSString *)currentDomain
{
    return _serverDomain;
}


/**
 *  组件启动
 */
+ (void)startRunning
{
    [self shareInstance];
}

+ (URLSessionTask *)GET:(NSString *)URLString
             completion:(HttpUtilCompletion)completion
{
    return [self GET:URLString
          parameters:nil
            progress:nil
          completion:completion];
}

+ (URLSessionTask *)GET:(NSString *)URLString
             parameters:(id)parameters
               progress:(HttpUtilProgress)progress
             completion:(HttpUtilCompletion)completion
{
    return [self GET:URLString
          parameters:parameters
           needCache:YES
            progress:progress
          completion:completion];
}

+ (URLSessionTask *)GET_NOCACHE:URLString
                     parameters:(id)parameters
                       progress:(HttpUtilProgress)progress
                     completion:(HttpUtilCompletion)completion
{
    return [self GET:URLString
          parameters:parameters
           needCache:NO
            progress:progress
          completion:(HttpUtilCompletion)completion];
}

+ (URLSessionTask *)GET:(NSString *)URLString
             parameters:(id)parameters
              needCache:(BOOL)needCache
               progress:(HttpUtilProgress)progress
             completion:(HttpUtilCompletion)completion
{
    return [self GET:URLString
          parameters:parameters
           needCache:needCache
           needToken:YES
            progress:progress
          completion:completion];
}

+ (URLSessionTask *)GET:(NSString *)URLString
             parameters:(id)parameters
              needCache:(BOOL)needCache
              needToken:(BOOL)needToken
               progress:(HttpUtilProgress)progress
             completion:(HttpUtilCompletion)completion
{
    NSString *finalUrl = [[self currentDomain] stringByAppendingString:URLString];
    parameters = needToken?[self parametersWithToken:parameters]:parameters;
    
    NSUInteger index = 0;
    NSArray *allKeys = [parameters allKeys];
    if ([parameters isKindOfClass:[NSDictionary class]]) {
        //get方式一般都是在URL后面拼接参数
        //按照一般的URL格式拼接
        for (NSString*key in allKeys) {
            finalUrl = [finalUrl stringByAppendingString:index ? @"&" : @"?"];
            finalUrl = [finalUrl stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,parameters[key]]];
            index ++;
        }
    }
    finalUrl = [finalUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return URLSessionTaskMake([HttpManager GET:finalUrl
                                    parameters:nil
                                      progress:^(NSProgress * _Nonnull downloadProgress) {
                                          progress ? progress(downloadProgress) : NULL;
                                      } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          [self handleTask:task
                                         andResponseObject:responseObject
                                                     isGET:YES
                                                  cacheUrl:needCache ? finalUrl : nil
                                            withCompletion:completion
                                            onReverseBlock:^(BOOL isReverse) {
                                                
                                            }];
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          //网络不好的情况下，优先读取缓存
                                          if (needCache) {
                                              id cacheData = [Storage getCacheByGetMethodWithUrl:finalUrl];
                                              if (cacheData) {
                                                  if ([cacheData isKindOfClass:[NSDictionary class]]) {
                                                      !completion ?: completion(cacheData,YES,@"已读取本地缓存");
                                                  }else {
                                                      !completion ?: completion(nil,NO,UN_STATABLE_NET_MESSAGE);
                                                  }
                                              }else {
                                                  !completion ?: completion(nil,NO,UN_STATABLE_NET_MESSAGE);
                                              }
                                          }else {
                                              completion(nil,NO,UN_STATABLE_NET_MESSAGE);
                                          }
                                          
                                          NSHTTPURLResponse *response = (id)task.response;
                                          NSLog(@"task= %@",  [NSHTTPURLResponse localizedStringForStatusCode:response.statusCode]);
                                      }]);
}

+ (NSDictionary *)parametersWithToken:(NSDictionary *)parameters
{
    NSMutableDictionary *dict = [parameters?:@{} mutableCopy];
    NSString *token = SMUserDefaultGet(TOKEN_KEY)?:@"123456";
    [dict setObject:token forKey:@"token"];
    return dict;
}

+ (URLSessionTask *)POST:(NSString *)URLString
              parameters:(id)parameters
                progress:(HttpUtilProgress)progress
              completion:(HttpUtilCompletion)completion
{
    return [self POST:URLString
           parameters:parameters
            needToken:YES
             progress:progress
           completion:(HttpUtilCompletion)completion];
}

+ (URLSessionTask *)POST:(NSString *)URLString
              parameters:(id)parameters
                needToken:(BOOL)needToken
                progress:(HttpUtilProgress)progress
              completion:(HttpUtilCompletion)completion
{
    return URLSessionTaskMake([HttpManager POST: [self urlFactoryWithPix:URLString]
                                       parameters:needToken?[self parametersWithToken:parameters]:parameters
                                         progress:^(NSProgress * _Nonnull uploadProgress) {
                                             progress ? progress(uploadProgress) : NULL;
                                             
                                         }
                                          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                              
                                              [self handleTask:task
                                             andResponseObject:responseObject
                                                withCompletion:completion
                                                onReverseBlock:^(BOOL isReverse) {
                                                   /*
                                                    [self autoLoginOnResult:^(BOOL isSuccess, NSString *message) {
                                                        if (isSuccess) {
                                                            
                                                            [self POST:URLString
                                                            parameters:parameters
                                                              progress:progress
                                                            completion:completion ];
                                                        }else {
                                                            
                                                            completion(nil,NO,message);
                                                        }
                                                    }];
                                                    */
                                                }];
                                              
                                          }
                                          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                              
                                              //(网络不通的情况)请求失败的处理
                                              NSLog(@"task= %li",  (long)((NSHTTPURLResponse *)task.response).statusCode);
                                              completion(nil,NO,UN_STATABLE_NET_MESSAGE);
                                              
                                          }]);
}

//统一处理请求反馈
+ (void)handleTask:(NSURLSessionTask *)task
 andResponseObject:(id)responseObject
    withCompletion:(HttpUtilCompletion)completion
    onReverseBlock:(HttpUtilReverse)reverse
{
    [self handleTask:task
   andResponseObject:responseObject
               isGET:NO
            cacheUrl:nil
      withCompletion:completion
      onReverseBlock:reverse];
}

+ (void)handleTask:(NSURLSessionTask *)task
 andResponseObject:(id)responseObject
             isGET:(BOOL)isGET
          cacheUrl:(NSString *)cacheUrl
    withCompletion:(HttpUtilCompletion)completion
    onReverseBlock:(HttpUtilReverse)reverse
{
    if (!responseObject) {
        completion(nil,YES,@"无数据");
        reverse = nil;
    }
    else {
        NSDictionary *dict = [responseObject isKindOfClass:[NSDictionary class]] ? responseObject :
            [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSString *message  = dict[@"message"];
        if ([dict isKindOfClass:[NSDictionary class]] && [dict[@"code"] integerValue] == 1) //request successfully
        {
            //判断与缓存TOKEN
            [self cacheCookiesWithTask:task];
            [[NSURLCache sharedURLCache] removeAllCachedResponses];
            
            //保存缓存
            if (isGET&&cacheUrl) {
                [Storage saveCacheGetMethodDataWithUrl:cacheUrl withData:dict];
            }
            
            NSString *responseString = [[dict mj_JSONString] stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
            completion(dict,YES,message);
            reverse = nil;
            
        }else {
            
            //Token失效
            if ([dict[@"code"]integerValue] == 422) {
                reverse(YES);
            }else {
                //(与后台交互的情况)请求失败的处理
                completion(nil,NO,message ? message : @"网络请求超时");
                reverse = nil;
            }
        }
    }
}

//判断与缓存TOKEN
+ (void)cacheCookiesWithTask:(NSURLSessionTask *)task
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *) task.response;
    NSString *string =response.allHeaderFields[@"Set-Cookie"];
    NSRange range = [string rangeOfString:@"rememberMe" options:NSBackwardsSearch];//匹配得到的下标
    if (range.length) {
        string = [string substringFromIndex:range.location];
        [Storage saveAuthorizationToken:string];
    }
}

//URL factory
+ (NSString *)urlFactoryWithPix:(NSString *)pix
{
    NSString *finalUrl = [self.currentDomain stringByAppendingString:pix];
    finalUrl = [finalUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return finalUrl;
}
@end
