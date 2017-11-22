//
//  HomeViewController.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/15.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "HomeViewController.h"
#import <HMSegmentedControl.h>
#import "BaseTableViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) HMSegmentedControl   *segmentedControl;
@property (nonatomic, strong) UIScrollView         *scrollView;
@property (nonatomic, strong) BaseTableViewController *tableViewController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.segmentedControl;
    [self.view addSubview:self.scrollView];
    // Do any additional setup after loading the view.
}

-(HMSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, IMScreenWidth, 40)];
        /*! 设置标题 */
        _segmentedControl.sectionTitles = @[@"最新",@"排行榜",@"手机",@"新闻",@"游戏",@"数码",@"段子",@"科技"];
        /*! 自适应宽度,随着屏幕滑动自动滚动 */
        _segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        /*! 默认选中第0个view */
        _segmentedControl.selectedSegmentIndex = 0;
        /*! 标题背景颜色 */
        _segmentedControl.backgroundColor = [UIColor clearColor];
        /*! 标题默认字体颜色 */
        _segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : IMFontSize(16)};
        /*! 标题选中字体颜色 */
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : IMRGBColor(222, 86, 46)};
        /*! 标题选中下划线颜色 */
        _segmentedControl.selectionIndicatorColor  = IMRGBColor(222, 86, 46);
        /*! 标题选中的下划线高度 */
        _segmentedControl.selectionIndicatorHeight = 2.0f;
        /*! 标题选种样式:本样式为下划线 */
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        /*! 标题选中的下划线方向:本样式为向下 */
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        /*! 标题的中间的分割线 (默认为:NO) */
        _segmentedControl.verticalDividerEnabled = NO;
        /*! 标题中间的隔线颜色 */
        _segmentedControl.verticalDividerColor = [UIColor lightGrayColor];
        /*! 标题中间的隔线宽度 */
        _segmentedControl.verticalDividerWidth = 1.0f;
        
         /*! 标题点击事件 */
        IMWEAKSELF;
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(IMScreenWidth*index, 0, IMScreenHeight, weakSelf.scrollView.height) animated:YES];
        }];
    }
    return _segmentedControl;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        /*! 这里的frame按实际情况更改！ */
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, IMScreenWidth, IMScreenHeight - 64 - IMTabbarHeight)];
        _scrollView.backgroundColor = [UIColor greenColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(IMScreenWidth*_segmentedControl.sectionTitles.count, _scrollView.height);
        _scrollView.delegate = self;
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, IMScreenWidth, _scrollView.height) animated:YES];
        [self.view addSubview:_scrollView];
        [_scrollView addSubview:self.tableViewController.view];
    }
    return _scrollView;
}

#pragma mark ===============  UIScrollerViewDelegate ===============
/*! 滑动结束_segmentedControl更改下划线选中位置 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWith = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWith;
    [_segmentedControl setSelectedSegmentIndex:page animated:YES];
}

-(BaseTableViewController *)tableViewController{
    if (!_tableViewController) {
        _tableViewController = [[BaseTableViewController alloc]init];
        _tableViewController.view.frame = CGRectMake(0, 0, IMScreenWidth, _scrollView.height);
    }
    return _tableViewController;
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
