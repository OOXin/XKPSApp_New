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

@interface SystemConfig : NSObject

singletonInterface(SystemConfig)

@end

@interface NSAttributedString (Additions)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(UIColor *)color;

@end

