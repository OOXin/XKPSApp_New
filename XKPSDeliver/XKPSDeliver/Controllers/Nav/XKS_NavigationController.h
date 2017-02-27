//
//  XKS_NavigationController.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKS_NavigationController : UINavigationController<UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL enableRightGesture; // default YES

@end
