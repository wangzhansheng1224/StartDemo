//
//  GuideViewController.m
//  gocom
//
//  Created by 王战胜 on 2017/1/10.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseTabBarController.h"

@interface GuideViewController ()
@property (nonatomic, strong) UIScrollView *pageScroll;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    NSArray *imageNameArray = @[@"guide_1", @"guide_2", @"guide_3"];
    
    _pageScroll = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _pageScroll.contentSize = CGSizeMake(ScreenWidth * imageNameArray.count, ScreenHeight);
    //设置按页滑动
    _pageScroll.pagingEnabled = YES;
    //弹性设置
    _pageScroll.bounces=NO;
    //隐藏水平滑动指示条
    _pageScroll.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.pageScroll];
    
    for (int i = 0; i < imageNameArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * i, 0, ScreenWidth, ScreenHeight)];
        imageView.image=[UIImage imageNamed:imageNameArray[i]];
        
        [_pageScroll addSubview:imageView];
        
        if (i==imageNameArray.count-1) {
            imageView.userInteractionEnabled=YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(start)];
            [imageView addGestureRecognizer:tap];
        }
    }
    
}

- (void)start{
    BaseTabBarController * tabBarController = [[BaseTabBarController alloc]init];
    // 核心代码
    self.definesPresentationContext = YES;
    
    // 可以使用的Style(背景不会是黑色)
    // UIModalPresentationOverCurrentContext
    // UIModalPresentationOverFullScreen
    // UIModalPresentationCustom
    // 使用其他Style会黑屏
    tabBarController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    /**
     typedef enum {
     UIModalTransitionStyleCoverVertical=0,//默认方式，竖向上推
     UIModalTransitionStyleFlipHorizontal, //水平反转
     UIModalTransitionStyleCrossDissolve,//隐出隐现
     UIModalTransitionStylePartialCurl,//部分翻页效果
     } UIModalTransitionStyle;
     */
    //隐出隐现
    tabBarController.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabBarController animated:YES completion:nil];
    
}

@end
