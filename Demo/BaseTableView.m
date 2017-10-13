//
//  BaseTableView.m
//  Demo
//
//  Created by 李峰 on 2017/9/27.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

//- (instancetype)init
//{
//    if (self=[super init]) {
//        [self configure];
//    }
//    return self;
//}

//- (void)configure
//{
//
//}

- (void)dealloc
{
    NSLog(@"%@__dealloc",NSStringFromClass(self.class));
}
@end
