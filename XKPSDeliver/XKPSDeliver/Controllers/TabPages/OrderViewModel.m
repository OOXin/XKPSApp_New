//
//  OrderViewModel.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "OrderViewModel.h"
#import "OrderViewProtocoImpl.h"

@interface OrderViewModel ()

@property (nonatomic,strong)OrderViewProtocoImpl *orderViewProtocolImpl;

@end

@implementation OrderViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    //列表数据
    self.orderRunningListCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        if ([input integerValue] == RealStatusNotReachable) {
            self.netWorkStatus = RealStatusNotReachable;
            return [RACSignal empty];
        }else{
            return [[self.orderViewProtocolImpl requestOrderList:@"列表"]doNext:^(id x) {
                //数据
                NSLog(@"数据");
            }];
        }
    }];
    //历史数目
    self.orderHistoryNumCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [self.orderViewProtocolImpl requestOederListHistoryNum:@"历史"];
    }];
    //在线状态
    self.stateOnlineCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [self.orderViewProtocolImpl changeOnlineStateTo:self.onlineState];
    }];
    //签到状态
    self.stateSigninCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        return [self.orderViewProtocolImpl changeSigninStateTo:self.signinState];
    }];
}

- (OrderViewProtocoImpl *)orderViewProtocolImpl{
    if (!_orderViewProtocolImpl) {
        _orderViewProtocolImpl = [[OrderViewProtocoImpl alloc]init];
    }
    return _orderViewProtocolImpl;
}
@end
