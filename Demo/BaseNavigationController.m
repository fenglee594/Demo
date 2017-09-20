//
//  BaseNavigationController.m
//  Demo
//
//  Created by 李峰 on 2017/9/13.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //全局设置UIBarButtonItem的位置
//    [[UIBarButtonItem appearance] setBackgroundVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
//    //修改UIBarButtonItem中文字的位置
//    [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 2) forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barStyle = UIBarStyleBlack;
//    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:SM_blackColor]
//                            forBarPosition:UIBarPositionTopAttached
//                                barMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *textAttrs              = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]   = SM_whiteColor;
    textAttrs[NSFontAttributeName]              = SM_CBFont(38);
    
    [self.navigationBar setTitleTextAttributes:textAttrs];
    [self.navigationBar setTintColor:SM_whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@__dealloc",[self class]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
