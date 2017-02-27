//
//  UINavigationController+Push.m
//  SpaceHome
//
//  Created by ccSunday on 16/8/1.
//
//

#import "UINavigationController+PushPop.h"

@implementation UINavigationController (PushPop)
+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(pushViewController:animated:));
    Method b = class_getInstanceMethod(self, @selector(SHpushViewController:animated:));
    method_exchangeImplementations(a, b);
    
    Method c  = class_getInstanceMethod(self, @selector(popViewControllerAnimated:));
    Method d = class_getInstanceMethod(self, @selector(SHpopViewControllerAnimated:));
    method_exchangeImplementations(c, d);
}

- (void)SHpushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count>=1) {
        viewController.hidesBottomBarWhenPushed = YES;
        self.viewControllers.firstObject.hidesBottomBarWhenPushed = NO;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(navGoBack)];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(navRight)];

    }
    [self SHpushViewController:viewController animated:YES];
    
}

- (UIViewController *)SHpopViewControllerAnimated:(BOOL)animated{
    
    return [self SHpopViewControllerAnimated:animated];
}

- (void)navGoBack
{
    [self popViewControllerAnimated:YES];
}

- (void)navRight{

}

- (void)configureNavBarTheme
{
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    // 设置导航栏的标题颜色，字体
    NSDictionary* textAttrs = @{NSForegroundColorAttributeName:
                                    [UIColor whiteColor],
                                NSFontAttributeName:
                                    [UIFont fontWithName:@"Helvetica"size:18.0],
                                };
    [self.navigationBar setTitleTextAttributes:textAttrs];
    
    //设置导航栏的背景图片
    [self.navigationBar setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
    
    // 去掉导航栏底部阴影
    [self.navigationBar setShadowImage:[[UIImage alloc]init]];
    
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = (CGRect){CGPointZero,CGSizeMake(1.0, 1.0)};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
