//
//  OrderViewProtocol.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OrderViewProtocol <NSObject>
@optional

/**
 获取订单详情

 @param requestUrl 请求url
 @return    信号量
 */
- (RACSignal *)requestOrderList:(NSString *)requestUrl;

/**
 获取历史订单数目

 @param requestUrl url
 @return      signal
 */
- (RACSignal *)requestOederListHistoryNum:(NSString *)requestUrl;

/**
更改签到状态

 @param state 即将的状态
 @return 信号量
 */
- (RACSignal *)changeSigninStateTo:(NSInteger)state;
/**
 更改在线状态

 @param state  即将的状态
 @return    信号量
 */
- (RACSignal *)changeOnlineStateTo:(NSInteger)state;
@end
