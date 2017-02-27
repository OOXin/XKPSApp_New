//
//  AppDelegate+BaiduMap.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate+BaiduMap.h"

@implementation AppDelegate (BaiduMap)

- (void)xks_setupBaiduMap{
    return;
    _baiduMapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_baiduMapManager start:@"lFyNA4KNqs0ZeNpBd81SOzge"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }

    self.locService = [[BMKLocationService alloc]init];
    self.locService.distanceFilter = kCLDistanceFilterNone;
    self.locService.desiredAccuracy = 10;
    self.locService.delegate =self;
    
    self.locService.pausesLocationUpdatesAutomatically = NO;
    self.locService.allowsBackgroundLocationUpdates    = YES;
    
    [self.locService startUserLocationService];

}
/**
 -(void)configBaiduMap
 {
 _baiduMapManager = [[BMKMapManager alloc]init];
 // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
 BOOL ret = [_baiduMapManager start:@"lFyNA4KNqs0ZeNpBd81SOzge"  generalDelegate:nil];
 if (!ret) {
 NSLog(@"manager start failed!");
 }
 
 _locService = [[BMKLocationService alloc]init];
 _locService.distanceFilter = kCLDistanceFilterNone;
 _locService.desiredAccuracy = 10;
 _locService.delegate =self;
 
 _locService.pausesLocationUpdatesAutomatically = NO;
 _locService.allowsBackgroundLocationUpdates    = YES;
 
 [_locService startUserLocationService];
 
 }

 */
@end
