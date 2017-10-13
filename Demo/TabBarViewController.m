//
//  TabBarViewController.m
//  Demo
//
//  Created by 李峰 on 2017/9/14.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"


@interface TabBarViewController ()

@end


@implementation TabBarViewController
{
    NSUInteger _index;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self addChildVc:[[HomeViewController alloc] init]
                   title:@"首页"
                   image:@"home"
           selectedImage:@"home_selected"];
        [self addChildVc:[[BaseViewController alloc] init]
                   title:@"通讯录"
                   image:@"contact"
           selectedImage:@"contact_selected"];
        [self addChildVc:[[BaseViewController alloc] init]
                   title:@"发现"
                   image:@"discover"
           selectedImage:@"discover_selected"];
        [self addChildVc:[[MineViewController alloc] init]
                   title:@"我的"
                   image:@"mine"
           selectedImage:@"mine_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (UIViewController *)addChildVc:(BaseViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    //customFont
    UIFont *customFont = SM_CFont(20);
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : SM_lightGrayColor,
                                                 NSFontAttributeName            : customFont
                                                 }
                                      forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : HEXCOLOR(@"4adb4e"),
                                                 NSFontAttributeName            : customFont
                                                 }
                                      forState:UIControlStateSelected];
    
    UINavigationController *navigationController = navigationCtrlMake(childVc);
    // 添加子控制器
    [self addChildViewController:navigationController];
    return childVc;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger selectIndex = [tabBar.items indexOfObject:item];
    if (selectIndex != _index) {
        [self animationWithIndex:selectIndex];
    }
}

- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray *tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews)
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
            [tabbarbuttonArray addObject:tabBarButton];
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.08;
    pulse.repeatCount = 1;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:0.7];
    pulse.toValue = [NSNumber numberWithFloat:1.2];
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
    
    _index = index;
}
@end
