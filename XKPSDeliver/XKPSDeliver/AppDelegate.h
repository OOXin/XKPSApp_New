//
//  AppDelegate.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>
//baiduMap
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
//baiduPush
#import <BPushSDK/BPush.h>
//JSPatch
#import <JSPatchPlatform/JSPatch.h>
//Umeng
#import <UMMobClick/MobClick.h>
#import <UMengUShare/UMSocialWechatHandler.h>
#import <UMengUShare/UMSocialQQHandler.h>
#import <UMengUShare/UMSocialSinaHandler.h>
//#import <>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager *_baiduMapManager;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) CLLocationManager* locationManager;

@property (nonatomic, retain)BMKLocationService *locService;

@property (nonatomic,strong)NSDictionary *intervalCheckOrderDict;


@end

