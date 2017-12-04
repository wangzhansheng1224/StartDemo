//
//  HomeViewController.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/22.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseTableViewController.h"
#import "ViewController.h"

@implementation HomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        BaseTableViewController * Control1 = [[BaseTableViewController alloc]init];
        Control1.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - DefaultSegmentHeight - IMTabbarHeight);
        Control1.view.backgroundColor = [UIColor greenColor];
        Control1.title = @"我的会议";
        
        BaseTableViewController * Control2 = [[BaseTableViewController alloc]init];
        Control2.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - DefaultSegmentHeight - IMTabbarHeight);
        Control2.view.backgroundColor = [UIColor yellowColor];
        Control2.title = @"我的视频";
        
        ViewController * Control3 = [[ViewController alloc]init];
        Control3.view.backgroundColor = [UIColor blueColor];
        Control3.title = @"加入会议";
        
      
        
        self.viewControllers = @[Control1, Control2, Control3];
    }
    return self;
}
@end
