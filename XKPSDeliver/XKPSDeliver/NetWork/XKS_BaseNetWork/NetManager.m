//
//  NetManager.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/3/3.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "NetManager.h"
#import <AFNetworking/AFNetworking.h>
#import "SystemConfig.h"
@implementation NetManager

+(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 超时时间
    manager.requestSerializer.timeoutInterval = 12.0;
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    // 声明获取到的数据格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
    
    return manager;
}

+(void)getRequestWithUrl:(NSString *)url param:(NSDictionary *)param addProgressHudOn:(UIView *)targetview Tip:(NSString *)tip successReturn:(SuccessBlock)successReturn failed:(FailedBlock)failed{
    
    AFHTTPSessionManager *manager = [self manager];
    NSMutableDictionary *uploadParam = [NSMutableDictionary dictionaryWithDictionary:param];
    //设置一些基本的请求参数
    [manager.requestSerializer setValue:[[SystemConfig sharedSystemConfig]getDeviceToken] forHTTPHeaderField:@"IMEI"];
    [manager.requestSerializer setValue:@"TRUE" forHTTPHeaderField:@"EKS-Mobile"];
    [manager.requestSerializer setValue:@"TRUE" forHTTPHeaderField:@"BRCY-Mobile"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"EKS-Device-Type"];
    [manager.requestSerializer setValue:@"driver" forHTTPHeaderField:@"EKS-Client-Type"];
    [manager.requestSerializer setValue:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"] forHTTPHeaderField:@"EKS-DDS-Version"];
    [manager.requestSerializer setValue:[[SystemConfig sharedSystemConfig]getSessionId] forHTTPHeaderField:@"Cookie"];

    [manager GET:url parameters:uploadParam progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if (successReturn) {
            successReturn(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        if (failed) {
            failed(error);
        }
    }];
}

+(void)postRequestWithUrl:(NSString *)url param:(NSDictionary *)param addProgressHudOn:(UIView *)targetview Tip:(NSString *)tip successReturn:(SuccessBlock)successReturn failed:(FailedBlock)failed{

    NSMutableDictionary *uploadParam = [NSMutableDictionary dictionaryWithDictionary:param];
    //设置基本请求参数
    [uploadParam setObject:@"driverMobile" forKey:@"lt"];
    [uploadParam setObject:[[SystemConfig sharedSystemConfig]getDeviceToken] forKey:@"imei"];
    [uploadParam setObject:[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"] forKey:@"version"];
    [uploadParam setObject:@"ios" forKey:@"os"];
    AFHTTPSessionManager *manager = [self manager];
    [manager POST:url
       parameters:uploadParam
         progress:^(NSProgress * _Nonnull uploadProgress) {
             // 这里可以获取到目前数据请求的进度
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             if (successReturn) {
                successReturn(responseObject);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             // 请求失败
             if (failed) {
                 failed(error);
             }
         }];
}

+(void)downLoadWithUrlString:(NSString *)urlString progress:(XKSDownloadProgress)progress completed:(SuccessBlock)completed{
    // 1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.设置请求的URL地址
    NSURL *url = [NSURL URLWithString:urlString];
    // 3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 4.下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        // 下载进度
        CGFloat percent = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        NSLog(@"当前下载进度为:%lf",percent);
        if (progress) {
            progress(percent);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 下载地址
        NSLog(@"默认下载地址%@",targetPath);
        // 设置下载路径,通过沙盒获取缓存地址,最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:filePath]; // 返回的是文件存放在本地沙盒的地址
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        // 下载完成调用的方法
        NSLog(@"%@---%@", response, filePath);
        NSDictionary *responseDic = @{@"response":response,@"filePath":filePath};
        if (completed) {
            completed(responseDic);
        }
    }];
    // 5.启动下载任务
    [task resume];
}

+ (XKSNetworkStatus)AFNetworkStatus{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    __block XKSNetworkStatus networkStatus;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                networkStatus = XKSNetworkStatusUnknown;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                networkStatus = XKSNetworkStatusNotReachable;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkStatus = XKSNetworkStatusReachableViaWWAN;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkStatus = XKSNetworkStatusReachableViaWiFi;
                
                break;
                
            default:
                break;
        }
    }] ;
    return networkStatus;
}
@end
