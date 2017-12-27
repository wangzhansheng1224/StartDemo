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
#define HOMEPAGE @"http://openapi.ypt.langma.cn/yws/?json=%7B%0A%20%20%22op_type%22%20%3A%201003%2C%0A%20%20%22c_ver%22%20%3A%20%224.1.1%22%2C%0A%20%20%22c_type%22%20%3A%200%2C%0A%20%20%22uid%22%20%3A%200%2C%0A%20%20%22cid%22%20%3A%200%0A%7D"


#import "PictureModel.h"
#import "PickerViewController.h"
#import <AFNetworking.h>
@interface dynamicViewController ()

@end

@implementation dynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentArray = [NSMutableArray arrayWithObjects:@"检测网络",@"获取数据",@"相机拍照",@"上传图片", nil];
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
    }else if (indexPath.row == 2){
        [self gotoPickerController];
    }else if (indexPath.row == 3){
        [self uploadPicture];
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
    
    [BANetManager ba_request_GETWithUrlString:HOMEPAGE isNeedCache:NO parameters:nil successBlock:^(id response) {
        NSLog(@"get 请求数据结果： *** %@", response);
        NSMutableArray *contentArr = [[NSMutableArray alloc]init];
        [response enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            PictureModel *picture = [PictureModel mj_objectWithKeyValues:obj];
//            PictureModel *picture=[PictureModel yy_modelWithDictionary:obj];
//            [contentArr addObject:picture];
            if (idx == 1) {
                *stop = YES;
            }
        }];
        NSString *msg = [NSString stringWithFormat:@"get 请求数据结果：%@", response];
        BAKit_ShowAlertWithMsg(msg);
    } failureBlock:^(NSError *error) {

    } progress:nil];
    
//    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
//    NSString *host = @"https://ali-todayoil.showapi.com";
//    NSString *path = @"todayoil";
//    NSString *querys = @"prov=北京";
//    NSString *url = [NSString stringWithFormat:@"%@/%@?%@",  host,  path , querys];
//
//    [BANetManager ba_setValue:[NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderKey:  @"Authorization"];
//    [BANetManager ba_request_GETWithUrlString:url isNeedCache:NO parameters:nil successBlock:^(id response) {
//    NSString *msg = [NSString stringWithFormat:@"get 请求数据结果：%@", response];
//        BAKit_ShowAlertWithMsg(msg);
//    } failureBlock:^(NSError *error) {
//
//    } progress:nil];

}

- (void)gotoPickerController{
    PickerViewController *pickVC = [[PickerViewController alloc]initWithCaptureMode:CaptureModePhoto];
    [self presentViewController:pickVC animated:YES completion:nil];
}

- (void)uploadPicture{
//    NSString *url = @"http://192.168.1.105/linye/index.php/Api/Index/editHead";
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//    [dic setObject:@"5" forKey:@"m_id"];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
////    [manager.requestSerializer setValue:@"5" forHTTPHeaderField:@"m_id"];
//    manager.requestSerializer.timeoutInterval = 5;
//
//    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//
//
//
//        //        需要将上传的图片转为二进制 存入formData
//
//        //        formData 代表消息体 封装上传的文件
//
//        //        1.格式转换
//
//        //        将png格式的图片 转换为二进制数据
//        UIImage * imageNew = [UIImage imageNamed:@"1.PNG"];
//        NSData *imageData = [self imageData:imageNew];
//
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"yyyyMMddHHmmss"];
//        NSString *currentTime = [formatter stringFromDate:[NSDate date]];
//        // jpg jpeg 图片需要压缩 方法如下 第一个参数转换的图片 第二个参数压缩系数
//
//        //        NSData *imageData = UIImageJPEGRepresentation(image, 2.0)
//
//
//        //        2.封装到消息体
//        //文件取名字
//
//        [formData appendPartWithFileData:imageData name:@"m_head" fileName:[NSString stringWithFormat:@"%@.jpg",currentTime] mimeType:@"image/jpeg"];
//
//        /*
//         参数1：上传的二进制数据
//         参数2：表示资源的类型 告诉服务器 当前上传的是什么资源 根据后台要求来写
//         参数3：资源在服务器上对应的文件 如果没有特殊说明 随意写
//         参数4：表示资源的数据格式 参考相关的表格说明 .png -->image/png
//         */
//
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"Request Successful, response '%@'", responseStr);
//
//        NSData *jsonData = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
//        NSError *err;
//        id abc = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                 options:NSJSONReadingMutableContainers
//                                                   error:&err];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"上传失败");
//    }];
    
   
    NSString *url = @"http://192.168.1.105/Lxq/index.php/Api/FileUpload/inpu";

//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
//    request.HTTPMethod  =  @"GET";
//
//    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
//                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                                       NSLog(@"Response object: %@" , response);
//                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
//
//                                                       //打印应答中的body
//                                                       NSLog(@"Response body: %@" , bodyString);
//                                                   }];
//    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/** 把图片缩小到指定的宽度范围内为止 */
-(NSData *)imageData:(UIImage *)myimage{
    
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    
    if (data.length>100*1024) {
        
        if (data.length>1024*1024) {//1M以及以上
            
            data=UIImageJPEGRepresentation(myimage, 0.1);
            
        }else if (data.length>512*1024) {//0.5M-1M
            
            data=UIImageJPEGRepresentation(myimage, 0.5);
            
        }else if (data.length>200*1024) {//0.25M-0.5M
            
            data=UIImageJPEGRepresentation(myimage, 0.9);
            
        }
        
    }
    
    return data;
    
}


@end
