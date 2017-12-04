//
//  ActivityViewController.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/4.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ActivityViewController.h"
#import <SDCycleScrollView.h>
#import "NextViewController.h"

@interface ActivityViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) NSArray *imagesURLStrings;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"轮播Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 180) delegate:self placeholderImage:nil];
    //分页空间居中
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    // 动画效果pagecontrol
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    //自动滚动间隔时间,默认2s
    cycleScrollView.autoScrollTimeInterval = 4.0;
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self.view addSubview:cycleScrollView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ===============  SDCycleScrollViewDelegate ===============
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    NextViewController *nextVC = [[NextViewController alloc]init];
    UIViewController *controller = [[CTMediator sharedInstance]CTMediator_CheckIsLogin:nextVC];
    [self.navigationController pushViewController:controller animated:YES];
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
