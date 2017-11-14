//
//  TableViewController.h
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//
//{"success":true,"data":{"untreated":0,"amount":0}}
#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray *contentArray;
@end
