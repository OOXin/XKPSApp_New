//
//  BaseViewModel.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

/**
 数据请求
 */
@property (nonatomic, strong)RACCommand *requestDataCommand;

/**
 网络状态
 */
@property (nonatomic, assign)RealReachability* netWorkStatus;
@end
