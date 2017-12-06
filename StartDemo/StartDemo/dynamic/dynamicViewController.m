//
//  dynamicViewController.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/5.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "dynamicViewController.h"
static NSString * const url5 = @"http://chanyouji.com/api/users/likes/268717.json";
static NSString * const url1 = @"http://openapi.ypt.langma.cn/yws/?json=%7B%0A%20%20%22op_type%22%20%3A%201003%2C%0A%20%20%22c_ver%22%20%3A%20%224.1.1%22%2C%0A%20%20%22c_type%22%20%3A%200%2C%0A%20%20%22uid%22%20%3A%200%2C%0A%20%20%22cid%22%20%3A%200%0A%7D";
static NSString * const url2 = @"http://openapi.db.39.net/app/GetDrugsByCategory?CategoryName=%E6%89%AD%E4%BC%A4%E6%8C%AB%E4%BC%A4%E5%86%BB%E4%BC%A4&app_key=app&curPage=0&limit=20&sign=9DFAAD5404FCB6168EA6840DCDFF39E5&tags=";
static NSString * const url3 = @"http://openapi.db.39.net/app/GetDrugsByCategory";
#import "dynamicModel.h"
@interface dynamicViewController ()

@end

@implementation dynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentArray = [NSMutableArray arrayWithObjects:@"检测网络",@"获取数据", nil];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%@",self.contentArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self checkNet];
    }else if (indexPath.row == 1){
        [self getData];
    }
}

- (void)checkNet{
    [BANetManager ba_startNetWorkMonitoringWithBlock:^(BANetworkStatus status) {
        NSString *msg;
        switch (status) {
            case 0:
            {
                msg = @"未知网络";
                BAKit_ShowAlertWithMsg(msg);
            }
                break;
            case 1:
            {
                msg = @"没有网络";
                BAKit_ShowAlertWithMsg(msg);
            }
                break;
            case 2:
            {
                msg = @"您的网络类型为：手机 3G/4G 网络";
                BAKit_ShowAlertWithMsg(msg);
            }
                break;
            case 3:
            {
                msg = @"您的网络类型为：wifi 网络";
                /*! wifi 网络下请求网络：可以在父类写此方法，具体使用demo，详见：https://github.com/boai/BABaseProject */
                BAKit_ShowAlertWithMsg(msg);
            }
                break;
                
            default:
                break;
        }
    }];
}

- (void)getData
{
    //http://openapi.db.39.net/app/GetDrugsByCategory?CategoryName=扭伤挫伤冻伤&app_key=app&curPage=0&limit=20&sign=9DFAAD5404FCB6168EA6840DCDFF39E5
    // 如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"扭伤挫伤冻伤" forKey:@"CategoryName"];
    [dic setObject:@"app" forKey:@"app_key"];
    [dic setObject:@"0" forKey:@"curPage"];
    [dic setObject:@"5" forKey:@"limit"];
    [dic setObject:@"9DFAAD5404FCB6168EA6840DCDFF39E5" forKey:@"sign"];
    
    [BANetManager ba_request_GETWithUrlString:url5 isNeedCache:NO parameters:nil successBlock:^(id response) {
        NSLog(@"get 请求数据结果： *** %@", response);
        NSMutableArray *contentArr = [[NSMutableArray alloc]init];
        [response enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Picture *pic =[Picture yy_modelWithDictionary:obj];
            [contentArr addObject:pic];
            if (idx == 1) {
                *stop = YES;
            }
        }];
        NSString *msg = [NSString stringWithFormat:@"get 请求数据结果：%@", response];
        BAKit_ShowAlertWithMsg(msg);
    } failureBlock:^(NSError *error) {
        
    } progress:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
