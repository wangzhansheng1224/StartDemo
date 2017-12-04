//
//  TableViewController.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.tableFooterView=[[UIView alloc]init];
        [self.view addSubview:self.tableView];
        self.tableView.rowHeight = 50;
        //分割符边距
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
