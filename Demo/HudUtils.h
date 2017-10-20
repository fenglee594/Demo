//
//  HudUtils.h
//  Demo
//
//  Created by 李峰 on 2017/10/19.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseModel.h"

@interface HudUtils : BaseModel

+ (void)HUDInfo:(NSString *)title;

+ (void) HUDSuccess:(NSString *)title;

+ (void) HUDError:(NSString *)title;

+ (void) HUDLoading:(NSString *)title;

+ (void)HUDShieldLoading:(NSString *)title;


+ (void) HUDHide;

+ (void)HUDProgress:(float)progress status:(NSString *)status;

+ (void)HUDShieldProgress:(float)progress
                   status:(NSString *)status;

@end
