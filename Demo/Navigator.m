//
//  Navigator.m
//  Demo
//
//  Created by 李峰 on 2017/9/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "Navigator.h"
#import "BaseNavigationController.h"
#import "MainViewController.h"

#define kNSingleTon     [Navigator singleton]

#define kNavigations    kNSingleTon->_navigations

#define kMainVCtrl      ((MainViewController *)SMKeyWindow.rootViewController)


@implementation Navigator
{
    UITabBarController  *_mainVC;
    NSMutableArray  *_navigations;
}


static Navigator *shareInstance = nil;
+ (instancetype) singleton
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
        shareInstance ->_navigations = [NSMutableArray arrayWithCapacity:0];
    });
    return shareInstance;
}

+ (void) startLoading
{
    SMKeyWindow.rootViewController = [[MainViewController alloc] init];
}


/**
 *  push
 **/
+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info
{
    [self pushActionWithTargetName:target propertyInfo:info animated:YES];
}

+ (void) pushActionWithTargetName:(NSString *)target
                     propertyInfo:(NSDictionary *)info
                         animated:(BOOL)animated
{
    UIViewController *vc = [self controllerWithTargetName:target propertyInfo:info];
    vc.hidesBottomBarWhenPushed = YES;
    [[self currentNavigationController] pushViewController:vc animated:animated];
}

/**
 *  present
 **/
+ (void)presentActionWithTargetName:(NSString *)target
                           property:(NSDictionary *)info
{
    [self presentActionWithTargetCtrl:[self controllerWithTargetName:target propertyInfo:info]
                             animated:NO];
}

+ (void)presentActionWithTargetCtrl:(UIViewController *)targetCtrl
                           animated:(BOOL)animated
{
    UINavigationController *navi = navigationCtrlMake(targetCtrl);
    [[self currentNavigationController] presentViewController:navi animated:YES completion:nil];
    [kNavigations addObject:navi];
}

/**
 *  dismiss
 **/
+ (void)dismissActionWithComplection:(void (^)())completion
{
    [self dismissActionAnimated:YES onComplection:completion];
}

+ (void)dismissActionAnimated:(BOOL)animated
                onComplection:(void (^)())completion
{
    if (!kNavigations.count) {
        return;
    }
    [[self currentNavigationController] dismissViewControllerAnimated:animated completion:completion];
    [kNavigations removeLastObject];
}

/**
 *  pop
 **/
+ (void)popActionToController:(NSString *)target
{
    UIViewController *targetController = nil;
    for (UIViewController *controller in ((UINavigationController *)[self currentNavigationController]).viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(target)]) {
            targetController = controller;
            break;
        }
    }
    !targetController ?({}): [[self currentNavigationController] popToViewController:targetController animated:YES];
}


+ (void)popAnimated:(BOOL)animated
{
    if ([[self currentNavigationController]viewControllers].count < 2) {
        return;
    }
    [[self currentNavigationController] popViewControllerAnimated:animated];
}

+ (void)popToRoot:(BOOL)animated
{
    [[self currentNavigationController]popToRootViewControllerAnimated:animated];
}




+ (UINavigationController *)currentNavigationController
{
    if (kNavigations.count) {
        return [kNavigations lastObject];
    }
    return (UINavigationController *)kMainVCtrl.tabbarCtrl.selectedViewController;
}

+ (id)controllerWithTargetName:(NSString *)target propertyInfo:(NSDictionary *)info
{
    Class class = NSClassFromString(target);
    UIViewController *vc = [[class alloc] init];
    
    for (NSString*key in info.allKeys) {
        id obj = info[key];
        [vc setValue:obj forKey:key];
    }
    return vc;
}




@end
