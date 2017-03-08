//
//  SportsTopTitleView.h
//  YueDongQuan
//
//  Created by 陈良静 on 2017/3/8.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 颜色
#define CLJRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0];

@protocol PageTitleViewDelegate <NSObject>

- (void)pageTitleView:(UIView *)pageTitleView selectedIndex:(int)index;

@end

@interface PageTitleView : UIView

/// 代理
@property(nonatomic, weak) id<PageTitleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray <NSString *> *)titles;

/// 重置UI
- (void)resetTitleViewWithSourceIndex:(int)sourceIndex targetIndex:(int)targetIndex progress:(CGFloat)progress;

@end
