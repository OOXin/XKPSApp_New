//
//  SystemSetViewController.m
//  XKSDeliver
//
//  Created by 同行必达 on 15/10/10.
//  Copyright © 2015年 同行必达. All rights reserved.
//

#import "SystemSetViewController.h"
#import "AppDelegate.h"

#import "LoginViewController.h"
//#import "common.h"
//#import "SystemDetailViewController.h"
//#import "SystemConfig.h"
//#import "LoginViewController.h"
//#import "NetWorkTool.h"
//#import "RemedyOrderViewController.h"
//#import "ChooseAddressViewController.h"
//#import "GroupManagerRemedyOrderVc.h"
//
////my
//#import "RegisterViewController.h"
//#import "QRCodeViewController.h"
@interface SystemSetViewController ()<UIAlertViewDelegate>
{
    HCDistributeSpaceGroup *group0;
    
    HCDistributeSpaceItem *passwordItem;//修改密码
    HCDistributeSpaceItem *phoneItem;   //绑定手机
    HCDistributeSpaceItem *mendianItem;//签到门店
    HCDistributeSpaceItem *clearItem;   //清除退出

    HCDistributeSpaceGroup *group1;
    HCDistributeSpaceItem *tonggaoItem; //通知通告
    HCDistributeSpaceItem *dingdanItem; //补加订单
    HCDistributeSpaceItem *inviteItem;  //邀请好友
    HCDistributeSpaceItem *budanItem;   //组长补单
    HCDistributeSpaceItem *systemItem;  //关于系统
    HCCommonItem          *logOutItem;  //退出登录

}
@end

@implementation SystemSetViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self deployLayout];
    
    [self connectToConfirmCouldRemedyOrder];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)setupGroups{
    WEAK(self);
    //第0组
    group0 = [self addCommonGroupWithHeader:nil];

    passwordItem = [HCDistributeSpaceItem itemWithTitle:@"修改密码" placeHolder:nil];
    passwordItem.rightImage = @"toNext";
    passwordItem.canEdit = NO;
    passwordItem.cellSelected = ^(id value){
//        [weak_self pushToNextView:_SYSPAGETITTLE1_];
    };
    phoneItem = [HCDistributeSpaceItem itemWithTitle:@"绑定手机" placeHolder:nil];
    phoneItem.rightImage = @"toNext";
    phoneItem.canEdit = NO;
    phoneItem.cellSelected = ^(id value){
//        [weak_self pushToNextView:_SYSPAGETITTLE2_];
    };
    mendianItem = [HCDistributeSpaceItem itemWithTitle:@"签到门店" placeHolder:nil];
    mendianItem.rightImage = @"toNext";
    mendianItem.canEdit = NO;
    mendianItem.cellSelected = ^(id value){
//        ChooseAddressViewController *chooseAddressVc = [[ChooseAddressViewController alloc]init];
//        chooseAddressVc.fromWhich = @"change_shop";
//        chooseAddressVc.keyWord = [[[SystemConfig sharedSystemConfig]getMainShopInfo]valueForKey:@"customerName"];
//        
//        [weak_self.navigationController pushViewController:chooseAddressVc animated:YES];
    };
    clearItem = [HCDistributeSpaceItem itemWithTitle:@"清除退出" placeHolder:nil];
    clearItem.rightImage = @"toNext";
    clearItem.canEdit = NO;

    clearItem.cellSelected = ^(id value){
        UIAlertView *clearDataAlert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否清除缓存数据\n 包括缓存，设置，账户等信息。" delegate:weak_self cancelButtonTitle:@"清除" otherButtonTitles:@"取消", nil];
        clearDataAlert.tag = 222;
        [clearDataAlert show];
    };
    [group0.items addObjectsFromArray:@[passwordItem,phoneItem,mendianItem,clearItem]];
    
    //第一组
    group1 = [self addCommonGroupWithHeader:nil];
    UILabel *header1Lb = UILABEL;
    header1Lb.size = CGSizeMake(WIDTH, 44);

    header1Lb.text = @"其他功能";
    header1Lb.textAlignment = NSTextAlignmentCenter;
    header1Lb.textColor = DarkTextColor;
    header1Lb.font = BOLDFONT(18);
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, header1Lb.height-0.5, WIDTH, 0.5)];
    lineView.backgroundColor = LineColourValue;
    [header1Lb addSubview:lineView];
    
    HCCommonItem *header1Item = [HCCommonItem associateObject:header1Lb withKey:@"header1Lb"];
    
    tonggaoItem = [HCDistributeSpaceItem itemWithTitle:@"通知通告" placeHolder:nil];
    tonggaoItem.canEdit = NO;
    tonggaoItem.rightImage = @"toNext";
    tonggaoItem.cellSelected = ^(id value){
//        [weak_self pushToNextView:_SYSPAGETITTLE4_];
    };

    dingdanItem = [HCDistributeSpaceItem itemWithTitle:@"补加订单" placeHolder:nil];
    dingdanItem.rightImage = @"toNext";
    dingdanItem.canEdit = NO;
    dingdanItem.cellSelected = ^(id value){
//        RemedyOrderViewController *remedyView = [[RemedyOrderViewController alloc]init];
//        [weak_self.navigationController pushViewController:remedyView animated:YES];
    };
    
    inviteItem = [HCDistributeSpaceItem itemWithTitle:@"邀请好友" placeHolder:nil];
    inviteItem.rightImage = @"toNext";
    inviteItem.canEdit = NO;
    inviteItem.cellSelected = ^(id value){
//        [weak_self pushToNextView:_SYSPAGETITILE7_];
    };
    
    budanItem = [HCDistributeSpaceItem itemWithTitle:@"组长补单" placeHolder:nil];
    budanItem.rightImage = @"toNext";
    budanItem.canEdit = NO;
    budanItem.cellSelected = ^(id value){
//        GroupManagerRemedyOrderVc *groupManagerRemedyOrderVc = [[GroupManagerRemedyOrderVc alloc]init];
//        [weak_self.navigationController pushViewController:groupManagerRemedyOrderVc animated:YES];
    };
    
    systemItem = [HCDistributeSpaceItem itemWithTitle:@"关于系统" placeHolder:nil];
    systemItem.rightImage = @"toNext";
    systemItem.canEdit = NO;
    systemItem.cellSelected = ^(id value){
//        [weak_self pushToNextView:_SYSPAGETITTLE6_];
    };
    UIView *footerView = [[UIView alloc]init];
    footerView.size = CGSizeMake(WIDTH, 200);
    footerView.backgroundColor = ROOT_VIEW_BGCOLOR;

    UIButton *logoutBtn = CUSTOMBUTTON;
    logoutBtn.frame = CGRectMake(12, 48,WIDTH-48*2, 44);
    logoutBtn.layer.cornerRadius = logoutBtn.height/2;
    logoutBtn.backgroundColor = Blue_Color;
    [logoutBtn setTitle:@"退出系统" forState:UIControlStateNormal];
    [logoutBtn setTitleColor:LIGHT_WHITE_COLOR forState:UIControlStateNormal];
    [[logoutBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //弹框确认直接请求数据
        UIAlertController *alterview = [UIAlertController alertControllerWithTitle:@"确定要退出么？" message:@"退出后，将无法正常接收新订单。" preferredStyle:UIAlertControllerStyleAlert];
        // 创建操作
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [weak_self logOut];
            LoginViewController *loginView = [[LoginViewController alloc]init];
            [loginView XKS_addControllerToCurrentRootView];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];

        [alterview addAction:okAction];
        [alterview addAction:cancelAction];
        // 添加操作（顺序就是呈现的上下顺序）
        [self presentViewController:alterview animated:YES completion:nil];

    }];
    logoutBtn.centerX = footerView.width/2;
    [footerView addSubview:logoutBtn];
    
    logOutItem = [HCCommonItem associateObject:footerView withKey:@"loutout"];
    [group1.items addObjectsFromArray:@[header1Item,tonggaoItem,dingdanItem,inviteItem,budanItem,systemItem,logOutItem]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)deployLayout
{
    self.bgNvaView.backgroundColor = Blue_Color;
    self.leftNavButton.hidden = YES;
    self.titleNavLabel.text = @"设置";
    [self.rightNavButton setImage:GetImage(@"phoneImage") forState:ASControlStateNormal];
}

- (void)rightNavButtonClick:(UIButton *)button{

    UIAlertAction *doneAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString * telUrl = [NSString stringWithFormat:@"tel://%@",[[SystemConfig sharedSystemConfig]getServiceNumber]];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:telUrl] options:[NSDictionary dictionary] completionHandler:nil];
        
    }];
    UIAlertAction *cancelAction= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要拨打电话么？" preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:doneAction];
    [alertVc addAction:cancelAction];
    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark alertview delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     if (alertView.tag == 222)
    {
        if (buttonIndex == 0) {
            // do clear
            NSString *deviceToken =[[SystemConfig sharedSystemConfig]getDeviceToken];
            
            [[SystemConfig sharedSystemConfig]saveUserName:@""];
            [[SystemConfig sharedSystemConfig]saveUserPwd:@""];
            [[SystemConfig sharedSystemConfig]clearSystemConfigData];
            
            [[SystemConfig sharedSystemConfig]saveDeviceToken:deviceToken];
            [self logOut];
            LoginViewController *loginView = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:loginView animated:YES];
        }
    }
//版本更新相关的代码
//     else if (alertView.tag == 333)
//     {
//         if (buttonIndex == 0) {
//             if ([[[UIDevice currentDevice] systemVersion] intValue] < 7)
//             {
//                 NSString * appstoreUrlString = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?mt=8&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software&id=%@",APPSTORE_APPID];
//                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstoreUrlString]];
//             }else
//             {
//                 NSString * appstoreUrlString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",APPSTORE_APPID];
//                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstoreUrlString]];
//             }
//             
//         }
//     }
}

-(void)pushToNextView:(NSString *)choice
{
//    SystemDetailViewController *sysDetailView = [[SystemDetailViewController alloc]init];
//    sysDetailView.fromWhich = choice;
//    [self.navigationController pushViewController:sysDetailView animated:YES];
}

- (BOOL)autoCheckFromAppStore
{
    BOOL result;
    //获取当前设备中应用的版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    CGFloat currentVersion = [[infoDic objectForKey:@"CFBundleVersion"] doubleValue];
    
    NSString *URL = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",APPSTORE_APPID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    [request setHTTPMethod:@"POST"];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:recervedData options:NSJSONReadingMutableContainers error:nil];
    NSArray *infoArray = [dic objectForKey:@"results"];
    NSString *lastVersion = nil;
    if ([infoArray count]) {
        NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
        lastVersion = [releaseInfo objectForKey:@"version"];
    }
    //判断两个版本是否相同
    if (currentVersion < [lastVersion intValue])
    {
        result = YES;//更新
    }
    else {
        
    }
    
    return result;
}

-(void)checkVersionAndUpdate
{
//    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//    CGFloat currentVersion = [[infoDic objectForKey:@"CFBundleVersion"] doubleValue];
//    
//    UIView *view = [[UIView alloc]init];
//    [NetWorkTool getRequestWithUrl:__checkVersionAndUpdate totalParam:@{@"nowDate":[NSString stringWithFormat:@"%@",[NSDate date]]} addProgressHudOn:view Tip:@"检测更新" successReturn:^(id successReturn) {
//        NSDictionary *jsonDict =[NSJSONSerialization JSONObjectWithData:successReturn options:NSJSONReadingAllowFragments error:nil];
//        //其它来源的安装
//        //[serverVersion doubleValue]
//        if ([[jsonDict valueForKey:@"checkVersion"]doubleValue] <= currentVersion) {
//            
//        }
//        else
//        {
//            
//        }
//        
//    } failed:^(id failed) {
//        
//    }];
}
-(void)logOut
{
    UIView *view = [[UIView alloc]init];
    
    [NetManager postRequestWithUrl:__logOut param:@{@"nowDate":[NSString stringWithFormat:@"%@",[NSDate date]]} addProgressHudOn:view Tip:@"" successReturn:^(id successReturn) {
        
    } failed:^(id failed) {
        
    }];

}

-(void)connectToConfirmCouldRemedyOrder{
    
    [NetManager getRequestWithUrl:__ifCouldRemedyOrder param:@{@"imei":[[SystemConfig sharedSystemConfig]getDeviceToken]} addProgressHudOn:nil Tip:nil successReturn:^(id successReturn) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:successReturn options:NSJSONReadingMutableLeaves error:nil];
        [[SystemConfig sharedSystemConfig]saveMainShopInfo:[jsonDict valueForKey:@"customerObj"]];
        [self setupGroups];
        [self resetItems:jsonDict];

    } failed:^(id failedReturn) {
        
    }];
}

- (void)resetItems:(NSDictionary *)dict{
    if (![[dict  valueForKey:@"isSignStore"]isEqualToString:@"Y"]) {            //隐藏掉0租的签到门店
        [group0.items removeObject:mendianItem];
    }
    if (![[[dict valueForKey:@"canBd"]stringValue]isEqualToString:@"1"]  ) {    //隐藏掉1租的补单功能
        [group1.items removeObject:budanItem];
    }
    if (![[dict valueForKey:@"isShareFriends"]isEqualToString:@"Y"]  ) {        //隐藏掉1租的邀请好友功能
        [group1.items removeObject:inviteItem];
    }
    [self.tableView reloadData];
}

@end
