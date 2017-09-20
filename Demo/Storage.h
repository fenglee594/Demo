//
//  Storage.h
//  Demo
//
//  Created by 李峰 on 2017/9/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"


#define StorageSingleton [Storage shareInstance]

@interface Storage : BaseModel

/**
 *  缓存GET请求
 */
+ (void)saveCacheGetMethodDataWithUrl:(NSString *)url withData:(id)data;

/**
 *  获取已缓存的数据
 */
+ (id)getCacheByGetMethodWithUrl:(NSString *)url;

/**
 *  保存token
 */
+ (void)saveAuthorizationToken:(NSString *)token;

/**
 *  获取已保存的token
 */
+ (NSString *)authorizationToken;
@end
