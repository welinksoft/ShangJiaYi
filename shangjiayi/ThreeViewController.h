//
//  ThreeViewController.h
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//存放数据
@property (retain,nonatomic) NSMutableDictionary *allListData;//存放的数据
//存放分类的数据
@property (retain,nonatomic) NSMutableArray *allListData_for_top;
//显示数据的tableview
@property (retain,nonatomic) IBOutlet UITableView *tableView_this;

@end
