//
//  ThreeViewController.h
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeViewController : UIViewController<SKSTableViewDelegate>
//可折叠的TableView
@property (nonatomic, weak) IBOutlet SKSTableView *tableView;
//数据
@property (nonatomic, strong) NSArray *contents;

@end
