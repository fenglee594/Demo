//
//  MainConfigure.h
//  Demo
//
//  Created by 李峰 on 2017/9/11.
//  Copyright © 2017年 李峰. All rights reserved.
//

#ifndef MainConfigure_h
#define MainConfigure_h

#import "MainAppearance.h"
#import <MJExtension.h>
#import <Masonry.h>

#import "UIImage+Color.h"
#import "UIImage+Initial.h"

#import "Storage.h"
#import "Navigator.h"
#import "HttpUtils.h"


/**
 *  自定义NSLog打印(release模式下关闭)
 */
#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

#define NSLog(FORMAT, ...) nil

#endif

/**
 *  UD用户偏好简单存取操作
 */
#define SMUserDefault               [NSUserDefaults standardUserDefaults]
#define SMUserDefaultSet(key,value) [SMUserDefault setObject:value forKey:key];[SMUserDefault synchronize]
#define SMUserDefaultGet(key)       [SMUserDefault objectForKey:key]

#endif /* MainConfigure_h */
