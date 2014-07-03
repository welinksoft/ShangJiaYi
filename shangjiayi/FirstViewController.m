//
//  FirstViewController.m
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(void)viewWillAppear:(BOOL)animated{
    //设置导航栏的文字
    self.tabBarController.navigationItem.title = @"首页";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
