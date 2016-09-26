//
//  ViewController.m
//  SDK测试
//
//  Created by PaddyGu on 16/5/28.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewController.h"
#import "UBK_iOS_SDK/UBK_iOS_SDK.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define DEV_ID @"UBK_Dev_ID"

@interface ViewController ()<UBKADDelegate>
{
    UITextField *topBannerText;
    UITextField *bottomBannerText;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2.0, 30, 120, 80)];
    imageView.image = [UIImage imageNamed:@"UBKPNG.png"];
    [self.view addSubview:imageView];
    
    //顶部输入框
    topBannerText = [[UITextField alloc] initWithFrame:CGRectMake(20, 130, 100, 50)];
    topBannerText.borderStyle = UITextBorderStyleRoundedRect;
    topBannerText.backgroundColor = [UIColor grayColor];
    topBannerText.placeholder = @"顶部距离";
    topBannerText.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:topBannerText];
    
    //顶部banner按钮
    UIButton *topBannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    topBannerButton.frame = CGRectMake(140, 130, SCREEN_WIDTH-160, 50);
    [topBannerButton setTitle:@"展示顶部banner" forState:UIControlStateNormal];
    topBannerButton.backgroundColor = [UIColor orangeColor];
    topBannerButton.layer.cornerRadius = 5;
    topBannerButton.tag = 1;
    [topBannerButton addTarget:self action:@selector(showBanner:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBannerButton];
    
    //底部输入框
    bottomBannerText = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
    bottomBannerText.placeholder = @"底部距离";
    bottomBannerText.borderStyle = UITextBorderStyleRoundedRect;
    bottomBannerText.keyboardType = UIKeyboardTypeDecimalPad;
    bottomBannerText.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bottomBannerText];
    
    //底部banner按钮
    UIButton *bottomBannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBannerButton.frame = CGRectMake(140, 200, SCREEN_WIDTH-160, 50);
    [bottomBannerButton setTitle:@"展示底部banner" forState:UIControlStateNormal];
    bottomBannerButton.backgroundColor = [UIColor orangeColor];
    bottomBannerButton.layer.cornerRadius = 5;
    bottomBannerButton.tag = 2;
    [bottomBannerButton addTarget:self action:@selector(showBanner:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBannerButton];
    
    //推荐墙按钮
    UIButton *recommendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    recommendButton.frame = CGRectMake(20, 270, SCREEN_WIDTH-40, 50);
    [recommendButton setTitle:@"展示推荐墙" forState:UIControlStateNormal];
    recommendButton.backgroundColor = [UIColor orangeColor];
    [recommendButton addTarget:self action:@selector(showRecommendWall) forControlEvents:UIControlEventTouchUpInside];
    recommendButton.layer.cornerRadius = 5;
    [self.view addSubview:recommendButton];
    
    
    float buttonWidth = (SCREEN_WIDTH-80)/3.0;
    //自定义Banner
    UIButton *bigBanner = [UIButton buttonWithType:UIButtonTypeCustom];
    bigBanner.frame = CGRectMake(20, 340, buttonWidth, 50);
    [bigBanner setTitle:@"大Banner" forState:UIControlStateNormal];
    bigBanner.backgroundColor = [UIColor orangeColor];
    [bigBanner addTarget:self action:@selector(showCustomBanner) forControlEvents:UIControlEventTouchUpInside];
    bigBanner.layer.cornerRadius = 5;
    [self.view addSubview:bigBanner];
    
    //文案形式
    UIButton *wordList = [UIButton buttonWithType:UIButtonTypeCustom];
    wordList.frame = CGRectMake(40+buttonWidth, 340, buttonWidth, 50);
    [wordList setTitle:@"文案形式" forState:UIControlStateNormal];
    wordList.backgroundColor = [UIColor orangeColor];
    [wordList addTarget:self action:@selector(showWordListView) forControlEvents:UIControlEventTouchUpInside];
    wordList.layer.cornerRadius = 5;
    [self.view addSubview:wordList];
    
    //图文形式
    UIButton *bannerList = [UIButton buttonWithType:UIButtonTypeCustom];
    bannerList.frame = CGRectMake(60+buttonWidth*2, 340, buttonWidth, 50);
    [bannerList setTitle:@"图文形式" forState:UIControlStateNormal];
    bannerList.backgroundColor = [UIColor orangeColor];
    [bannerList addTarget:self action:@selector(showBannerListView) forControlEvents:UIControlEventTouchUpInside];
    bannerList.layer.cornerRadius = 5;
    [self.view addSubview:bannerList];
    
}


#pragma mark - 展示推荐墙事件
-(void)showRecommendWall
{
    //推荐墙展示
    UBKADRequest *adRequest = [[UBKADRequest alloc] initWithADType:AdTypeRecommend];
    [UBKAD requestADWithADRequest:adRequest];
    [UBKAD setADDelegate:self];
}

#pragma mark - 展示banner
-(void)showBanner:(UIButton *)sender
{
    
    if (sender.tag == 1) {
        //顶部
        CGFloat marginTop = [topBannerText.text floatValue];
//        UBKADRequest *adRequest = [[UBKADRequest alloc] initWithBannerType:BannerOnTop marginTop:marginTop marginBottom:0 onView:self.view];
        UBKADRequest *adRequest = [[UBKADRequest alloc] initWithBannerType:BannerOnTop marginTop:marginTop marginBottom:0 onView:nil];
        [UBKAD requestADWithADRequest:adRequest];
        [UBKAD setADDelegate:self];
        [topBannerText resignFirstResponder];
        
    }else if(sender.tag == 2){
        //底部
        CGFloat marginBottom = [bottomBannerText.text floatValue];
        UBKADRequest *adRequest = [[UBKADRequest alloc] initWithBannerType:BannerOnBottom marginTop:0 marginBottom:marginBottom onView:self.view];
        [UBKAD requestADWithADRequest:adRequest];
        [UBKAD setADDelegate:self];
        [bottomBannerText resignFirstResponder];
    }
    
}

#pragma mark - 展示自定义原生Banner
-(void)showCustomBanner
{
#if 0
    CustomViewController *customVC = [[CustomViewController alloc] init];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择形式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"单个广告" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        customVC.adType = 71;
        [self presentViewController:customVC animated:YES completion:nil];
    }];
    
    UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"运营轮播" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        customVC.adType = 72;
        [self presentViewController:customVC animated:YES completion:nil];
    }];
    
    [alertController addAction:alert];
    [alertController addAction:alert2];
    
    [self presentViewController:alertController animated:YES completion:nil];
#endif 
}

#pragma mark - 展示文案信息流广告
-(void)showWordListView
{
    CustomViewController *customVC = [[CustomViewController alloc] init];
    customVC.adType = 8;
    [self presentViewController:customVC animated:YES completion:nil];
}

#pragma mark - 展示图文信息流广告
-(void)showBannerListView
{
    CustomViewController *customVC = [[CustomViewController alloc] init];
    customVC.adType = 9;
    [self presentViewController:customVC animated:YES completion:nil];
}


//回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [topBannerText resignFirstResponder];
    [bottomBannerText resignFirstResponder];
}

#pragma mark - 代理方法close
-(void)onADClosedWithADRequest:(UBKADRequest *)adRequest adWidth:(float)width adHeight:(float)height
{
    NSLog(@"%u",adRequest.adType);
    NSLog(@"%f",width);
    NSLog(@"%f",height);
}

@end
