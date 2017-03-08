//
//  LoginViewController.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/28.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

//login
#define ifsuccess               @"r"
#define sleepTime               @"m"
#define companyTelephone        @"t"
#define onlineStatus            @"s"
#define poistionOffsetPeriod    @"pot"
#define sessionTime             @"sessionTimeout"

//status
#define _status_online_ @"在线"
#define _status_rest_   @"休息"
#define _status_quit_   @"收工"

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
@property (nonatomic, strong)UIButton *loginNode;

/**
 注册按钮
 */
@property (nonatomic, strong)YYLabel *registerLb;

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
    _phoneTextField.placeholder = @"账户名称";
    _phoneTextField.textColor = LIGHT_WHITE_COLOR;
    _phoneTextField.font = GetFont(16);
    _phoneTextField.jk_maxLength = 11;
    _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    
    [[[_phoneTextField.rac_textSignal map:^id(id value) {
        return (NSString *)value;
    }]filter:^BOOL(NSString *value) {
        return value.length==11;
    }]subscribeNext:^(id x) {
        [[SystemConfig sharedSystemConfig]saveUserName:(NSString *)x];
    }];
    _phoneTextField.text = [[SystemConfig sharedSystemConfig]getUserName];
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
    _passwordTextField.placeholder = @"输入密码";
    _passwordTextField.font = GetFont(16);
    _passwordTextField.textColor = LIGHT_WHITE_COLOR;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.userInteractionEnabled = YES;
    _passwordTextField.text = [[SystemConfig sharedSystemConfig]getUserPwd];
    _passwordTextField.keyboardType = UIKeyboardTypeAlphabet;
    
    [[_passwordTextField.rac_textSignal map:^id(id value) {
        return (NSString *)value;
    }]subscribeNext:^(id x) {
        [[SystemConfig sharedSystemConfig]saveUserPwd:(NSString *)x];
    }];
    _passwordTextField.text = [[SystemConfig sharedSystemConfig]getUserPwd];

    [_passwordImgNode.view addSubview:_passwordTextField];
    
    //登陆按钮
    _loginNode = CUSTOMBUTTON;
    _loginNode.frame = CGRectMake(_passwordImgNode.view.left, _passwordImgNode.view.bottom+12, _passwordImgNode.view.width, 44);
    [_loginNode setTitle:@"登陆" forState:UIControlStateNormal];
    _loginNode.enabled = NO;
    _loginNode.titleLabel.font = GetFont(16);
    [_loginNode jk_setBackgroundColor:LIGHT_GRAY_COLOR forState:UIControlStateDisabled];
    [_loginNode jk_setBackgroundColor:GREEN_COLOR forState:UIControlStateNormal];
    [_loginNode setTitleColor:LIGHT_WHITE_COLOR forState:UIControlStateDisabled];
    [_loginNode setTitleColor:LIGHT_WHITE_COLOR forState:UIControlStateNormal];
    _loginNode.adjustsImageWhenHighlighted = NO;
    [[_loginNode rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        NSLog(@"登陆");
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self login];
    }];
    [self.node.view addSubview:_loginNode];
    //注册按钮
    WEAK(self);
    WEAK(_phoneTextField);
    WEAK(_passwordTextField);
    _registerLb = [[YYLabel alloc]initWithFrame:CGRectMake(_loginNode.right-40, _loginNode.bottom+12, 30, 14)];
    _registerLb.font = GetFont(14);
    _registerLb.text = @"注册";
    _registerLb.textColor = LIGHT_WHITE_COLOR;
    _registerLb.textAlignment = NSTextAlignmentCenter;
    _registerLb.textTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        RegisterViewController *registerVC = [[RegisterViewController alloc]init];
        XKS_NavigationController *loginNav = [[XKS_NavigationController alloc]initWithRootViewController:registerVC];
        registerVC.successRegist = ^(){
            weak__phoneTextField.text = [[SystemConfig sharedSystemConfig]getUserName];
            weak__passwordTextField.text = [[SystemConfig sharedSystemConfig]getUserPwd];
            [weak_self login];
        };
        [weak_self presentViewController:loginNav animated:YES completion:nil];
    };
    [self.node.view addSubview:_registerLb];
    
    RAC(self.loginNode, enabled) = [RACSignal combineLatest:@[_passwordTextField.rac_textSignal,_phoneTextField.rac_textSignal] reduce:^(NSString *password,NSString *username){
        return @(username.length==11&&password.length>0);
    }];

    
}

- (void)login{
    if (![[[SystemConfig sharedSystemConfig]getUserName]isEqualToString:_phoneTextField.text]) {
        [[SystemConfig sharedSystemConfig]clearSystemConfigData];
    }
    NSDictionary *dict = @{@"n":[[SystemConfig sharedSystemConfig]getUserName],@"p":[[SystemConfig sharedSystemConfig]getUserPwd]};
    [NetManager postRequestWithUrl:__userLogin param:dict addProgressHudOn:self.view Tip:nil successReturn:^(id successReturn) {
        NSLog(@"successreturn%@",successReturn);
        NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:successReturn options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"jsondict=%@",responseJSON);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self XKS_dismissController];
        if (self.SuccessLogin) {
            self.SuccessLogin();
        }
        return ;

        
        if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"1"]) {
            
            [[SystemConfig sharedSystemConfig]saveLoginTime:[NSString stringWithFormat:@"%@",[NSDate date]]];
            [[NSUserDefaults standardUserDefaults]setValue:[NSDate date] forKey:@"uploadtime"];
            
            [[SystemConfig sharedSystemConfig]saveOnlineStatus:[responseJSON valueForKey:_ONLINE_STATUS_]];
            [[SystemConfig sharedSystemConfig]saveUserStatus:_status_online_];
            
            [[SystemConfig sharedSystemConfig]saveSleepTime:[responseJSON valueForKey:_SLEEP_TIME_]];
            [[SystemConfig sharedSystemConfig]saveServiceNumber:[responseJSON valueForKey:_SERVICE_NUMBER_]];
            [[SystemConfig sharedSystemConfig]savePositionOffsetPeriod:[responseJSON valueForKey:_POSITION_OFFSET_PERIOD_]];
            [[SystemConfig sharedSystemConfig]saveSessionTimeOut:[responseJSON valueForKey:_SESSIOIN_TIMEOUT_]];
            [self XKS_dismissController];
            
            if (self.SuccessLogin) {
                self.SuccessLogin();
            }
        }
        else if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"74"])
        {
            ALERT_VIEW(@"您被禁止登陆，详情请咨询客服,客服电话：进入绑定手机页面点击右上角");
        }
        else if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"-1331"])
        {
            ALERT_VIEW(@"不匹配的IMEI码，请绑定当前手机或使用已绑定手机");
        }
        else if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"-1333"])
        {
            ALERT_VIEW(@"请绑定手机");
        }
        else if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"4"])
        {
            ALERT_VIEW(@"错误的登录名或密码");
        }
        else if ([[responseJSON valueForKey:ifsuccess]isEqualToString:@"-1332"])
        {
            ALERT_VIEW(@"未提交IMEI码");
        }
    } failed:^(id failedReturn) {
        
    }];
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
