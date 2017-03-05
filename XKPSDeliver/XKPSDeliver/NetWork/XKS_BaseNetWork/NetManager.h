//
//  NetManager.h
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id successReturn);

typedef void(^FailedBlock)(id failedReturn);
/**
  下载进度

 @param bytesRead 已下载的大小
 @param totalBytesRead 文件总大小
 */
typedef void (^XKSDownloadProgress)(int64_t bytesRead,
int64_t totalBytesRead);

/*!
 *
 *  上传进度
 *
 *  @param bytesWritten              已上传的大小
 *  @param totalBytesWritten         总上传大小
 */
typedef void (^XKSUploadProgress)(int64_t bytesWritten,
int64_t totalBytesWritten);

typedef XKSDownloadProgress XKSGetProgress;

typedef XKSDownloadProgress XKSPostProgress;

typedef NS_ENUM(NSInteger, HTNetworkStatus) {
    kHTNetworkStatusUnknown          = -1,  //未知网络
    kHTNetworkStatusNotReachable     = 0,   //网络无连接
    kHTNetworkStatusReachableViaWWAN = 1,   //2，3，4G网络
    kHTNetworkStatusReachableViaWiFi = 2,   //WIFI网络
};

@interface NetManager : NSObject

/*异步GET请求
 *
 *command:    请求命令
 *para        请求参数
 *success:    请求成功回调
 *failed:     请求失败回调
 */

//COMMON POST
+(void)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param addProgressHudOn:(UIView *)targetview Tip:(NSString *)tip successReturn:(SuccessBlock)successReturn failed:(FailedBlock)failed;


//COMMON GET
+(void)getRequestWithUrl:(NSString *)url param:(NSDictionary *)param addProgressHudOn:(UIView *)targetview Tip:(NSString *)tip successReturn:(SuccessBlock)successReturn failed:(FailedBlock)failed;

@end
