//
//  RootViewController.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/12.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init
{
    if (self = [super initWithNode:[ASDisplayNode new]]) {
        NSLog(@"Root Init");

    }
    return self;
}

- (void)addBasicNodes{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = ROOT_VIEW_BGCOLOR;
    //背景
    _bgNvaView = [[ASDisplayNode alloc]init];
    _bgNvaView.frame = CGRectMake(0, 0, WIDTH, UI_NAV_BAR_HEIGHT);
    _bgNvaView.backgroundColor = LIGHT_WHITE_COLOR;
    [self.node addSubnode:_bgNvaView];
    //标题
    _titleNavLabel = [[UILabel alloc]init];
    _titleNavLabel.frame = CGRectMake(WIDTH/2-150, 0, 300, UI_NAV_BAR_HEIGHT);
    _titleNavLabel.textAlignment = NSTextAlignmentCenter;
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:16.0f] ,NSForegroundColorAttributeName: DarkTextColor};
    _titleNavLabel.textColor = LIGHT_WHITE_COLOR;
    _titleNavLabel.attributedText = [[NSAttributedString alloc]initWithString:@"" attributes:attrs];
    [_bgNvaView.view addSubview:_titleNavLabel];
    
    //导航栏下的线
    _lineView = [[ASDisplayNode alloc]init];
    _lineView.frame = CGRectMake(0, _bgNvaView.view.height-0.5, WIDTH, 0.5);
    _lineView.backgroundColor = LineColourValue;
    [_bgNvaView addSubnode:_lineView];
    
    //左侧按钮
    _leftNavButton = [[ASButtonNode alloc]init];
    _leftNavButton.frame = CGRectMake(0, 0, 44, 44);
    _leftNavButton.view.centerY = _bgNvaView.view.centerY+12;
    [_leftNavButton setImage:GetImage(@"nav_back_light") forState:ASControlStateNormal];
    [_leftNavButton addTarget:self action:@selector(backButtonClick:) forControlEvents:ASControlNodeEventTouchUpInside];
    [_bgNvaView addSubnode:_leftNavButton];
   
    //右侧按钮
    _rightNavButton = [[ASButtonNode alloc]init];
    _rightNavButton.frame = CGRectMake(WIDTH-44, _bgNvaView.view.centerY, 44, 44);
    _rightNavButton.view.centerY = _leftNavButton.view.centerY;
    [_rightNavButton setImage:GetImage(@"") forState:ASControlStateNormal];
    [_rightNavButton addTarget:self action:@selector(backButtonClick:) forControlEvents:ASControlNodeEventTouchUpInside];
    [_bgNvaView addSubnode:_rightNavButton];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBasicNodes];

    // Do any additional setup after loading the view.
    NSLog(@"Root view did load system");

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self isRootViewController]) {
        self.bgNvaView.backgroundColor = Blue_Color;
        self.leftNavButton.hidden = YES;
    }else{
        self.bgNvaView.backgroundColor = GREEN_COLOR;
        self.leftNavButton.hidden = NO;
        self.titleNavLabel.text = @"导航栏二";
        self.bgNvaView.hidden = NO;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)backButtonClick:(ASButtonNode *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonClick:(ASButtonNode *)button{
    
    NSLog(@"right button clicked");

}

- (BOOL)isRootViewController
{
    return (self == self.navigationController.viewControllers.firstObject);
}
@end
