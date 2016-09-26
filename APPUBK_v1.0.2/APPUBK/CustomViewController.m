//
//  CustomViewController.m
//  SDK测试
//
//  Created by PaddyGu on 16/8/26.
//  Copyright © 2016年 feelwx. All rights reserved.
//

#import "CustomViewController.h"
#import "UBK_iOS_SDK/UBK_iOS_SDK.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface CustomViewController ()<UIScrollViewDelegate>

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    back.frame = CGRectMake(0, KHEIGHT-50, KWIDTH, 50);
    [back setTitle:@"返   回" forState:UIControlStateNormal];
    back.backgroundColor = [UIColor lightGrayColor];
    [back addTarget:self action:@selector(backToVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    if (self.adType == 71) {
        [self loadOnlyView];
            
    }else if (self.adType == 72){
        [self loadScrollView];
    }else if (self.adType == 8){
        //文案形式
        [self loadListWord];
    }else if (self.adType == 9){
        //图文形式
        [self loadListBanner];
    }

}

#pragma mark - 文案信息流广告
-(void)loadListWord
{
    [[UBKAdLoader new] loadAdWithType:AdTypeListWord count:1 size:CGSizeMake(KWIDTH, 70) block:^(NSArray *adViewArray) {
        if (adViewArray.count) {
            [adViewArray[0] setFrame:CGRectMake(0, 100, KWIDTH, 70)];
            [self.view addSubview:adViewArray[0]];
        }
    }];
}

#pragma mark - 图文信息流广告
-(void)loadListBanner
{
    [[UBKAdLoader new] loadAdWithType:AdTypeListBanner count:1 size:CGSizeMake(KWIDTH, 160) block:^(NSArray *adViewArray) {
        if (adViewArray.count) {
            [adViewArray[0] setFrame:CGRectMake(0, 100, KWIDTH, 160)];
            
            [self.view addSubview:adViewArray[0]];
        }
    }];
}

#pragma mark - 自定义原生Banner
-(void)loadOnlyView
{
    //第一种，添加在View里
    [[UBKAdLoader new] loadAdWithType:AdTypeCustomBanner count:1 size:CGSizeMake(KWIDTH, 120) block:^(NSArray *adViewArray) {
        if (adViewArray.count) {
            [adViewArray[0] setFrame:CGRectMake(0, 150, KWIDTH, 120)];
            [self.view addSubview:adViewArray[0]];
        }
    }];
}

-(void)loadScrollView{
    //第二种，放在scrollView里面
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, KWIDTH, 120)];
    //分页
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    [self.view addSubview:_scrollView];
    
    //添加4张图片
    for (NSInteger i =0; i<4; i++) {
        if (i == 0) {
            [[UBKAdLoader new] loadAdWithType:AdTypeCustomBanner count:1 size:CGSizeMake(KWIDTH, 120) block:^(NSArray *adViewArray) {
                if (adViewArray.count) {
                    [adViewArray[0] setFrame:CGRectMake(0, 0, KWIDTH, 120)];
                    
                    [self.scrollView addSubview:adViewArray[0]];
                }
            }];
        }else{
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*KWIDTH, 0, KWIDTH, 250)];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",i+1]];
            [self.scrollView addSubview:imageView];
        }
    }
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(KWIDTH *4, 0);
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 140, KWIDTH, 50)];
    self.pageControl.numberOfPages = 4;//点数
    [self.view addSubview:self.pageControl];
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.currentPage = 0;
    
    self.scrollView.delegate = self;
}

#pragma mark - 返回上一个试图控制器
-(void)backToVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 设置pageControl点的位置
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x /KWIDTH;
    self.pageControl.currentPage = page;
    
}


#pragma mark - 不支持屏幕旋转
//当前viewcontroller是否支持转屏
- (BOOL)shouldAutorotate{
    return NO;
}

//当前viewcontroller默认的屏幕方向
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;//home键在下
}


@end
