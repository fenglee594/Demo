//
//  UIFont+Ext.m
//  Demo
//
//  Created by 李峰 on 2017/9/11.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "UIFont+Ext.h"

@implementation UIFont (Ext)


#define FONT(size)  font?font:[UIFont systemFontOfSize:size]
+ (UIFont *)customFontOfSize:(CGFloat)size
{
    return  [UIFont systemFontOfSize:size];
}

+ (UIFont *)customBoldFontOfSize:(CGFloat)size
{
    //UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)customEspeciallyBoldFontOfSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    return FONT(size);
}

+ (UIFont *)numFontOfSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"ArialMT" size:size];
    return FONT(size);
}

+ (UIFont *)numBoldFontOfSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"Arial-BoldMT" size:size];
    return FONT(size);
}

@end
