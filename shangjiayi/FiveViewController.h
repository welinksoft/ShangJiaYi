//
//  FiveViewController.h
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//存放数据
@property (retain,nonatomic) NSMutableArray *allListData;//存放的数据
//表格
@property (retain,nonatomic) IBOutlet UITableView *tableView_this;

@end
