//
//  OrderRunningCell.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "OrderRunningCell.h"

@interface OrderRunningCell ()

/**
 年月日
 */
@property (nonatomic,strong)ASTextNode *OrderRunningDate;
/**
 时间：分秒
 */
@property (nonatomic,strong)ASTextNode *OrderRunningTime;

/**
 起始图标
 */
@property (nonatomic,strong)ASImageNode *OrderRunningFromIcon;

/**
 终点图标
 */
@property (nonatomic,strong)ASImageNode *OrderRunningToIcon;

/**
 起始点地理位置
 */
@property (nonatomic,strong)ASTextNode *OrderRunningFromSpace;

/**
 终点地理位置
 */
@property (nonatomic,strong)ASTextNode *OrderRunningToSpace;

/**
 订单编号
 */
@property (nonatomic,strong)ASTextNode *OrderRunningNumber;

/**
 订单状态
 */
@property (nonatomic,strong)ASTextNode *OrderRunningState;

@end

@implementation OrderRunningCell

- (instancetype)initWithData:(id)data{
    if (self = [super init]) {
        [self addNodes];
    }
    return self;
}

- (void)addNodes{

    _OrderRunningDate = [[ASTextNode alloc]init];
    _OrderRunningDate.maximumNumberOfLines = 2;
    _OrderRunningDate.layerBacked = YES;
    _OrderRunningDate.attributedText = [NSAttributedString attributedStringWithString:@"2017年9月26日30周" fontSize:14 color:DarkTextColor];
    [self addSubnode:_OrderRunningDate];
    
    _OrderRunningTime = [[ASTextNode alloc]init];
    _OrderRunningTime.maximumNumberOfLines = 2;
    _OrderRunningTime.layerBacked = YES;
    _OrderRunningTime.attributedText = [NSAttributedString attributedStringWithString:@"17:20:36" fontSize:14 color:LIGHT_GRAY_COLOR];
    [self addSubnode:_OrderRunningTime];

    _OrderRunningFromIcon = [[ASImageNode alloc]init];
    _OrderRunningFromIcon.layerBacked = YES;
    _OrderRunningFromIcon.contentMode = PHImageContentModeAspectFit;
    _OrderRunningFromIcon.image = [UIImage imageNamed:@"running_Order"];
    [self addSubnode:_OrderRunningFromIcon];

    
    _OrderRunningFromSpace = [[ASTextNode alloc]init];
    _OrderRunningFromSpace.maximumNumberOfLines = 2;
    _OrderRunningFromSpace.layerBacked = YES;
    _OrderRunningFromSpace.attributedText = [NSAttributedString attributedStringWithString:@"北京市朝阳区酒仙桥东路九号" fontSize:14 color:LIGHT_GRAY_COLOR];
    [self addSubnode:_OrderRunningFromSpace];

    
    _OrderRunningToIcon = [[ASImageNode alloc]init];
    _OrderRunningToIcon.layerBacked = YES;
    _OrderRunningFromIcon.contentMode = PHImageContentModeAspectFit;
    _OrderRunningFromIcon.image = [UIImage imageNamed:@"running_Order"];
    [self addSubnode:_OrderRunningFromIcon];
    
    
    _OrderRunningFromSpace = [[ASTextNode alloc]init];
    _OrderRunningFromSpace.maximumNumberOfLines = 2;
    _OrderRunningFromSpace.layerBacked = YES;
    _OrderRunningFromSpace.attributedText = [NSAttributedString attributedStringWithString:@"北京市朝阳区酒仙桥东路九号" fontSize:14 color:LIGHT_GRAY_COLOR];
    [self addSubnode:_OrderRunningFromSpace];
}



















@end
