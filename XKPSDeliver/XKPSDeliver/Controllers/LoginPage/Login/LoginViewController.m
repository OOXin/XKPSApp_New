//
//  LoginViewController.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/28.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    
}
/**
 背景
 */
@property (nonatomic, strong)ASImageNode *backViewNode;

/**
 电话图标
 */
@property (nonatomic, strong)ASImageNode *phoneImgNode;

/**
 电话
 */
@property (nonatomic, strong)UITextField *phoneTextField;

/**
 密码图标
 */
@property (nonatomic, strong)ASImageNode *passwordImgNode;

/**
 密码
 */
@property (nonatomic, strong)UITextField *passwordTextField;

/**
 登录按钮
 */
@property (nonatomic, strong)ASButtonNode *loginNode;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (instancetype)init{
    if (self = [super init]) {
        [self addNodes];
    }
    return self;
}

- (void)addNodes{
    //背景node
    _backViewNode = [[ASImageNode alloc]init];
    _backViewNode.frame = self.view.bounds;
    _backViewNode.image = GetImage(@"loginBack");
    [self.node addSubnode:_backViewNode];
    
    //图标
    _phoneImgNode = [[ASImageNode alloc]init];
    _phoneImgNode.image = GetImage(@"phoneTf");
    _phoneImgNode.userInteractionEnabled = YES;
    _phoneImgNode.frame = CGRectMake(24, 0, WIDTH-48, 44);
    _phoneImgNode.view.centerY = self.view.centerY-50;
    [self.node addSubnode:_phoneImgNode];
    
    //电话输入框
    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(44, 0, _phoneImgNode.view.width-88, 44)];
    _phoneTextField.userInteractionEnabled = YES;
    _phoneTextField.font = GetFont(16);
    _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    [_phoneImgNode.view addSubview:_phoneTextField];

    //密码
    _passwordImgNode = [[ASImageNode alloc]init];
    _passwordImgNode.image = GetImage(@"passwordTf");
    _passwordImgNode.userInteractionEnabled = YES;
    _passwordImgNode.frame = CGRectMake(24, 0, WIDTH-48, 44);
    _passwordImgNode.view.top = _phoneImgNode.view.bottom+12;
    [self.node addSubnode:_passwordImgNode];
    
    //密码输入框
    
    _passwordTextField = [[UITextField alloc]init];
    _passwordTextField.frame = CGRectMake(44, 0, _passwordImgNode.view.width-88, 44);
    _passwordTextField.font = GetFont(16);
    _passwordTextField.textColor = LIGHT_GRAY_COLOR;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.userInteractionEnabled = YES;
    _passwordTextField.jk_maxLength = 11;
    _passwordTextField.keyboardType = UIKeyboardTypeAlphabet;
    [_passwordImgNode.view addSubview:_passwordTextField];
}

- (void)viewWillLayoutSubviews{

    [super viewWillLayoutSubviews];
    


}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
