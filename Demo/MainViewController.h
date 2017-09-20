//
//  MainViewController.h
//  Demo
//
//  Created by 李峰 on 2017/9/14.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseViewController.h"
#import "TabBarViewController.h"

@class BaseNavigationController;
@interface MainViewController : BaseViewController

@property (nonatomic, weak) TabBarViewController *tabbarCtrl;
@end
