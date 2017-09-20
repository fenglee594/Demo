//
//  HttpUtils.h
//  Demo
//
//  Created by 李峰 on 2017/9/8.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLSessionTask.h"


typedef void(^HttpUtilCompletion)(id responseObject, BOOL isSuccess, NSString *message);
typedef void(^HttpUtilProgress)(NSProgress *progress);
typedef void(^HttpUtilReverse) (BOOL isReverse);


@interface HttpUtils : NSObject

/**
 *  启动网络请求
 */
+ (void)startRunning;

/**
 *  有缓存的GET请求1
 */
+ (URLSessionTask *)GET:(NSString *)URLString
             completion:(HttpUtilCompletion)completion;

/**
 *  有缓存的GET请求2
 */
+ (URLSessionTask *)GET:(NSString *)URLString
             parameters:(id)parameters
               progress:(HttpUtilProgress)progress
             completion:(HttpUtilCompletion)completion;

/**
 *  无缓存的GET请求
 */
+ (URLSessionTask *)GET_NOCACHE:URLString
                       parameters:(id)parameters
                         progress:(HttpUtilProgress)progress
                       completion:(HttpUtilCompletion)completion;


+ (URLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                needCache:(BOOL)needCache
                needToken:(BOOL)needToken
                 progress:(HttpUtilProgress)progress
               completion:(HttpUtilCompletion)completion;


+ (URLSessionTask *)POST:(NSString *)URLString
              parameters:(id)parameters
                progress:(HttpUtilProgress)progress
              completion:(HttpUtilCompletion)completion;

+ (URLSessionTask *)POST:(NSString *)URLString
              parameters:(id)parameters
               needToken:(BOOL)needToken
                progress:(HttpUtilProgress)progress
              completion:(HttpUtilCompletion)completion;

@end
