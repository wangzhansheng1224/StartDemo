//
//  Target_Login.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/15.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "Target_Login.h"
#import "LoginViewController.h"

@implementation Target_Login
- (UIViewController *)Action_pushToLogin:(NSDictionary *)params{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    return loginVC;
}
@end
