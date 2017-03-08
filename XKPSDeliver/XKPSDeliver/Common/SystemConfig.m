//
//  SystemConfig.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/24.
//  Copyright © 2017年 ccSunday. All rights reserved.
//
#import "SystemConfig.h"

void XKS_SwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@interface SystemConfig ()

/**
 存储各种本地信息的字典
 */
@property(nonatomic, strong)NSMutableDictionary *systemDic;

@end

@implementation SystemConfig

+ (instancetype)sharedSystemConfig{
    static id systemConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        systemConfig = [[self alloc] init];
    });
    return systemConfig;
}

- (id)init {
    if (self = [super init]) {
        _systemDic = [[NSMutableDictionary alloc]initWithContentsOfFile:[self getSystemConfigFile]];
        if (!_systemDic) {
            _systemDic = [NSMutableDictionary dictionary];
            [self saveSystemConfigData];
        }
    }
    return self;
}

+(NSUserDefaults *)shareSystemDefaults
{
    return [NSUserDefaults  standardUserDefaults];
}
-(NSString *)getSystemConfigFile
{
    NSString *pathString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    return [NSString stringWithFormat:@"%@/systemConfig.plist",pathString];
}
-(void)saveSystemConfigData
{
    [_systemDic writeToFile:[self getSystemConfigFile] atomically:YES];
}

-(void)clearSystemConfigData
{
    NSFileManager *fileManager = [ NSFileManager defaultManager];
    [fileManager removeItemAtPath:[self getSystemConfigFile] error:nil];
}
#pragma mark element
//是否第一次登陆
-(void)saveIfFirstTimeComein:(NSString *)iffirst
{
    [self.systemDic setValue:iffirst forKey:_IFFIRST_TIME_LOGIN_];
    [self saveSystemConfigData];
}
-(NSString *)getIfFirstTimeComein
{
    return (NSString *)[self.systemDic valueForKey:_IFFIRST_TIME_LOGIN_];
}

//设置手机UUID
-(void)saveUUID:(NSString *)uuidString
{
    [self.systemDic setValue:uuidString forKey:_UUID_STRING_];
    [self saveSystemConfigData];
}
-(NSString *)getUUIDString
{
    return (NSString *)[self.systemDic valueForKey:_UUID_STRING_];
}
//定位经纬度
//维度
-(void)saveUserLocationLatitude:(NSString *)latitude
{
    [self.systemDic setValue:latitude forKey:_LOCATION_LATITUDE_];
    [self saveSystemConfigData];
}
-(NSString *)getUserLocationLatitude
{
    return (NSString *)[self.systemDic valueForKey:_LOCATION_LATITUDE_];
}
//经度
-(void)saveUserLocationLongtitude:(NSString *)longtitude
{
    [self.systemDic setValue:longtitude forKey:_LOCATION_LONGTITUDE_];
    [self saveSystemConfigData];
}
-(NSString *)getUserLocationLongtitude
{
    return (NSString *)[self.systemDic valueForKey:_LOCATION_LONGTITUDE_];
}

//记录登陆状态
-(void)saveUserStatus:(NSString *)userStatus
{
    [self.systemDic setValue:userStatus forKey:_USER_STATUS_];
    [self saveSystemConfigData];
}
-(NSString *)getUserStatus
{
    return  (NSString *)[self.systemDic valueForKey:_USER_STATUS_];
}

//sesstionID
-(void)saveSesstionID:(NSString *)sessionid
{
    [self.systemDic setValue:sessionid forKey:_SESSION_ID_];
    [self saveSystemConfigData];
}
-(NSString *)getSessionId
{
    return (NSString *)[self.systemDic valueForKey:_SESSION_ID_];
}
//登陆时间
-(void)saveLoginTime:(NSString *)loginTime
{
    [self.systemDic setValue:loginTime forKey:_USER_LOGINTIME_];
    [self saveSystemConfigData];
}
-(NSString *)getLoginTime
{
    return (NSString *)[self.systemDic valueForKey:_USER_LOGINTIME_];
}
//客服电话
-(void)saveServiceNumber:(NSString *)serviceNum
{
    [self.systemDic setValue:serviceNum forKey:_SERVICE_NUMBER_];
    [self saveSystemConfigData];
}
-(NSString *)getServiceNumber
{
    return  [(NSString *)self.systemDic valueForKey:_SERVICE_NUMBER_];
}
//sleepTime
-(void)saveSleepTime:(NSString *)sleepTime
{
    [self.systemDic setValue:sleepTime forKey:_SLEEP_TIME_];
    [self saveSystemConfigData];
}
-(NSString *)getSleepTime
{
    return [(NSString *)self.systemDic valueForKey:_SLEEP_TIME_];
}
//on line status
-(void)saveOnlineStatus:(NSString *)onlineStatus
{
    [self.systemDic setValue:onlineStatus forKey:_ONLINE_STATUS_];
    [self saveSystemConfigData];
}
-(NSString *)getOnlineStatus
{
    return  [(NSString *)self.systemDic valueForKey:_ONLINE_STATUS_];
}
//poistionOffsetPeriod
-(void)savePositionOffsetPeriod:(NSString *)positionoffsetperiod
{
    [self.systemDic setValue:positionoffsetperiod forKey:_POSITION_OFFSET_PERIOD_];
    [self saveSystemConfigData];
}
-(NSString *)getPositionOffsetPeriod
{
    return [(NSString *)self.systemDic valueForKey:_POSITION_OFFSET_PERIOD_];
}
//sessiontimeout
-(void)saveSessionTimeOut:(NSString *)sessiontimeout
{
    [self.systemDic setValue:sessiontimeout forKey:_SESSIOIN_TIMEOUT_];
    [self saveSystemConfigData];
}
-(NSString *)getSessionTimeout
{
    return [(NSString *)self.systemDic valueForKey:_SESSIOIN_TIMEOUT_];
}
//配送距离
-(void)saveDistanceToStartAddress:(NSString *)distanceToStartAddress
{
    [self.systemDic setValue:distanceToStartAddress forKey:_DISTANCE_TO_STARTADDRESS_];
    [self saveSystemConfigData];
}
-(NSString *)getDistanceToStartAddress
{
    return  (NSString *)[self.systemDic valueForKey:_DISTANCE_TO_STARTADDRESS_];
}

//是否是第一次获取待接订单的信息
-(void)saveIFFirstTimeGetWaitingOrderList:(NSString *)ifFirstGetList
{
    [self.systemDic setValue:ifFirstGetList forKey:_IFFIRST_TIME_GETlIST_];
    [self saveSystemConfigData];
}
-(NSString *)getIfFirstGetWaitingOrderList
{
    return  (NSString *)[self.systemDic valueForKey:_IFFIRST_TIME_GETlIST_];
}

//是否第一次获取驻店订单信息
-(void)saveIFFirstTimeGetInStoreOrderList:(NSString *)ifFirstGetList
{
    [self.systemDic setValue:ifFirstGetList forKey:_IFFIRTT_TIME_GET_STORELIST];
}
-(NSString *)getIfFirstGetInStoreOrderList
{
    return  (NSString *)[self.systemDic valueForKey:_IFFIRTT_TIME_GET_STORELIST];
}


//本地待接订单数据
-(void)saveWaitingOrderList:(NSArray *)waitingOrderList
{
    [self.systemDic setValue:waitingOrderList forKey:_WAITING_ORDER_LIST_];
    [self saveSystemConfigData];
}
-(NSMutableArray *)getWaitingOrderList
{
    return  (NSMutableArray *)[self.systemDic valueForKey:_WAITING_ORDER_LIST_];
}
//本地待解驻点订单数据
-(void)saveInStoreOrderList:(NSArray *)inStoreOrderList
{
    [self.systemDic setValue:inStoreOrderList forKey:_INSTORE_ORDER_LIST_];
    [self saveSystemConfigData];
}
-(NSArray *)getInStoreOrderList
{
    return  (NSMutableArray *)[self.systemDic valueForKey:_INSTORE_ORDER_LIST_];
}

//进行中订单数据
-(void)saveRunningOrderList:(NSMutableArray *)runningOrderList
{
    [self.systemDic setValue:runningOrderList forKey:_RUNNING_ORDER_LIST_];
    [self saveSystemConfigData];
}
-(NSMutableArray *)getRunningOrder
{
    return (NSMutableArray *)[self.systemDic valueForKey:_RUNNING_ORDER_LIST_];
}



//从进行中订单获得的本地待接单数据
-(void)saveWaitingOrderlistFromRunningData:(NSMutableArray *)waitingOrderList
{
    [self.systemDic setValue:waitingOrderList forKey:_WAIT_ORDER_FROM_RUNNING_];
    [self saveSystemConfigData];
}
-(NSMutableArray *)getWaitingOrderListFromRunningData
{
    return  (NSMutableArray *)[self.systemDic valueForKey:_WAIT_ORDER_FROM_RUNNING_];
}
//保存推送消息
-(void)saveNoticeInfo:(NSArray *)noticeInfo
{
    [self.systemDic setValue:noticeInfo forKey:_NOTICE_INFO_];
    [self saveSystemConfigData];
}
-(NSArray *)getNoticeInfo
{
    return (NSArray *)[self.systemDic valueForKey:_NOTICE_INFO_];
}
//保存 channal_id
-(void)saveDeviceToken:(NSString *)deviceToken
{
    [self.systemDic setValue:deviceToken forKey:_DEVICE_TOKEN_];
    [self saveSystemConfigData];
}
-(NSString *)getDeviceToken
{
    return @"867676027328318";
    return  (NSString *)[self.systemDic valueForKey:_DEVICE_TOKEN_];
}
//保存指派订单
-(void)saveAssignOrder:(NSDictionary *)assignOrder
{
    [self.systemDic setValue:assignOrder forKey:_ASSIGN_ORDER_];
    [self saveSystemConfigData];
}
-(NSDictionary *)getAssignOrder
{
    return  (NSDictionary *)[self.systemDic valueForKey:_ASSIGN_ORDER_];
}

//快递员类型
-(void)saveDeliverType:(NSString *)deliverType
{
    [self.systemDic setValue:deliverType forKey:_DELIVER_TYPE_];
    [self saveSystemConfigData];
}

//  0-普通兼职（众包）	2-兼职小时工（众包小时工)
//  3-全职驻店 	4-驻店小时工  1-驻店兼职

-(NSString *)getDeliverType
{
    return  (NSString *)[self.systemDic valueForKey:_DELIVER_TYPE_];
}

//是否有抽奖订单
-(void)saveIfHasAwardOrder:(NSString *)haveAward
{
    [self.systemDic setValue:haveAward forKey:_IFHAVEAWARD_];
    [self saveSystemConfigData];
}
-(NSString *)getIfHasAwardOrder
{
    return  (NSString *)[self.systemDic valueForKey:_IFHAVEAWARD_];
}

//众包是否有抽奖活动
-(void)saveIfAmateurToGame:(NSString *)haveRight
{
    [self.systemDic setValue:haveRight forKey:_AMATEUR_GAME_RIGHT_];
    [self saveSystemConfigData];
}

//是否加入订单编号功能
-(void)saveIfHasOrderNo:(NSString *)ifhasOrder
{
    [self.systemDic setValue:ifhasOrder forKey:_IF_HAS_ORDER_];
    [self saveSystemConfigData];
}

- (NSString *)getIFHasOrderNo{
    return (NSString *)[self.systemDic valueForKey:_IF_HAS_ORDER_];
}

-(NSString *)getIFAmateurGameRight
{
    return  (NSString *)[self.systemDic valueForKey:_AMATEUR_GAME_RIGHT_];
}

//历史地址记录
-(void)saveHistoryAddress:(NSArray *)addressArray
{
    //    [self.systemDic setValue:addressArray forKey:_HISTORY_ADDRESS_];
    //    [self saveSystemConfigData];
    
    [[NSUserDefaults standardUserDefaults]setValue:addressArray forKey:_HISTORY_ADDRESS_];
}
-(NSArray *)getHistoryAddressArray
{
    
    return  (NSArray *)[[NSUserDefaults standardUserDefaults]valueForKey:_HISTORY_ADDRESS_];
    //   return  (NSArray *)[self.systemDic valueForKey:_HISTORY_ADDRESS_];
}

//历史店家记录
-(void)saveHistoryShopAddress:(NSArray *)shopAddressArray
{
    //    [self.systemDic setValue:shopAddressArray forKey:_HISTORY_SHOP_ADDRESS];
    //    [self saveSystemConfigData];
    [[NSUserDefaults standardUserDefaults]setValue:shopAddressArray forKey:_HISTORY_SHOP_ADDRESS];
    
}
-(NSArray *)getHistoryShopAddressArray
{
    return [(NSArray *)[NSUserDefaults standardUserDefaults]valueForKey:_HISTORY_SHOP_ADDRESS];
    // return (NSArray *)[self.systemDic valueForKey:_HISTORY_SHOP_ADDRESS];
}

//店家信息本地缓存
-(void)saveShopInfo:(NSArray *)shopInfo
{
    [self.systemDic setValue:shopInfo forKey:_SHOP_INFO_];
    [self saveSystemConfigData];
}

-(NSArray *)getShopInfo
{
    return (NSArray *)[self.systemDic valueForKey:_SHOP_INFO_];
}

//快递员店家
-(void)saveMainShopInfo:(NSDictionary *)mainShopInfo
{
    [[NSUserDefaults standardUserDefaults]setValue:mainShopInfo forKey:_MAIN_SHOP_INFO_];
}
-(NSDictionary *)getMainShopInfo
{
    return [(NSDictionary *)[NSUserDefaults standardUserDefaults]valueForKey:_MAIN_SHOP_INFO_];
}


- (BOOL)validateIDCardNumber:(NSString *)value {
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value) {
        return NO;
        
    }else {
        length = value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {//判断省份
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSArray *JYMArr = @[@"10X98765432",@"10x98765432"];
                for (int i = 0; i<JYMArr.count; i++) {
                    NSString *JYMX = JYMArr[i];
                    M = [JYMX substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                    if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                        return YES;// 检测ID的校验位
                    }else {
                        if (i != JYMArr.count-1) {
                            continue;
                        }else{
                            return NO;
                        }
                    }
                    
                }
                
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}
/**
 用户名存取
 */
- (void)saveUserName:(NSString *)userName{
    [self.systemDic setObject:userName forKey:USER_NAME];
    [self saveSystemConfigData];

}
- (NSString *)getUserName{
    return [self.systemDic objectForKey:USER_NAME];
}
/**
 用户密码存取
 */
- (void)saveUserPwd:(NSString *)userPwd{

    [self.systemDic setObject:userPwd forKey:USER_PWD];
    [self saveSystemConfigData];

}

- (NSString *)getUserPwd{
    return [self.systemDic objectForKey:USER_PWD];
}

- (UIImage *)imageByScalingToSize:(CGSize)targetSize andSourceImage:(UIImage *)sourceImage
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor < heightFactor) {
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage ;
}


@end

@implementation NSAttributedString (Additions)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size color:(nullable UIColor *)color
{
    if (string == nil) {
        return nil;
    }
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                 NSFontAttributeName: [UIFont systemFontOfSize:size]};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
    
    return attributedString;
}

@end

@implementation UIViewController (Additions)
- (void)XKS_addControllerToCurrentRootView{
    AppDelegate *delegate = XKS_APPDelegate;
    UIViewController *currentRootViewController = delegate.window.rootViewController;
    [currentRootViewController addChildViewController:self];
    self.view.frame = currentRootViewController.view.frame;
    [currentRootViewController.view addSubview:self.view];
}

- (void)XKS_dismissController
{
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.1, 1.1);
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

@end


