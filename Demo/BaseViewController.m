//
//  BaseViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/13.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIView *navigationBarShadowView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SM_backGroundColor;
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_navibar_back_round_clear"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }
    
    if (_isPresented) {
        [self setupLeftCancelBarButton];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UITextField appearance] setTintColor:[SM_whiteColor colorWithAlphaComponent:0.7]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backAction
{
    if (self.navigationController.viewControllers.count > 1) {
        NaviPopAnimated(YES);
    }
    else {
        NaviDismiss(^{});
    }
}

- (void)setupLeftCancelBarButton
{
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_cancel_medium"]
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(backAction)];
}


- (void)dealloc
{
    [self.task cancel];
    NSLog(@"%@__dealloc",[self class]);
}


@end
