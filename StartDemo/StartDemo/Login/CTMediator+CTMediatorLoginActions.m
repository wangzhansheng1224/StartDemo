//
//  CTMediator+CTMediatorLoginActions.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/15.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "CTMediator+CTMediatorLoginActions.h"
NSString * const kCTMediatorSystemTarget = @"Login";
NSString * const kCTMediatorActionNativeLogin = @"pushToLogin";
@implementation CTMediator (CTMediatorLoginActions)
- (UIViewController *)CTMediator_CheckIsLogin:(UIViewController *)targetController{
    if ([UserModel isHasLogin]) {
        return targetController;
    }else{
        return [self performTarget:kCTMediatorSystemTarget
                            action:kCTMediatorActionNativeLogin
                            params:nil
                 shouldCacheTarget:NO];
    }
}
@end
