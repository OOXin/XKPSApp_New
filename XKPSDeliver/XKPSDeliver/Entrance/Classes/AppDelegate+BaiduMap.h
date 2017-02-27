//
//  AppDelegate+BaiduMap.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (BaiduMap)<BMKLocationServiceDelegate,BMKGeneralDelegate,CLLocationManagerDelegate>

/**
 初始化百度map
 */
- (void)xks_setupBaiduMap;

@end
