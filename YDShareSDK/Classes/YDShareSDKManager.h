//
//  ShareSDKManager.h
//  ShareSDK
//
//  Created by denghuan on 2019/12/5.
//  Copyright © 2019 denghuan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  分享类型
 */
typedef NS_ENUM(NSInteger,  YDShareType) {
    YDShareTypeWXSession = 0,              //微信
    YDShareTypeWXTimeline,                 //朋友圈
    YDShareTypeWXCollection,               //微信收藏
    YDShareTypeQQ,                         //QQ好友
    YDShareTypeQzone,                      //QQ空间
    YDShareTypeSinaWeibo,                  //新浪微博
    YDShareTypeSystemMessage               //系统短信
};


@interface YDShareSDKManager : NSObject
+ (instancetype)shareInstance;

/*
 注册
 */
- (void)registerShareSDK;

/*
 text:分享内容
 images:图片数组（注意：图片可以是UIImage对象，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
 url:分享链接
 title:分享标题
 type:分享类型
 */
- (void)shareWithText:(NSString *)text
               Images:(NSArray *)images
                  Url:(NSURL *)url
                Title:(NSString *)title
                 Type:(YDShareType)type;

@end
