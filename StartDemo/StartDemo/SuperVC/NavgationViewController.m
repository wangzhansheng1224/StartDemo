//
//  NavgationViewController.m
//  TabBarController
//
//  Created by 王战胜 on 2017/10/17.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "NavgationViewController.h"

@interface NavgationViewController ()

@end

@implementation NavgationViewController

+ (void)initialize
{
    //全局唯一NavgationBar
    UINavigationBar *bar = [UINavigationBar appearance];
    //背景图片
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [bar setBarTintColor:COLOR_ORANGE];
    //导航栏字体大小和颜色
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],
                       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    bar.translucent = NO;
    
    
    //全局唯一UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // UIControlStateNormal
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    //字体颜色
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //字体大小
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //清空手势
    self.interactivePopGestureRecognizer.delegate = nil;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        //左侧后退item
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(70, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
