//
//  OrderViewProtocoImpl.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "OrderViewProtocoImpl.h"

@implementation OrderViewProtocoImpl

-  (RACSignal *)requestOrderList:(NSString *)requestUrl{

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        return nil;
    }];
}

- (RACSignal *)requestOederListHistoryNum:(NSString *)requestUrl{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        return nil;
    }];
}

- (RACSignal *)changeOnlineStateTo:(NSInteger)state{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        return nil;
    }];
}

- (RACSignal *)changeSigninStateTo:(NSInteger)state{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        return nil;
    }];
}

@end
