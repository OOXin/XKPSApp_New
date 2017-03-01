//
//  OrderListCell.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "OrderListCell.h"

@interface OrderListCell ()

/**
 图片
 */
@property (nonatomic,strong)ASImageNode *OrderStateImgNode;

/**
 主标题
 */
@property (nonatomic,strong)ASTextNode *OrderStateMainTitleNode;

/**
 副标题
 */
@property (nonatomic,strong)ASTextNode *OrderStateSubTitleNode;

/**
 右侧数目
 */
@property (nonatomic,strong)ASTextNode *OrderStateNumNode;

/**
 线
 */
@property (nonatomic,strong)ASDisplayNode *OrderStateLineNode;

@end

@implementation OrderListCell

- (instancetype)initWithModel:(OrderListModel *)model{
    self = [super init];
    if (self) {
        self.backgroundColor = LIGHT_WHITE_COLOR;
        //图标
        ASImageNode *imageNode = [[ASImageNode alloc]init];
        _OrderStateImgNode = imageNode;
        _OrderStateImgNode.layerBacked = YES;
        _OrderStateImgNode.contentMode = PHImageContentModeAspectFit;
        _OrderStateImgNode.image = [UIImage imageNamed:model.img];
        [self addSubnode:_OrderStateImgNode];
        //主标题
        _OrderStateMainTitleNode = [[ASTextNode alloc]init];
        _OrderStateMainTitleNode.maximumNumberOfLines = 2;
        _OrderStateMainTitleNode.layerBacked = YES;
        _OrderStateMainTitleNode.attributedText = [NSAttributedString attributedStringWithString:model.mainTitle fontSize:18 color:DarkTextColor];
        [self addSubnode:_OrderStateMainTitleNode];
        //副标题
        ASTextNode *subTitleNode = [[ASTextNode alloc]init];
        subTitleNode.attributedText = [NSAttributedString attributedStringWithString:model.subTitle fontSize:12 color:LIGHT_GRAY_COLOR];
        _OrderStateSubTitleNode = subTitleNode;
        [self addSubnode:_OrderStateSubTitleNode];
        //右侧的数目
        ASTextNode *numNode = [[ASTextNode alloc]init];
        numNode.attributedText = [NSAttributedString attributedStringWithString:@"1" fontSize:11 color:LIGHT_GRAY_COLOR];
        _OrderStateNumNode = numNode;
        [self addSubnode:_OrderStateNumNode];
        //线
        ASDisplayNode *underLineNode = [[ASDisplayNode alloc]init];
        underLineNode.layerBacked = YES;
        underLineNode.backgroundColor = LineColourValue;
        [self addSubnode:underLineNode];
        _OrderStateLineNode = underLineNode;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    _OrderStateImgNode.style.preferredSize = CGSizeMake(40, 40);

    _OrderStateLineNode.style.preferredSize = CGSizeMake(constrainedSize.max.width, 0.5);

    _OrderStateMainTitleNode.style.flexShrink = 0.8;
    
    //主标题+附标题
    ASStackLayoutSpec *verticalStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentCenter alignItems:ASStackLayoutAlignItemsStart children:@[_OrderStateMainTitleNode,_OrderStateSubTitleNode]];
    verticalStackSpec.style.flexShrink = 1.0;
    verticalStackSpec.style.flexGrow = 1.0;

    //
    ASStackLayoutSpec *horStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:12 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_OrderStateImgNode,verticalStackSpec,_OrderStateNumNode]];
    
    ASInsetLayoutSpec *insetLayout = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(12, 10, 12, 20) child:horStackSpec];

    return insetLayout;    
}

@end
