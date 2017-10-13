//
//  BaseTableViewController.h
//  Demo
//
//  Created by 李峰 on 2017/9/27.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"
#import "UIScrollView+EmptyDataSet.h"

@interface BaseTableViewController : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

@property (nonatomic, strong) BaseTableView *tableView;

@end
