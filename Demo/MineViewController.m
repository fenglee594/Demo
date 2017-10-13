//
//  MineViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/20.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *logoutBtton = [self buttonMakerWithTitle:@"注销"];
    [self.view addSubview:logoutBtton];
    [logoutBtton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(150));
        make.top.equalTo(@(300));
        make.height.equalTo(@(30));
        make.width.equalTo(@(50));
    }];
    [logoutBtton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (void)btnClicked
{
    NaviPresent(@"LoginViewController", (@{@"title":@"登录",@"isPresented":@(YES)}));
}
@end
