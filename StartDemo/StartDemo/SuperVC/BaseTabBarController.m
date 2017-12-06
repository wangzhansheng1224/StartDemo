//
//  TabBarController.m
//  TabBarController
//
//  Created by 王战胜 on 2017/10/17.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "BaseTabBarController.h"
#import "NavgationViewController.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "LoginViewController.h"
#import "dynamicViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

+ (void)initialize
{
    
    //TabBar未点击时字体的大小颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //TabBar点击时字体的大小和颜色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = IMRGBColor(222, 86, 46);
    
    
    //全局唯一TabBarItem
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    UITabBar *tabBar =  [UITabBar appearance];
    //取消tabbar的半透明效果
    tabBar.translucent = NO;
    //TabBar底部颜色(灰色)
//    tabBar.backgroundColor = ZLRGBColor(250, 250, 250);

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"首页" image:@"a" selectedImage:@"a1"];
    [self setupChildVc:[[dynamicViewController alloc] init] title:@"动态" image:@"b" selectedImage:@"b1"];
    [self setupChildVc:[[ActivityViewController alloc] init] title:@"活动" image:@"c" selectedImage:@"c1"];
    [self setupChildVc:[[LoginViewController alloc] init] title:@"个人" image:@"d" selectedImage:@"d1"];
    
}


- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{

    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NavgationViewController *nav = [[NavgationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
