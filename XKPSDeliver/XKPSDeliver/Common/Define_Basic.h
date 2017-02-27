//
//  Define_Basic.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#ifndef Define_Basic_h
#define Define_Basic_h
/***************************** Keys And IDs *****************************/
/*AppID*/
#define APPSTORE_APPID   @"1051588705"
/*版本号*/
#define _VERSION_NUM_ @"1.11"
//#define GAODE_MAP_APIKEY @"f6a6549803a12e12d8949b8f1e7e2043"
/*百度地图apiKey*/
#define BAIDU_MAP_APIKEY    @"lFyNA4KNqs0ZeNpBd81SOzge"
/*IFLY apiKey*/
#define IFLY_APIKEY         @""
/*友盟apiKey*/
#define UMENG_APIKEY        @"56699da9e0f55ab39a002c87"
/*分享sdkKey*/
#define SHARE_SDK_APPKEY    @"d9ca1084af65"
/*新浪appKey*/
#define SINA_APPKEY         @"828853448"
/*新浪secret Key*/
#define SINA_SECRET_KEY     @"df9aa2e5440c67c38add4dd76c309904"
/*qq Appid*/
#define QQ_APPID            @"110503499"     //16进制 41DD7EEE
/*QQ APP KEY*/
#define QQ_APPKEY           @"9O4DO4OITEfc5Dor"
/*微信appdi*/
#define WECHAT_APPID        @"wx8a0ffafaf0cce226"
/*微信secret key*/
#define WECHAT_SECRET_KEY   @"1ac3516ddded1cbd3186537c7d1e7127"
/*JSPatch Appkey*/
#define JSPATCH_APPKEY @""
/*JSPatch RAS Publickey*/
#define JSPATCH_RAS_PUBLICKEY @""
/***************************** 接口URL  *****************************/
#ifdef DEBUG
//测试服务器
#define SERVICE_URL   @"http://101.200.90.137:20068/client"
#else
//正式服务器
#define SERVICE_URL   @"http://txbd.xiakesong.cn"
#endif
/***************************** 尺寸  *****************************/
#define WIDTH  ([[UIScreen mainScreen]bounds].size.width)
#define HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define SYSTEM_VERSION ([[UIDevice currentDevice].systemVersion floatValue])
#define UI_NAV_BAR_HEIGHT  (SYSTEM_VERSION < 7 ? 44:64)
#define UI_TAB_BAR_HEIGHT  49
#define UI_STATUS_BAR_HEIGHT (SYSTEM_VERSION < 7 ? 0:20)
/***************************** 颜色 *****************************/
//常用空白处背景色
#define ROOT_VIEW_BGCOLOR [UIColor colorWithHexString:@"0xefefef"]
//线条颜色
#define LineColourValue [UIColor colorWithHexString:@"0xe1e2e5"]
//深黑文字色
#define DarkTextColor   [UIColor colorWithHexString:@"0x333333"]
//正常文字色
#define LightTextColor  [UIColor colorWithHexString:@"0x666666"]
//灰色
#define LIGHT_GRAY_COLOR [UIColor colorWithHexString:@"0x999999"]
//白色
#define LIGHT_WHITE_COLOR [UIColor colorWithHexString:@"0xffffff"]
//绿色
#define GREEN_COLOR   [UIColor colorWithHexString:@"#00c9b2"]
//黄色
#define YELLOW_COLOR [UIColor colorWithHexString:@"#ffad2d"]
//红色
#define RED_COLOR     [UIColor colorWithHexString:@"#ff6464"]
//蓝色
#define Blue_Color     RGB(39, 91, 187);

/***************************** ios系统版本号  *****************************/
#define  IOS7_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 7.0)
#define  IOS8_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 8.0)
#define  IOS9_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 9.0)
#define  IOS10_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 10.0)

#endif /* Define_Basic_h */


//定义常量，比如各种key,ID,颜色，尺寸等等
