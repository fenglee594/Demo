//
//  BaseNavigationController.h
//  Demo
//
//  Created by 李峰 on 2017/9/13.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainConfigure.h"

#define  navigationCtrlMake(rootVC)\
[[BaseNavigationController alloc] initWithRootViewController:rootVC]

@interface BaseNavigationController : UINavigationController

@end
