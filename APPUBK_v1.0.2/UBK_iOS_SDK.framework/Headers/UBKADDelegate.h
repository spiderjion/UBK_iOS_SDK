//
//  UBKADDelegate.h
//  SDK测试
//
//  Created by PaddyGu on 16/8/8.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UBKADRequest.h"

@protocol UBKADDelegate <NSObject>

@optional

//没有广告
-(void)onNoAD:(NSInteger )errorCode;

//广告已经加载
-(void)onADLoaded;

//广告被点击
-(void)onADClicked;

//广告被展示
-(void)onADShowedWithADRequest:(UBKADRequest *)adRequest adWidth:(float)width adHeight:(float)height;

//广告被关闭
-(void)onADClosedWithADRequest:(UBKADRequest *)adRequest adWidth:(float)width adHeight:(float)height;


@end
