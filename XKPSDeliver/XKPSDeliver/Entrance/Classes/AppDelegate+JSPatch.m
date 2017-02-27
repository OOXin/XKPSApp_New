//
//  AppDelegate+JSPatch.m
//  XKPSDeliver
//
//  Created by ccSunday on 2017/2/23.
//  Copyright © 2017年 ccSunday. All rights reserved.
//

#import "AppDelegate+JSPatch.h"

@implementation AppDelegate (JSPatch)

- (void)xks_setupJSPatch{
    return;
    //0、logger 日志
    [JSPatch setupLogger:^(NSString *logger) {
        NSLog(@"my log:%@",logger);
        
    }];
    //1、降为http请求
    [JSPatch setupHttp];
    //设置APP key
//    [JSPatch startWithAppKey:JSPATCH_APPKEY];//此方法不可与testScriptInBundle方法同时用
    //回调
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        NSLog(@"data=%@",data);
    }];

//    [JSPatch setupRSAPublicKey:JSPATCH_RAS_PUBLICKEY];
#ifdef DEBUG


//    [JSPatch testScriptInBundle]; //自动在当前项目的bundle中，寻找main.js文件执行，不能同时执行startWithAppKey方法
    
    [JSPatch setupDevelopment];     //从 SDK 1.4 开始支持在发布脚本时先针对开发版本下发，测试无问题再进行全量下发或灰度/条件下发。首先在代码中开启开发模式，在 +sync 之前调用 setupDevelopment 方法，建议只在 debug 模式下开启：
   
    
    [JSPatch showDebugView];        //只在DUBUG模式下显示 ^-^是否显示那个恶心(转屏)的JSPatch 按钮
#else
    
#endif
    [JSPatch sync];
    
}
@end
