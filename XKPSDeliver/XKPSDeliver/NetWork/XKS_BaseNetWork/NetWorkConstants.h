//
//  NetWorkConstants.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/6.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#ifndef NetWorkConstants_h
#define NetWorkConstants_h

/***************************************** 服务器环境  *****************************************/
#ifdef DEBUG
//测试服务器
#define SERVICE_URL   @"http://101.200.90.137:20068/client"
#else
//正式服务器
#define SERVICE_URL   @"http://txbd.xiakesong.cn"
#endif

/********************************************* URL  *****************************************/
//command
#define __userLogin       [NSString stringWithFormat:@"%@/user.login",SERVICE_URL]

#define __changePassword  [NSString stringWithFormat:@"%@/m/setting/pwd",SERVICE_URL]

#define __bundleDevice    [NSString stringWithFormat:@"%@/m/binddevice/info",SERVICE_URL]

#define __uploadLocation  [NSString stringWithFormat:@"%@/m/p",SERVICE_URL]

#define __checkDevice         [NSString stringWithFormat:@"%@/m/binddevice/info",SERVICE_URL]

#define __logOut           [NSString stringWithFormat:@"%@/m/logout",SERVICE_URL]

//TAB 4
#define __shareAndInvite     [NSString stringWithFormat:@"%@/m/tpromocode/info",SERVICE_URL]

#define __ifCouldRemedyOrder [NSString stringWithFormat:@"%@/m/tmore/driverCanBd",SERVICE_URL]

#define __shopAddressList [NSString stringWithFormat:@"%@/m/tmore/driverGetCustomer",SERVICE_URL]

#define __RemedyWorkerList [NSString stringWithFormat:@"%@/m/leaderBD/BD",SERVICE_URL]

#define __ManagerSubmitOrder

#define __RegisterConfigs  [NSString stringWithFormat:@"%@/m/tregistinit/info",SERVICE_URL]

#define __RegisterSubmits  [NSString stringWithFormat:@"%@/m/onlineregister/info",SERVICE_URL]

#define __ActivityUrl       [NSString stringWithFormat:@"%@/m/driveractivity/playbill",SERVICE_URL]

#define __HelpWorkerList [NSString stringWithFormat:@"%@/m/tmore/driverSelectCustomer",SERVICE_URL]

//#define __confirmHelpWorker [NSString stringWithFormat:@"%@/m/tmore/driverSelectCustomer",SERVICE_URL]

#define __shopNameList [NSString stringWithFormat:@"%@/m/tmore/driverSelectCustomer",SERVICE_URL]

#define __remedyOrder [NSString stringWithFormat:@"%@/m/order/submitNewOrderInfo",SERVICE_URL]

//TAB 3
#define __reviseShopAddress [NSString stringWithFormat:@"%@/m/supervisorLocation/location",SERVICE_URL]

//TAB 2
#define __accountInfo     [NSString stringWithFormat:@"%@/m/driveraccount/index",SERVICE_URL]

#define __accountDetailInfo  [NSString stringWithFormat:@"%@/m/driveraccount/monthhistory",SERVICE_URL]

#define __salaryDetailInfo   [NSString stringWithFormat:@"%@/m/MonthSalary/MS",SERVICE_URL]
//交易记录+提现  detailOrApplyMark 0 or 1
#define __withDrawHistoryRecord  [NSString stringWithFormat:@"%@/m/driverApplyAccount/applyAccount/index",SERVICE_URL]

#define __xiakeScoreRecord  [NSString stringWithFormat:@"%@/m/driverXkzHistory/info",SERVICE_URL]

#define __xiakeScoreRule  [NSString stringWithFormat:@"%@/m/driverXkzRule/info",SERVICE_URL]

#define _SignResult_     [NSString stringWithFormat:@"%@/dds/record/attendReport/check",SERVICE_URL]

#define _UserInfo_       [NSString stringWithFormat:@"%@/m/perdata/driverInfoPersonData",SERVICE_URL]

//TAB 1

#define __runningOrder  [NSString stringWithFormat:@"%@/m/order/driverordersyn",SERVICE_URL]
#define __historyOrderCompeletedNum  [NSString stringWithFormat:@"%@/m/order/driverorder",SERVICE_URL]
///m/scanningTwoDimensionCode/createOrder
#define __scanOrder  [NSString stringWithFormat:@"%@/m/scanningTwoDimensionCode/createOrder",SERVICE_URL]

#define __changeDeliverStatus  [NSString stringWithFormat:@"%@/m/driverLoginStatus/controlStatus",SERVICE_URL]
#define __historyOrder    [NSString stringWithFormat:@"%@/m/order/month",SERVICE_URL]
#define __orderDetail    [NSString stringWithFormat:@"%@/m/order/detail",SERVICE_URL]

#define __shareOrder    [NSString stringWithFormat:@"%@/m/order/winprizeShare",SERVICE_URL]

#define __waitingOrder    [NSString stringWithFormat:@"%@/m/order/assign",SERVICE_URL]
#define __receiveOrder    [NSString stringWithFormat:@"%@/m/neworder/receive",SERVICE_URL]
#define __waitingInstoreOrder    [NSString stringWithFormat:@"%@/m/order/assignZd",SERVICE_URL]
#define __awardOrder    [NSString stringWithFormat:@"%@/m/order/assignAm",SERVICE_URL]

#define __sendGetPackageCode    [NSString stringWithFormat:@"%@/m/order/arrived",SERVICE_URL]
#define __startToDeliver    [NSString stringWithFormat:@"%@/m/order/start",SERVICE_URL]
#define __sendToComplete    [NSString stringWithFormat:@"%@/m/order/complete",SERVICE_URL]

#define __noticeData        [NSString stringWithFormat:@"%@/m/notice/info",SERVICE_URL]

#define __signLogin        [NSString stringWithFormat:@"%@/m/driverSignIn/driverSignIn",SERVICE_URL]

#define __checkVersionAndUpdate    @"http://www.xiakesong.cn/update/ios/"

#define _orderNum_     [NSString stringWithFormat:@"%@/m/orderCount/count",SERVICE_URL]

//service status
#define LOSTCONNECT @"链接服务器失败"

#endif /* NetWorkConstants_h */
