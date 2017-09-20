//
//  Navigator.h
//  Demo
//
//  Created by 李峰 on 2017/9/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseModel.h"

#define NaviPush(targetStr, info)   [Navigator pushActionWithTargetName:targetStr propertyInfo:info]
#define NaviPushAnimated(targetStr,info,BOOLEAN)     [Navigator pushActionWithTargetName:targetStr propertyInfo:info animated:BOOLEAN]
#define NaviPresent(targetStr,info)  [Navigator presentActionWithTargetName:targetStr property:info]
#define NaviPresentCtrl(targetCtrl,isAnimated) [Navigator presentActionWithTargetCtrl:targetCtrl animated:isAnimated]
#define NaviDismiss(completionBlock) [Navigator dismissActionWithComplection:completionBlock]
#define NaviDismissAnimated(BOOLEAN,completionBlock) [Navigator dismissActionAnimated:BOOLEAN onComplection:completionBlock]
#define NaviPopTo(targetStr)         [Navigator popActionToController:targetStr]
#define NaviPopAnimated(BOOLEAN)     [Navigator popAnimated:BOOLEAN]
#define NaviPopToRoot(animated)      [Navigator popToRoot:animated]


@class UINavigationController;
@interface Navigator : BaseModel

+ (void) startLoading;

/** push **/
+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info;

+ (void) pushActionWithTargetName:(NSString *)target
                     propertyInfo:(NSDictionary *)info
                         animated:(BOOL)animated;

/** pop **/
+ (void)popActionToController:(NSString *)target;

+ (void)popAnimated:(BOOL)animated;

+ (void)popToRoot:(BOOL)animated;

/** present **/
+ (void)presentActionWithTargetName:(NSString *)target
                           property:(NSDictionary *)info;

+ (void)presentActionWithTargetCtrl:(id)targetCtrl
                           animated:(BOOL)animated;

/** dismiss **/
+ (void)dismissActionWithComplection:(void (^)())completion;

+ (void)dismissActionAnimated:(BOOL)animated
                onComplection:(void (^)())completion;

@end
