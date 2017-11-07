//
//  ViewController.m
//  TabBarController
//
//  Created by 王战胜 on 2017/10/17.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "LoginViewController.h"
#import "UserModel.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)btnClick{
    UserModel *user = [[UserModel alloc]init];
    user.userID = 10;
    [UserModel save:user];
    
    [UserModel removeUser];
    UINavigationController *navController=((AppDelegate*)[UIApplication sharedApplication].delegate).navController;
    NextViewController *nextViewController=[[NextViewController alloc] init];
    LoginViewController *loginViewController=[[LoginViewController alloc] init];
    if ([UserModel isHasLogin]) {
        [navController pushViewController:nextViewController animated:YES];
    }else{
        [navController pushViewController:loginViewController animated:YES];
    }
}


@end
