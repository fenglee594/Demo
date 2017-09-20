//
//  MainViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/14.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "MainViewController.h"
//#import "TabBarViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()

@property (nonatomic, weak) UIViewController *currentVCtrl;

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    _currentVCtrl = self.tabbarCtrl;
    [self.view addSubview:self.tabbarCtrl.view];
}

- (UIViewController *)currentViewController
{
    return _currentVCtrl;
}

- (TabBarViewController *)tabbarCtrl
{
    if (!_tabbarCtrl) {
        TabBarViewController *controller =  [TabBarViewController new];
        _tabbarCtrl = controller;
        [self addChildViewController:_tabbarCtrl];
        
    }
    return _tabbarCtrl;
}

@end
