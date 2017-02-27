//
//  AppDelegate+BPush.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (BPush)

/**
 初始化百度推送

 @param application 应用程序
 @param launchOptions 配置信息
 */
-(void)xks_setupBPushWith:(UIApplication *)application and:(NSDictionary *)launchOptions;

/**
 处理收到的推送消息

 @param userInfo 推送消息
 */
- (void)xks_handleNotifications:(NSDictionary *)userInfo;

/**
 * 本地推送在前台推送。默认App在前台运行时不会进行弹窗，在程序接收通知调用此接口可实现指定的推送弹窗。
 * @param notification 本地推送对象
 * @param notificationKey 需要前台显示的本地推送通知的标示符

 */
- (void)xks_showlocalNofificationAtFront:(UILocalNotification *)notification identifierKey:(NSString *)notificationKey;

/**
 * @brief 向云推送注册 device token，只有在注册deviceToken后才可以绑定
 * @param
 *     deviceToken - 通过 AppDelegate 中的 didRegisterForRemoteNotificationsWithDeviceToken 回调获取
 */
- (void)xks_registerDeviceToken:(NSData *)deviceToken;

/**
    收到推送后具体的界面跳转
 */
- (void)xks_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
