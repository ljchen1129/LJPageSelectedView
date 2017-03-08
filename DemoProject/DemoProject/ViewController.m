//
//  ViewController.m
//  DemoProject
//
//  Created by 陈良静 on 2017/3/8.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "PageTitleView.h"
#import "PageContentView.h"

/// 随机色
#define CLJRandomColor CLJRGBColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define kTitles @[@"计步", @"跑步", @"健身", @"骑行", @"游泳", @"羽毛球"]

static CGFloat const kTitleViewH = 50.0;

@interface ViewController ()<PageTitleViewDelegate, PageContentViewDelegate>

/// titles
@property(nonatomic, strong) NSArray *titles;

///topTitleView
@property(nonatomic, strong) PageTitleView *titleView;

/// contentView
@property(nonatomic, strong) PageContentView *contentView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置UI
    [self setupUI];
}

#pragma mark - UI

- (void)setupUI
{
    // 1.不要调整UIScrollView的内边距，不然系统会自动将scrollView的y坐标加64
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 2. 添加titleView
    [self.view addSubview:self.titleView];
    
    // 3.添加contentView
    [self.view addSubview:self.contentView];
}

#pragma mark - PageTitleViewDelegate

- (void)pageTitleView:(UIView *)pageTitleView selectedIndex:(int)index
{
    [self.contentView setCurrentIndex:index];
}

#pragma mark - PageContentViewDelegate

- (void)pageContentView:(UIView *)pageContentView ScrollSourceIndex:(int)sourceIndex targetIndex:(int)targetIndex progress:(CGFloat)progress
{
    [self.titleView resetTitleViewWithSourceIndex:sourceIndex targetIndex:targetIndex progress:progress];
}

#pragma mark - setter

- (PageContentView *)contentView
{
    if (!_contentView)
    {
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (int i = 0; i < kTitles.count; ++i)
        {
            UIViewController *childVc = [[UIViewController alloc] init];
            UILabel *label = [[UILabel alloc] init];
            label.center = childVc.view.center;
            label.text = [NSString stringWithFormat:@"第%d页", i];
            [label sizeToFit];
            [childVc.view addSubview:label];
            childVc.view.backgroundColor = CLJRandomColor;
            [tempArray addObject:childVc];
        }
        
        CGRect frame = CGRectMake(0, kTitleViewH + 64, self.view.bounds.size.width, self.view.bounds.size.height - kTitleViewH);
        _contentView = [[PageContentView alloc] initWithFrame:frame controllers:tempArray parnentVc:self];
        _contentView.delegate = self;
    }
    
    return _contentView;
}

- (PageTitleView *)titleView
{
    if (!_titleView)
    {
        CGRect frame = CGRectMake(0, 64, self.view.bounds.size.width, kTitleViewH);
        _titleView = [[PageTitleView alloc] initWithFrame:frame titles:kTitles];
        _titleView.delegate = self;
    }
    
    return _titleView;
}

@end
