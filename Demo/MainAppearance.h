//
//  MainAppearance.h
//  Demo
//
//  Created by 李峰 on 2017/9/11.
//  Copyright © 2017年 李峰. All rights reserved.
//

#ifndef MainAppearance_h
#define MainAppearance_h
#import "UIColor+Ext.h"
#import "UIFont+Ext.h"

#define SMKeyWindow    [[UIApplication sharedApplication].delegate window]

/**
 *  px转换
 */
#define SM_SIZE(px) ((SM_SCREEN_WIDTH/375.f)*(px)/2.0f) //像素换算


/**
 *  字体
 */
#define SMFontSize(px)  (px/((SM_SCREEN_WIDTH/375.f)<1?2.6:2.2))
#define SM_CFont(px)    [UIFont customFontOfSize:SMFontSize(px)]                //自定义字体
#define SM_CBFont(px)   [UIFont customBoldFontOfSize:SMFontSize(px)]            //自定义粗体
#define SM_SFont(px)    [UIFont systemFontOfSize:SMFontSize(px)]                //系统字体
#define SM_SBFont(px)   [UIFont boldSystemFontOfSize:SMFontSize(px)]            //系统粗体
#define SM_NFont(px)    [UIFont numFontOfSize:SMFontSize(px)]                   //自定义数字字体
#define SM_NBFont(px)   [UIFont numBoldFontOfSize:SMFontSize(px)]               //自定义数字粗体

/**
 *  颜色
 */
#define SM_LemonColor       HEXCOLOR(@"f3cc05")     //柠檬
#define SM_waterBlueColor   HEXCOLOR(@"a1e1f3")     //水蓝
#define SM_lightBlueColor   HEXCOLOR(@"03AAF4")     //浅蓝
#define SM_backGroundColor  HEXCOLOR(@"#F1F1F2")    //底色
#define SM_lightGrayColor   HEXCOLOR(@"C4C4C4")     //浅灰
#define SM_grayColor        HEXCOLOR(@"787878")     //灰
#define SM_darkGrayColor    HEXCOLOR(@"394d52")     //深灰
#define SM_whiteColor       HEXCOLOR(@"ffffff")     //白
#define SM_blackColor       HEXCOLOR(@"000001")     //黑
#define SM_orangeColor      HEXCOLOR(@"#FF9802")    //橙色
#define SM_thumeColor       HEXCOLOR(@"#FEA500")    //主色FF2846
//#define SM_thumeColor       HEXCOLOR(@"#FF1744")
#define SM_placeholdColor   HEXCOLOR(@"E8E8E8")     //占位色
#define SM_dotRedColor      HEXCOLOR(@"#FE0002")    //提醒红色
#define SM_yellowSeaColor   HEXCOLOR(@"#FFAB00")    //海黄色
#define SM_redColor         HEXCOLOR(@"#FA3500")     //红色(价格)
#define SM_disableColor     RGBACOLOR(0, 0, 0,.26) //无能色
#define SM_sangouColor      HEXCOLOR(@"#FFEB01")    //闪购色
#define SM_naviSubColor     HEXCOLOR(@"#F9F9F9")    //导航栏次级颜色
#define SM_naviShadowColor  HEXCOLOR(@"#E3E3E3")     //导航栏阴影颜色


/**
 *  屏幕尺寸
 */

#define SM_SCREEN_SIZE      [UIScreen mainScreen].bounds.size               //屏宽高结构体
#define SM_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width         //屏宽
#define SM_SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height        //屏高


#endif /* MainAppearance_h */
