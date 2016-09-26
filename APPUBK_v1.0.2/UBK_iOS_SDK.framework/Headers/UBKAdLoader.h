//
//  UBKAdLoader.h
//  SDK测试
//
//  Created by PaddyGu on 16/8/25.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UBKADDelegate.h"

//定义枚举:广告类型
typedef enum {
    AdTypeCustomBanner = 7,     //自定义原生banner
    AdTypeListWord = 8,         //自定义文案信息流广告
    AdTypeListBanner = 9        //自定义图文信息流广告
} ADType;

typedef void(^ADViewBlock)(NSArray *adViewArray);

@interface UBKAdLoader : NSObject

@property (nonatomic,assign) ADType adType;
@property (nonatomic,strong) id <UBKADDelegate> delegate;

//
-(void)loadAdWithType:(ADType )adType count:(NSInteger )count size:(CGSize)size block:(ADViewBlock )adViewBlock;

/**
 * @brief  设置代理
 *
 * @param  代理对象
 *
 * @return void
 **/
-(void)setADDelegate:(id)delegate;

@end
