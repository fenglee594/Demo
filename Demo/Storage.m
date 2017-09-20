//
//  Storage.m
//  Demo
//
//  Created by 李峰 on 2017/9/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "Storage.h"
#import "MainConfigure.h"

#define FileManager [NSFileManager defaultManager]
#define  CacheDirectory ((NSString *)[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) lastObject])
#define HttpCacheDirectory [CacheDirectory stringByAppendingPathComponent:@"http_get_cache"]

static NSString * const KAuthorizationToken = @"KAuthorizationToken";


@interface Storage()

@end

@implementation Storage

static Storage * shareInstance = nil;

+ (instancetype) shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}


+ (void)saveCacheGetMethodDataWithUrl:(NSString *)url withData:(id)data
{
    if (![FileManager fileExistsAtPath:HttpCacheDirectory isDirectory:nil]) {
        [FileManager createDirectoryAtPath:HttpCacheDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    NSString *filePath = [self cachePathWithUrl:url];
    [NSKeyedArchiver archiveRootObject:data toFile:filePath];
}


+ (id)getCacheByGetMethodWithUrl:(NSString *)url
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self cachePathWithUrl:url]];
}


+ (NSString *)cachePathWithUrl:(NSString *)url
{
    url = [url stringByReplacingOccurrencesOfString:@"http://" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    url = [url stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
    url = [url stringByReplacingOccurrencesOfString:@"&" withString:@"_"];
    url = [url stringByReplacingOccurrencesOfString:@"=" withString:@""];
    url = [url stringByReplacingOccurrencesOfString:@"." withString:@"-"];
    return [HttpCacheDirectory stringByAppendingPathComponent:url];
}


+ (void)saveAuthorizationToken:(NSString *)token
{
    if (token==nil || [token isEqualToString:@""]) {
        [SMUserDefault removeObjectForKey:KAuthorizationToken];
        [SMUserDefault synchronize];
        return;
    }
    SMUserDefaultSet(KAuthorizationToken, token);
}

+ (NSString *)authorizationToken
{
    return SMUserDefaultGet(KAuthorizationToken);
}
@end
