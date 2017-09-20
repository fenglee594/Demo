//
//  ViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/8.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 50, 30)];
//    btn.layer.cornerRadius = 5.f;
//    btn.layer.borderWidth = SM_SIZE(2);
//    btn.layer.borderColor = SM_redColor.CGColor;
//    btn.titleLabel.font = SM_CFont(30);
//    [btn setTitle:@"push" forState:UIControlStateNormal];
//    [btn setTitleColor:SM_redColor forState:UIControlStateNormal];
////    [btn setBackgroundImage:[UIImage imageWithColor:SM_whiteColor] forState:UIControlStateNormal];
//    [btn setTitleColor:SM_whiteColor forState:UIControlStateHighlighted];
//    [btn setBackgroundImage:[UIImage imageWithColor:SM_redColor] forState:UIControlStateHighlighted
//     ];
//    [self.view addSubview:btn];
    UIButton *pushBtton = [self buttonMakerWithTitle:@"push"];
    [self.view addSubview:pushBtton];
    [pushBtton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(150));
        make.top.equalTo(@(300));
        make.height.equalTo(@(30));
        make.width.equalTo(@(50));
    }];
    [pushBtton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *presentButton = [self buttonMakerWithTitle:@"present"];
    [self.view addSubview:presentButton];
    [presentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(pushBtton);
        make.top.equalTo(pushBtton.mas_bottom).equalTo(@(SM_SIZE(30)));
    }];
    [presentButton addTarget:self action:@selector(presentBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) btnClicked
{
    NaviPush(@"BaseViewController", @{@"title":@"push"});
}

- (void) presentBtnClicked
{
    NaviPresent(@"BaseViewController", (@{@"title":@"present",
                                          @"isPresented":@(YES)}));
}

- (UIButton *)buttonMakerWithTitle:(NSString *)title
{
    UIButton *btn = [UIButton new];
    btn.layer.cornerRadius = 5.f;
    btn.layer.borderWidth = SM_SIZE(2);
    btn.layer.borderColor = SM_redColor.CGColor;
    [btn.layer setMasksToBounds:YES];
    btn.titleLabel.font = SM_CFont(30);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:SM_redColor forState:UIControlStateNormal];
    [btn setTitleColor:SM_whiteColor forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageWithColor:SM_redColor] forState:UIControlStateHighlighted
     ];
    return btn;
}

@end
