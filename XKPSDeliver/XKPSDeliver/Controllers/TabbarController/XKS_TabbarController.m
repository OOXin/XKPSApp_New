//
//  XKS_TabbarController.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "XKS_TabbarController.h"
#import "XKS_NavigationController.h"
#import "OrderViewController.h"
#import "AccountViewController.h"
#import "MapViewController.h"
#import "SystemViewController.h"

#import "OrderViewModel.h"

@interface XKS_TabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong)NSMutableArray *tabbarItems;

@end

@implementation XKS_TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabbarItems];    
}

- (void)setupTabbarItems{
    //设置文字颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    self.viewControllers = self.tabbarItems;
    self.tabBarController.tabBar.barTintColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (XKS_NavigationController *)addOneChildViewController:(UIViewController *)controller withTitle:(NSString *)title norImage:(NSString *)norImage selImage:(NSString *)selImage {
    
    //1.设置tabBarItem
    [self setChildViewController:controller withTitle:title norImage:norImage selImage:selImage];
    //2.封装一个导航控制器
    XKS_NavigationController *nav=[[XKS_NavigationController alloc] initWithRootViewController:controller];
    return nav;
}

- (void)setChildViewController:(UIViewController *)controller withTitle:(NSString *)title norImage:(NSString *)norImage selImage:(NSString *)selImage{
    //1.设置tabBarItem
    UITabBarItem *item = controller.tabBarItem;
    item.title = title;
    item.titlePositionAdjustment = UIOffsetMake(0, -5);
    item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    item.image = [[UIImage imageNamed:norImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSMutableArray *)tabbarItems{
    if (!_tabbarItems) {
        _tabbarItems = [NSMutableArray array];
        //订单页面
        OrderViewController *orderVC = [[OrderViewController alloc]init];
        [_tabbarItems addObject:[self addOneChildViewController:orderVC withTitle:@"订单" norImage:@"order_unselected" selImage:@"order_selected"]];
        //用户页面
        AccountViewController *accountVC = [[AccountViewController alloc]init];
        [_tabbarItems addObject:[self addOneChildViewController:accountVC withTitle:@"用户" norImage:@"account_unselected" selImage:@"account_selected"]];
        //地图
        MapViewController *mapVC = [[MapViewController alloc]init];
        [_tabbarItems addObject:[self addOneChildViewController:mapVC withTitle:@"地图" norImage:@"map_unselected" selImage:@"map_selected"]];
        //系统
        SystemViewController *systemVC = [[SystemViewController alloc]init];
        [_tabbarItems addObject:[self addOneChildViewController:systemVC withTitle:@"系统" norImage:@"system_unselected" selImage:@"system_selected"]];
    }
    
    return _tabbarItems;
}
@end
