//
//  UITableView+Untill.m
//  YiYunTong
//
//  Created by 杭州帮聚 on 2018/5/12.
//  Copyright © 2018年 谢亚波. All rights reserved.
//

#import "UITableView+Untill.h"
#import <objc/runtime.h>
#import <MJRefresh/MJRefresh.h>
static const NSString *STRING_KEY = @"STRING_KEY";
@implementation UITableView (Untill)

- (void)TabViewEndRefrsh
{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)setPagenum:(NSInteger)pagenum
{
    objc_setAssociatedObject(self, &STRING_KEY, [NSString stringWithFormat:@"%ld",pagenum], OBJC_ASSOCIATION_RETAIN);
}
- (NSInteger)pagenum
{
    return [objc_getAssociatedObject(self, &STRING_KEY) integerValue];
}

- (void)TabViewRefreshBlock:(refreshHeadFooterBlock)block
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (block) {
            self.pagenum = 1;
            block(0);
        }
    }];
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        if (block) {
            self.pagenum +=1;
            block(0);
        }
    }];
    [footer setImages:@[[UIImage imageNamed:@"nomoreData"]] forState:MJRefreshStateNoMoreData];
    [footer setImages:@[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"]] forState:MJRefreshStateRefreshing];
    [footer setImages:@[[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"]] forState:MJRefreshStateIdle];
    self.mj_footer = footer;
}

- (void)TabViewNomorData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

@end
