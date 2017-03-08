//
//  SportsTopContentView.h
//  YueDongQuan
//
//  Created by 陈良静 on 2017/3/8.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageContentViewDelegate <NSObject>

- (void)pageContentView:(UIView *)pageContentView ScrollSourceIndex:(int)sourceIndex targetIndex:(int)targetIndex progress:(CGFloat)progress;

@end

@interface PageContentView : UIView

/// 代理
@property(nonatomic, weak) id<PageContentViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame controllers:(NSArray <UIViewController *>*)childVcs parnentVc:(UIViewController *)parnentVc;

/// 设置当前的索引
- (void)setCurrentIndex:(int)index;

@end
