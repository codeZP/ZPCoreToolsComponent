//
//  UIScrollView+ZPRefresh.m
//  ZPToolsComponentDemo
//
//  Created by 恋指团 on 2019/4/16.
//  Copyright © 2019 恋指团. All rights reserved.
//

#import "UIScrollView+ZPRefresh.h"

@implementation UIScrollView (ZPRefresh)

- (void)addHeaderRereshWithBlock:(MJRefreshComponentRefreshingBlock)block {
    self.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        if (block) {
            block();
        }
    }];
}

- (void)addFooterRereshWithBlock:(MJRefreshComponentRefreshingBlock)block {
    self.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        if (block) {
            block();
        }
    }];
}

- (void)headerBeginRefresh {
    [self.mj_header beginRefreshing];
}

- (void)headerEndRefresh {
    [self.mj_header endRefreshing];
}

- (void)footerEndRefresh {
    [self.mj_footer endRefreshing];
}

- (void)nomoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)footerHidden {
    self.mj_footer.hidden = YES;
}

@end
