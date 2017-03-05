//
//  SystemConfig.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

///存储用户数据的全局单例。

#import <Foundation/Foundation.h>
/*交换方法*/
extern void XKS_SwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

/*****************************************宏定义key值*********************************************************/
#define USER_NAME @"username"

#define USER_PWD  @"userpwd"

@interface SystemConfig : NSObject
singletonInterface(SystemConfig)

/**
 用户名存取
 */
- (void)saveUserName:(NSString *)userName;
- (NSString *)getUserName;

/**
 用户密码存取
 */
- (void)saveUserPwd:(NSString *)userPwd;
- (NSString *)getUserPwd;


/**
 清空本地信息
 */
- (void)clear;

/**
 将制定image转化成想要的尺寸

 @param targetSize 目标尺寸
 @param sourceImage 指定的image
 @return        image新的实例
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize andSourceImage:(UIImage *)sourceImage;

@end

@interface NSAttributedString (Additions)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(UIColor *)color;

@end

@interface UIViewController (Additions)

- (void)dismissController;

@end






