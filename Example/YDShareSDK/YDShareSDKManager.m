//
//  YDShareSDKManager.m
//  YDShareSDK
//
//  Created by denghuan on 2019/12/5.
//  Copyright © 2019 denghuan. All rights reserved.
//

#import "YDShareSDKManager.h"
#import <ShareSDK/ShareSDK.h>

//分享
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应的QQ和QQ空间）
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"
//新浪微博SDK头文件
#import "WeiboSDK.h"

#define WX_APPID          @"wx9d4d79ec29c8032e"               //微信开放平台APPID

#define APP_SECRET      @"07fd4fa72700346e42c880a59195056c" //appsecret

#define WeiboAppkey @"731410194"
#define WeiboappSecret @"e2bb9052435e2aa23d6b145be4c1c95d"
#define WeiboRedirectUri  @"http://www.hnzwhh.com"
#define WeChatAppId @"wxa1ea4c0ba96384c3"
#define WeChatAppSecret @"7dcaa47958920badd465cff99fe56ab1"
#define QQAppkey @"ZWlUjrfDtdc8ERst"
#define QQAppId @"1105483962"
#define CainniaoAppKey @"23400536"
#define CainiaoAppSecret @"2ad58320dc47d2823ca4663fc1cb244d"
#define MobClickAppKey @"582d76c5717c1904a40007b6"
#define UMessageAppKey @"574d3c5467e58ed041000ab2"
#define ShareSDKKey @"13f6b10f1b06f"

@implementation YDShareSDKManager : NSObject 
#pragma mark - public methods
+ (instancetype)shareInstance
{
    static YDShareSDKManager *shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[YDShareSDKManager alloc] init];
    });
    return shareManager;
}

//分享注册
-(void)registerShareSDK{
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        //QQ
        [platformsRegister setupQQWithAppId:QQAppId appkey:QQAppkey];
        
        //微信
        [platformsRegister setupWeChatWithAppId:WX_APPID appSecret:APP_SECRET universalLink:@"https://help.wechat.com"];
        
        //新浪
        [platformsRegister setupSinaWeiboWithAppkey:WeiboAppkey appSecret:WeiboappSecret redirectUrl:WeiboRedirectUri];
        
    }];
}

- (void)shareWithText:(NSString *)text
               Images:(NSArray *)images
                  Url:(NSURL *)url
                Title:(NSString *)title
                 Type:(YDShareType)type{
    
    NSMutableDictionary * shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:text
                                     images:images
                                        url:url
                                      title:title
                                       type:type];

    SSDKPlatformType platformType = SSDKPlatformSubTypeWechatSession;
    [ShareSDK share:platformType
         parameters:shareParams
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         switch (state) {
             case SSDKResponseStateSuccess:
             {
                 break;
             }
             case SSDKResponseStateFail:
             {
                 break;
             }
             default:
                 break;
         }
     }];
}

@end
