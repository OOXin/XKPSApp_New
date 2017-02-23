//
//  AppDelegate.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/11.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager *_baiduMapManager;
}
@property (strong, nonatomic) UIWindow *window;


@end

