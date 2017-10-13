//
//  LoginViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/21.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong) UITextField *usernameTF;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIView *line_name;
@property (nonatomic, strong) UIView *line_password;
@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation LoginViewController

//- (void)loadView
//{
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = SM_lightBlueColor;
    scrollView.alwaysBounceVertical = YES;
//    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    self.navigationController.navigationBar.hidden = YES;
    [scrollView addSubview:self.imageV];
    [scrollView addSubview:self.usernameLabel];
    [scrollView addSubview:self.usernameTF];
    [scrollView addSubview:self.passwordLabel];
    [scrollView addSubview:self.passwordTF];
    [scrollView addSubview:self.line_name];
    [scrollView addSubview:self.line_password];
    [scrollView addSubview:self.loginButton];
//    [scrollView addSubview:self.loginBtn];
    
    [self setConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (UILabel *)usernameLabel
{
    if (!_usernameLabel) {
//        _usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SM_SIZE(40), 0, SM_SIZE(100), SM_SIZE(60))];
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.text = @"帐号";
        _usernameLabel.textColor = SM_whiteColor;
        _usernameLabel.font = SM_CFont(32);
        _usernameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _usernameLabel;
}

- (UIImageView *)imageV
{
    if (!_imageV) {
//        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake((SM_SCREEN_WIDTH-([UIImage imageNamed:@"ic_login_93x33_"].size.width)-1)/2, SM_SIZE(200), [UIImage imageNamed:@"ic_login_93x33_"].size.width, [UIImage imageNamed:@"ic_login_93x33_"].size.height)];
        _imageV = [UIImageView new];
        _imageV.image = [UIImage imageNamed:@"ic_login_93x33_"];
    }
    return _imageV;
}

- (UITextField *)usernameTF
{
    if (!_usernameTF) {
//        _usernameTF = [[UITextField alloc] initWithFrame:CGRectMake(SM_SIZE(150), SM_SIZE(500), SM_SIZE(500), SM_SIZE(60))];
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.font = SM_CFont(32);
        _usernameTF.textAlignment = NSTextAlignmentLeft;
        _usernameTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入帐号" attributes:@{NSForegroundColorAttributeName:HEXCOLOR(@"#CFCFD4")}];
    }
    return _usernameTF;
}

- (UILabel *)passwordLabel
{
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.text = @"密码";
        _passwordLabel.font = SM_CFont(32);
        _passwordLabel.textColor = SM_whiteColor;
        _passwordLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _passwordLabel;
}

- (UITextField *)passwordTF
{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.textColor = SM_whiteColor;
        _passwordTF.font = SM_CFont(32);
        _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName:HEXCOLOR(@"#CFCFD4")}];
    }
    return _passwordTF;
}

- (UIView *)line_name
{
    if (!_line_name) {
        _line_name = [[UIView alloc] init];
        _line_name.backgroundColor = [SM_whiteColor colorWithAlphaComponent:.5f];
    }
    return _line_name;
}

- (UIView *)line_password
{
    if (!_line_password) {
        _line_password = [[UIView alloc] init];
        _line_password.backgroundColor = [SM_whiteColor colorWithAlphaComponent:.5f];
    }
    return _line_password;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        _loginButton.layer.cornerRadius = 5.0f;
        _loginButton.clipsToBounds = YES;
        _loginButton.layer.borderWidth = SM_SIZE(1);
        _loginButton.layer.borderColor = SM_whiteColor.CGColor;
        [_loginButton setBackgroundImage:[[UIImage imageWithColor:SM_lightGrayColor] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)] forState:UIControlStateHighlighted];
        [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = SM_CFont(33);
        [_loginButton setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        [_loginButton setTitleColor:SM_lightBlueColor forState:UIControlStateHighlighted];
    }
    return _loginButton;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [self buttonMakerWithTitle:@"hello"];
    }
    return _loginBtn;
}

- (void) setConstraints
{
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(SM_SIZE(200)));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(20)));
        make.top.equalTo(@(SM_SIZE(450)));
        make.width.equalTo(@(SM_SIZE(100)));
        make.height.equalTo(@(SM_SIZE(60)));
    }];
    
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_usernameLabel.mas_right).offset(SM_SIZE(10));
        make.right.equalTo(self.view.mas_right).offset(SM_SIZE(-30));
        make.top.height.equalTo(_usernameLabel);
    }];
    
    [self.line_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameLabel.mas_bottom).offset(SM_SIZE(6));
        make.left.equalTo(_usernameLabel);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@(SM_SIZE(1)));
    }];
    
    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_usernameLabel);
        make.top.equalTo(_usernameLabel.mas_bottom).offset(SM_SIZE(50));
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_usernameTF);
        make.top.equalTo(_passwordLabel);
    }];
    
    [self.line_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_line_name);
        make.top.equalTo(_passwordLabel.mas_bottom).offset(SM_SIZE(6));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(_line_password.mas_bottom).offset(SM_SIZE(40));
        make.height.equalTo(@(SM_SIZE(70)));
        make.width.equalTo(@(SM_SCREEN_WIDTH-SM_SIZE(60)));
    }];
    
//    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.top.equalTo(_loginButton.mas_bottom).offset(SM_SIZE(40));
//        make.height.equalTo(@(SM_SIZE(70)));
//        make.width.equalTo(@(SM_SCREEN_WIDTH-SM_SIZE(60)));
//    }];
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
