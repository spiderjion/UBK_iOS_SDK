//
//  UBKAD.h
//  SDK测试
//
//  Created by PaddyGu on 16/6/25.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UBKADRequest.h"

@interface UBKAD : NSObject 

@property (nonatomic,strong) UIView *adContainer;

/**
 * @brief  SDK初始化
 *
 * @param  渠道号
 *
 * @return void
 **/
-(instancetype)initWithChannel:(NSString *)channel app_id:(NSInteger )app_id app_key:(NSString *)app_key;


/**
 * @brief  请求广告
 *
 * @param  UBKADRequest对象
 *
 * @return void
 **/
+(void)requestADWithADRequest:(UBKADRequest *)adRequest;


/**
 * @brief  设置代理
 *
 * @param  代理对象
 *
 * @return void
 **/
+(void)setADDelegate:(id)delegate;


/**
 * @brief  设置调试模式
 *
 * @param  YES为调试模式，NO为非调试模式，默认为NO
 *
 * @return void
 **/
+(void)setDebug:(BOOL)debug;


/**
 * @brief  SDK使用结束
 *
 * @param  空
 *
 * @return void
 **/
+(void)sdkTerminate;


@end
