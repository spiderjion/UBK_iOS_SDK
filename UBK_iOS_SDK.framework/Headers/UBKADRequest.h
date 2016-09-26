//
//  UBKADRequest.h
//  SDK测试
//
//  Created by PaddyGu on 16/6/24.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//定义枚举:广告类型
typedef enum {
    AdTypeBanner = 1,//banner
    AdTypeHalfScreen,//半屏插屏
    AdTypeNotify,    //通知
    AdTypeRecommend, //推荐墙
    AdTypeFullScreen, //全屏插屏
} ADTypeName;


//定义枚举:banner类型
typedef enum {
    BannerOnTop = 1,//上部banner
    BannerOnMiddle, //中部banner
    BannerOnBottom  //下部banner
} BannerTypeName;


@interface UBKADRequest : NSObject

@property (nonatomic,assign) ADTypeName adType;             //广告类型
@property (nonatomic,assign) BannerTypeName bannerType;     //banner类型
@property (nonatomic,strong) UIView *adContainer;           //广告容器
@property (nonatomic,assign) float marginTop;               //上边缘距离

//初始化banner以外的广告类型
- (instancetype)initWithADType:(ADTypeName)adType;

//初始化banner类型
- (instancetype)initWithBannerType:(BannerTypeName)bannerType marginTop:(float)marginTop marginBottom:(float)marginBottom onView:(UIView *)adContainer;


@end
