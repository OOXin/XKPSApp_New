//
//  XKS_LaunchView.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/27.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "XKS_LaunchView.h"

#define kSkipBtnWidth 65
#define kSkipBtnHeight 30
#define kSkipRightEdging 20
#define kSkipTopEdging 40

@interface XKS_LaunchView ()
@property (nonatomic, weak) UIImageView *launchImageView;
@property (nonatomic, weak) UIImageView *adImageView;
@property (nonatomic, weak) UIButton *skipBtn;
@end

@implementation XKS_LaunchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addlaunchImageView];
        
        [self addAdImageView];
        
        [self addSkipBtn];
    }
    
    return self;
}

- (void)addlaunchImageView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    _launchImageView = imageView;
}

- (void)addAdImageView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    _adImageView = imageView;
}

- (void)addSkipBtn
{
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    skipBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
    skipBtn.titleLabel.textColor = [UIColor whiteColor];
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    skipBtn.alpha = 0.92;
    skipBtn.layer.cornerRadius = 4.0;
    skipBtn.clipsToBounds = YES;
    [self addSubview:skipBtn];
    _skipBtn = skipBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _launchImageView.frame = self.bounds;
    _adImageView.frame = self.bounds;
    _skipBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - kSkipBtnWidth - kSkipRightEdging, kSkipTopEdging, kSkipBtnWidth, kSkipBtnHeight);
}


@end
