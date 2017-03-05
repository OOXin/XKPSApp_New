//
//  OrderViewModel.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "BaseViewModel.h"

@interface OrderViewModel : BaseViewModel

/**
 进行中的订单请求
 */
@property (nonatomic,strong)RACCommand *orderRunningListCommand;

/**
 历史订单数量请求
 */
@property (nonatomic,strong)RACCommand *orderHistoryNumCommand;

/**
 是否在线请求
 */
@property (nonatomic,strong)RACCommand *stateOnlineCommand;

/**
 是否签到请求
 */
@property (nonatomic,strong)RACCommand *stateSigninCommand;

/**
 在线状态
 */
@property (nonatomic,assign)NSInteger onlineState;

/**
 签到状态
 */
@property (nonatomic,assign)NSInteger signinState;

@end
