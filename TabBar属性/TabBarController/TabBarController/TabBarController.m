//
//  TabBarController.m
//  TabBarController
//
//  Created by 王战胜 on 2017/10/17.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "TabBarController.h"
#import "NavgationViewController.h"
#import "ViewController.h"

#define ZLRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface TabBarController ()

@end

@implementation TabBarController

+ (void)initialize
{
    
    //TabBar未点击时字体的大小颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //TabBar点击时字体的大小和颜色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = ZLRGBColor(59, 89, 128);
    
    
    //全局唯一TabBarItem
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //取消tabbar的半透明效果
//    [UITabBar appearance].translucent = NO;

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[ViewController alloc]init] title:@"首页" image:@"首页1" selectedImage:@"首页"];
    [self setupChildVc:[[ViewController alloc] init] title:@"消息" image:@"消息1" selectedImage:@"消息"];
    [self setupChildVc:[[ViewController alloc] init] title:@"我的" image:@"我的1" selectedImage:@"我的"];
    
    //TabBar图标颜色或颜色用Original Image
    self.tabBar.tintColor = ZLRGBColor(59, 89, 128);
    
    //TabBar底部颜色(灰色)
    self.tabBar.backgroundColor = ZLRGBColor(180, 180, 180);
    
}


- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{

    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    NavgationViewController *nav = [[NavgationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
