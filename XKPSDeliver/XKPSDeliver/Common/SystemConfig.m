//
//  SystemConfig.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "SystemConfig.h"

void XKS_SwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@interface SystemConfig ()

/**
 存储各种本地信息的字典
 */
@property(nonatomic, strong)NSMutableDictionary *systemDic;

@end

@implementation SystemConfig

singletonImplementation(SystemConfig)

/**
 用户名存取
 */
- (void)saveUserName:(NSString *)userName{
    
    [self.systemDic setObject:userName forKey:USER_NAME];
}
- (NSString *)getUserName{
    return [self.systemDic objectForKey:USER_NAME];
}

/**
 用户密码存取
 */
- (void)saveUserPwd:(NSString *)userPwd{

    [self.systemDic setObject:userPwd forKey:USER_PWD];
}

- (NSString *)getUserPwd{
    return [self.systemDic objectForKey:USER_PWD];
}


- (NSMutableDictionary *)systemDic{
    if (!_systemDic) {
        _systemDic = [NSMutableDictionary dictionary];
    }
    return _systemDic;
}

@end

@implementation NSAttributedString (Additions)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(nullable UIColor *)color
{
    if (string == nil) {
        return nil;
    }
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                 NSFontAttributeName: [UIFont systemFontOfSize:size]};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
    
    return attributedString;
}

@end
