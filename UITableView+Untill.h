//
//  UITableView+Untill.h
//  YiYunTong
//
//  Created by 杭州帮聚 on 2018/5/12.
//  Copyright © 2018年 谢亚波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^refreshHeadFooterBlock)(NSInteger type);//type 0下拉刷新,1上拉加载

@interface UITableView (Untill)

{
    
}

@property (nonatomic, assign)NSInteger pagenum;

- (void)TabViewRefreshBlock:(refreshHeadFooterBlock)block;

- (void)TabViewEndRefrsh;

- (void)TabViewNomorData;

@end
