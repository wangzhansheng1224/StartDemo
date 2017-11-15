//
//  ViewController.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick{
    UserModel *user = [[UserModel alloc]init];
    user.userID = 10;
    [UserModel save:user];
    
    [UserModel removeUser];
    NextViewController *nextVC = [[NextViewController alloc]init];
    UIViewController *controller = [[CTMediator sharedInstance]CTMediator_CheckIsLogin:nextVC];
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
