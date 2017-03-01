//
//  AppDelegate.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+BPush.h"
#import "AppDelegate+Umeng.h"
#import "AppDelegate+JSPatch.h"
#import "AppDelegate+BaiduMap.h"
#import "XKS_TabbarController.h"
#import "XKS_AdViewController.h"
#import "JPFPSStatus.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self xks_setupBaiduMap];
//    
//    [self xks_setupJSPatch];
//    
//    [self xks_setupUmeng];
//    
//    [self xks_setupBPushWith:application and:launchOptions];
    [self addMainWindow];
    
    [self addAdvertiseMentView];
    
#if defined(DEBUG)||defined(_DEBUG)
    
    [[JPFPSStatus sharedInstance] open];
    
#endif
  
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;

    return YES;
}

- (void)addMainWindow{
   
    XKS_TabbarController *tabBarVC = [[XKS_TabbarController alloc]init];
    
    tabBarVC.selectedIndex = 0;
    
    self.window.rootViewController = tabBarVC;
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)addAdvertiseMentView{
    UIViewController *rootViewController = self.window.rootViewController;
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    loginVC.SuccessLogin = ^(){
        NSLog(@"登陆成功");//判断有没有广告
    };
    [rootViewController addChildViewController:loginVC];
    loginVC.view.frame = rootViewController.view.frame;
    [rootViewController.view addSubview:loginVC.view];
    
//    XKS_AdViewController *launchController = [[XKS_AdViewController alloc]init];
//    [rootViewController addChildViewController:launchController];
//    launchController.view.frame = rootViewController.view.frame;
//    [rootViewController.view addSubview:launchController.view];
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
//    [self xks_handleNotifications:userInfo];
}

//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
////    [self xks_application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
//}
#pragma mark Push Notification
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

#pragma local notification
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
//    [self xks_showlocalNofificationAtFront:notification identifierKey:nil];
}

#pragma mark 设置deviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
//    [self xks_registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSString *error_str = [NSString stringWithFormat: @"%@", error];
    NSLog(@"Failed to get token, error:%@", error_str);
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [_locationManager stopUpdatingLocation];
}


@end
