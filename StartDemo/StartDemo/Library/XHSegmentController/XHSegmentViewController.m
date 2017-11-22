//
//  XHSegmentViewController.m
//  ShouChouJin
//
//  Created by xihe on 15/9/23.
//  Copyright © 2015年 ouer. All rights reserved.
//

#import "XHSegmentViewController.h"

#define DefaultSegmentHeight 44

@interface XHSegmentViewController ()
<UIScrollViewDelegate, XHSegmentControlDelegate>

@property(nonatomic, strong) XHSegmentControl   *segmentControl;
@property(nonatomic)         CGFloat            beginOffsetX;
@property(nonatomic, strong) UIScrollView       *scrollView;
//编辑/完成按钮
@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation XHSegmentViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //10.19 添加title
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.backgroundColor = [UIColor clearColor];
       
        titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.shadowOffset = CGSizeMake(0, 0);
        self.navigationItem.titleView = titleLabel;
    }
    return self;
}

////支持旋转 10.17
//-(BOOL)shouldAutorotate{
//    return NO;
//}
////支持的方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.scrollView];
    //  监听contentScrollView
    [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - Private Method

- (void)selectNext
{
    if (self.segmentControl.selectIndex + 1 < self.viewControllers.count) {
        
        self.segmentControl.selectIndex = self.segmentControl.selectIndex + 1;
    }
}

- (void)selectPrevious
{
    if (self.segmentControl.selectIndex > 0) {
        
        self.segmentControl.selectIndex = self.segmentControl.selectIndex - 1;
    }
}

#pragma mark - lazy initializer
- (XHSegmentControl *)segmentControl
{
    if (!_segmentControl)
    {
        CGFloat y = !self.navigationController?20:0; //10.19 xiugai  64 --> 0
        _segmentControl = [[XHSegmentControl alloc] initWithFrame:CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, DefaultSegmentHeight)];
        _segmentControl.delegate = self;
    }
    return _segmentControl;
}

- (UIScrollView *)scrollView
{
    //  scrollView
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segmentControl.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(_segmentControl.frame))];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.decelerationRate = 0.5;
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

#pragma mark - Setters

- (void)setSegmentType:(XHSegmentType)segmentType
{
    _segmentType = segmentType;
    self.segmentControl.segmentType = segmentType;
}

- (void)setSegmentBackgroundColor:(UIColor *)segmentBackgroundColor
{
    _segmentBackgroundColor = segmentBackgroundColor;
    self.segmentControl.backgroundColor = segmentBackgroundColor;
}

- (void)setSegmentBackgroundImage:(UIImage *)segmentBackgroundImage
{
    _segmentBackgroundImage = segmentBackgroundImage;
    self.segmentControl.backgroundImage = segmentBackgroundImage;
}

- (void)setSegmentHighlightColor:(UIColor *)segmentHighlightColor
{
    _segmentHighlightColor = segmentHighlightColor;
    self.segmentControl.highlightColor = segmentHighlightColor;
}

- (void)setSegmentLineWidth:(CGFloat)segmentLineWidth
{
    _segmentLineWidth = segmentLineWidth;
    self.segmentControl.lineWidth = segmentLineWidth;
}

- (void)setSegmentBorderWidth:(CGFloat)segmentBorderWidth
{
    _segmentBorderWidth = segmentBorderWidth;
    self.segmentControl.borderWidth = segmentBorderWidth;
}

- (void)setSegmentBorderColor:(UIColor *)segmentBorderColor
{
    _segmentBorderColor = segmentBorderColor;
    self.segmentControl.borderColor = segmentBorderColor;
}

- (void)setSegmentTitleColor:(UIColor *)segmentTitleColor
{
    _segmentTitleColor = segmentTitleColor;
    self.segmentControl.titleColor = segmentTitleColor;
}

- (void)setSegmentTitleFont:(UIFont *)segmentTitleFont
{
    _segmentTitleFont = segmentTitleFont;
    self.segmentControl.titleFont = segmentTitleFont;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = viewControllers;
    [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *child, NSUInteger idx, BOOL * _Nonnull stop) {
        [child removeFromParentViewController];
    }];
    
    //  initialize
    NSMutableArray *arrayTitle = [[NSMutableArray alloc] init];
    for (UIViewController *c in self.viewControllers) {
        [arrayTitle addObject:c.title];
    }
    self.segmentControl.titles = arrayTitle;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * self.viewControllers.count, CGRectGetHeight(self.scrollView.frame));
    [self.segmentControl load];
}

#pragma mark - XHSegmentControlDelegate
- (void)xhSegmentSelectAtIndex:(NSInteger)index animation:(BOOL)animation
{
    //07.24
    if (index == 0) {
        //编辑
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedBtn.frame = CGRectMake(0, 0, 60, 25);
        _selectedBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _selectedBtn.layer.cornerRadius = 5;
        _selectedBtn.layer.masksToBounds = YES;
        [_selectedBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_selectedBtn setTitle:@"完成" forState:UIControlStateSelected];
        [_selectedBtn setBackgroundColor: [UIColor colorWithRed:0.0/255.0 green:183.0/255.0 blue:238.0/255.0 alpha:1.0]];
        
        [_selectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_selectedBtn addTarget:self action:@selector(selectedBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *selectItem = [[UIBarButtonItem alloc] initWithCustomView:_selectedBtn];
        
        self.navigationItem.rightBarButtonItem = selectItem;
    }else{
        self.navigationItem.rightBarButtonItem = nil;
        _selectedBtn.selected = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"bianji" object:_selectedBtn];
    }
    

    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *  _Nonnull controller, NSUInteger idx, BOOL * _Nonnull stop)
     {
         [controller removeFromParentViewController];
     }];
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    //  add controller
    UIViewController *controller = self.viewControllers[index];
    
    //  add view
    UIView *view = controller.view;
    [view removeFromSuperview];
    view.frame = CGRectMake(index * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    
    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
    [self.scrollView addSubview:view];
    
    //  add next view
    if (index + 1 < self.viewControllers.count) {
        UIViewController *nextController = self.viewControllers[index + 1];
        UIView *nextView = nextController.view;
        [nextView removeFromSuperview];
        nextView.frame = CGRectMake((index + 1) * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        [self.scrollView addSubview:nextView];
    }
    
    //  add previous view
    if (index - 1 >= 0) {
        UIViewController *previousController = self.viewControllers[index - 1];
        UIView *previousView = previousController.view;
        [previousView removeFromSuperview];
        [self.scrollView addSubview:previousView];
        previousView.frame = CGRectMake((index - 1) * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    }
    
    [self.scrollView scrollRectToVisible:view.frame animated:animation];
}

//07.24
- (void)selectedBtnClick{
    _selectedBtn.selected=!_selectedBtn.selected;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"bianji" object:_selectedBtn];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (!scrollView.isDecelerating) {
        
        self.beginOffsetX = CGRectGetWidth(scrollView.frame) * self.segmentControl.selectIndex;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    scrollView.userInteractionEnabled = YES;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGFloat targetX = targetContentOffset->x;
    NSInteger selectIndex = targetX/CGRectGetWidth(self.scrollView.frame);
    self.segmentControl.selectIndex = selectIndex;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"] && !self.scrollView.isDecelerating && self.scrollView.isDragging) {
        
        CGPoint contentOffset = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
        CGFloat rate = (contentOffset.x - self.beginOffsetX)/CGRectGetWidth(self.scrollView.        
frame);
        [self.segmentControl scrollToRate:rate];
    }
}

//10.19 重写settitle 加颜色
- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    UIView *view = self.navigationItem.titleView;
    if ([view isMemberOfClass:[UILabel class]]) {
        UILabel *titleLabel = (UILabel*)view;
        titleLabel.text = title;
        
        [titleLabel setTextColor:[UIColor whiteColor]];
        
        //2017.04.28 云会议室title
        titleLabel.textColor = [UIColor colorWithRed:59/255.0 green:56/255.0 blue:56/255.0 alpha:1];
        
        [titleLabel sizeToFit];
        CGRect f = titleLabel.frame;
        
        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - f.size.width/2, 0, f.size.width, 44);
        
        //titleLabel.center = self.navigationController.navigationBar.center;
    }
}

@end
