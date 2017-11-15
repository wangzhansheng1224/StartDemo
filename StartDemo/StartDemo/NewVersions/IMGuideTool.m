//
//  IMGuideTool.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "IMGuideTool.h"
#import "IMNSUserDefaultsTool.h"
#import "BaseTabBarController.h"
#import "GuideViewController.h"
#define IMVersion @"version"

@implementation IMGuideTool
+(void)selectRootViewController:(UIWindow *)window{
    //当前版本与上一版本比较
    NSString * currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    NSString * lastVersion = [IMNSUserDefaultsTool objectForKey:IMVersion];
    if ([currentVersion isEqualToString:lastVersion]) {
        //没有新版本
        //设置窗口根控制器
        BaseTabBarController * tabBarController = [[BaseTabBarController alloc]init];
        window.rootViewController = tabBarController;

        [window makeKeyAndVisible];
    }
    else
    {
        
        //有新版本
        GuideViewController* guideVC = [[GuideViewController alloc]init];
        window.rootViewController = guideVC;
        [IMNSUserDefaultsTool setObject:currentVersion forKey:IMVersion];
        [window makeKeyAndVisible];
    
    }
}
@end
