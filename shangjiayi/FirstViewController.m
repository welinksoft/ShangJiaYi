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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置导航栏的颜色
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {//判断版本是否为7.0以上
//        [_navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bgs.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//给导航栏返回按钮设置颜色
//    }else{
//        [_navigationBar setBackgroundImage: [UIImage imageNamed:@"nav_bg_ios6s.png"] forBarMetrics:UIBarMetricsDefault];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
