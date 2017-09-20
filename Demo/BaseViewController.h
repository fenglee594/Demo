//
//  BaseViewController.h
//  Demo
//
//  Created by 李峰 on 2017/9/13.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainConfigure.h"

@interface BaseViewController : UIViewController
{
    UIView *backgroundView;
}

@property (nonatomic, strong) URLSessionTask *task;
//是否是present转场
@property (nonatomic, assign) BOOL isPresented;

//@property (nonatomic, strong) UINavigationBar *navigationBar;
//@property (nonatomic, strong) UINavigationItem *navigationItem;
//
//@property (nonatomic, assign) BOOL navigationBarHidden;
//@property (nonatomic, assign) BOOL navigationShadowHidden;
//@property (nonatomic, strong) UIColor *navigationColor;


- (void) backAction;

@end
