//
//  FunctionBasic.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#ifndef FunctionBasic_h
#define FunctionBasic_h
/***************************** 快速单例方法  *****************************/
/**
 * 快速创建单例
 */

// 接口定义
#define singletonInterface(className)          + (instancetype)shared##className;
// 实现定义
// 在定义宏时 \ 可以用来拼接字符串
#define singletonImplementation(className) \
static className *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}
/***************************** 便捷方法  *****************************/
//当前时间戳
#define CURRENT_TIME [[NSDate date] timeIntervalSince1970] * 1000;
//图片
#define IMAGE(imageName) [UIImage imageNamed:imageName]
//按钮
#define CUSTOMBUTTON [UIButton buttonWithType:UIButtonTypeCustom]
//标签
#define UILABEL [[UILabel alloc] init]
//非空的字符串 避免输出null
#define UnNilStr(str) ((str && ![str isEqual:[NSNull null]])?str:@"")
// 弱引用
#define WEAK(obj)\
__weak typeof(obj) weak_##obj = obj; \
//RGB
#define RGB(__r,__g,__b) [UIColor colorWithRed:(1.0*(__r)/255 )\
green:(1.0*(__g)/255) \
blue:(1.0*(__b)/255)\
alpha:1]
//获取颜色
#define GetColor(color) [UIColor color]
//获取image
#define GetImage(imageName)  [UIImage imageNamed:imageName]
//获取font
#define GetFont(x) [UIFont systemFontOfSize:x]
//获取粗字体
#define GetBoldFont(x) [UIFont boldSystemFontOfSize:x]
//显示系统提示框，此方法用到的类已经废弃
#define ALERT_VIEW(STR) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:STR delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];[alert show];}
//获取appdelegate
#define XKS_APPDelegate  ((AppDelegate*)[UIApplication sharedApplication].delegate)

/****************************  自定义NSLog *****************************/
#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"<%s:%d> %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif


#endif /* FunctionBasic_h */


//各种方法宏定义
