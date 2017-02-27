//
//  AppDelegate+Umeng.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate+Umeng.h"

#define UMENG_APIKEY        @"56699da9e0f55ab39a002c87"
#define SHARE_SDK_APPKEY    @"d9ca1084af65"

//SINA
#define SINA_APPKEY         @"828853448"
#define SINA_SECRET_KEY     @"df9aa2e5440c67c38add4dd76c309904"

//QQ
#define QQ_APPID            @"110503499"     //16进制 41DD7EEE
#define QQ_APPKEY           @"9O4DO4OITEfc5Dor"

//WECHANT
#define WECHAT_APPID        @"wx8a0ffafaf0cce226"
#define WECHAT_SECRET_KEY   @"1ac3516ddded1cbd3186537c7d1e7127"


@implementation AppDelegate (Umeng)

- (void)xks_setupUmeng{
    return;
    UMAnalyticsConfig *configure = [UMAnalyticsConfig sharedInstance];
    configure.appKey = UMENG_APIKEY;
    configure.ePolicy = BATCH;
    [MobClick startWithConfigure:configure];
    
//    [UMSocialData setAppKey:UMENG_APIKEY];

//    + (void) startWithConfigure:(UMAnalyticsConfig *)configure;

    
    
//    [MobClick startWithAppkey:UMENG_APIKEY reportPolicy:BATCH channelId:nil];
//    [UMSocialData setAppKey:UMENG_APIKEY];
//    //打开调试log的开关
//    // [UMSocialData openLog:YES];
    
//    [UMSocialWechatHandler defaultManager]
//    [UMSocialWechatHandler setWXAppId:WECHAT_APPID appSecret:WECHAT_SECRET_KEY url:@"http://www.umeng.com/social"];
//    [UMSocialQQHandler setQQWithAppId:QQ_APPID appKey:QQ_APPKEY url:@"http://www.umeng.com/social"];
//    //  http://www.umeng.com/social
//    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];


}
@end
