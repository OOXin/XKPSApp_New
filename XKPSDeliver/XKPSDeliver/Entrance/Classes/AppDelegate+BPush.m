//
//  AppDelegate+BPush.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate+BPush.h"

@implementation AppDelegate (BPush)

- (void)xks_handleNotifications:(NSDictionary *)userInfo{

    [BPush handleNotification:userInfo];
}

- (void)xks_showlocalNofificationAtFront:(UILocalNotification *)notification identifierKey:(NSString *)notificationKey{
    [BPush showLocalNotificationAtFront:notification identifierKey:notificationKey];
}

- (void)xks_registerDeviceToken:(NSData *)deviceToken{
     [BPush registerDeviceToken:deviceToken];
     [BPush bindChannelWithCompleteHandler:^(id result, NSError *error) {
     // 需要在绑定成功后进行 settag listtag deletetag unbind 操作否则会失败
     if (result) {
     [BPush setTag:@"Mytag" withCompleteHandler:^(id result, NSError *error) {
     if (result) {
//  NSLog(@"设置tag成功");
     }
     }];
     }
     if (![result valueForKey:@"channel_id"]) {
//     [[SystemConfig shareSystemConfig]saveDeviceToken:@""];
     
     }else{
//     [[SystemConfig shareSystemConfig]saveDeviceToken:[result valueForKey:@"channel_id"]];
     }
     }];
}

- (void)xks_setupBPushWith:(UIApplication *)application and:(NSDictionary *)launchOptions{
    return;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 1.注册UserNotification,以获取推送通知的权限
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil];
        [application registerUserNotificationSettings:settings];
        // 2.注册远程推送
        [application registerForRemoteNotifications];
    } else {
        //iOS8之前,注册远程推送的方法
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeNewsstandContentAvailability | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    }    
    [BPush registerChannel:launchOptions apiKey:@"SEfYlptGGQ2LmA9mORX9OOYD" pushMode:BPushModeProduction withFirstAction:nil withSecondAction:nil withCategory:nil useBehaviorTextInput:YES isDebug:NO];
    // App 是用户点击推送消息启动
    NSDictionary *userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userInfo) {
        // NSLog(@"从消息启动:%@",userInfo);
        [BPush handleNotification:userInfo];
    }
}

- (void)xks_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    completionHandler(UIBackgroundFetchResultNewData);
    // 打印到日志 textView 中
    //  NSLog(@"********** iOS7.0之后 background **********");
    // 应用在前台 或者后台开启状态下，不跳转页面，让用户选择。
    if (application.applicationState == UIApplicationStateActive || application.applicationState == UIApplicationStateBackground) {
    }
    else//杀死状态下，直接跳转到跳转页面。
    {
    }
//    if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_NEW_ORDER_]) {
//        //自动推待接订单
//        // NSLog(@"userInfo user's info %@",userInfo);
//        pushType = _NOTI_NEW_ORDER_;
//        [self pushToViewWith:_NOTI_NEW_ORDER_];
//    }
//    else if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_CANCEL_ORDER_])
//    {
//        ALERT_VIEW(@"有订单被取消!");
//        [[NSNotificationCenter defaultCenter]postNotificationName:_NOTIFICATION_NAME_ object:@{@"notiState":_NOTI_CANCEL_ORDER_}];
//    }
//    else if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_UPDATE_ORDER_])
//    {
//        [[NSNotificationCenter defaultCenter]postNotificationName:_NOTIFICATION_NAME_ object:@{@"notiState":_NOTI_UPDATE_ORDER_}];
//    }
//    else if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_ASSIGN_ORDER_])
//    {
//        //指派
//        [[SystemConfig shareSystemConfig]saveAssignOrder:[userInfo valueForKey:@"order"]];
//        pushType  = _NOTI_ASSIGN_ORDER_;
//        //orderId
//        [self pushToViewWith:_NOTI_ASSIGN_ORDER_];
//    }
//    else if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_NEW_NOTICE_])
//    {
//        [self ToNoticeList];
//    }
//    else if ([[userInfo valueForKey:@"biz_action"]isEqualToString:_NOTI_AWARD_ORDER_])
//    {
//        pushType = _NOTI_AWARD_ORDER_;
//        [self pushToViewWith:_NOTI_AWARD_ORDER_];
//    }
}
@end
