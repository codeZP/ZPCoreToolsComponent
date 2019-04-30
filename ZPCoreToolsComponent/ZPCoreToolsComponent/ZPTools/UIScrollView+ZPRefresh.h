//
//  UIScrollView+ZPRefresh.h
//  ZPToolsComponentDemo
//
//  Created by 恋指团 on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (ZPRefresh)

#pragma mark - 设置刷新控件
/**
 添加头部刷新控件

 @param block 进入刷新状态的回调
 */
- (void)addHeaderRereshWithBlock:(MJRefreshComponentRefreshingBlock )block;

/**
 添加底部刷新控件

 @param block 进入刷新状态的回调
 */
- (void)addFooterRereshWithBlock:(MJRefreshComponentRefreshingBlock )block;

#pragma mark - 开始结束刷新
/**
 头部开始刷新
 */
- (void)headerBeginRefresh;

/**
 头部结束刷新
 */
- (void)headerEndRefresh;

/**
 底部结束刷新
 */
- (void)footerEndRefresh;

#pragma mark - 控制
/**
 没有更多数据
 */
- (void)nomoreData;

/**
 隐藏底部刷新控件
 */
- (void)footerHidden;
@end

NS_ASSUME_NONNULL_END
