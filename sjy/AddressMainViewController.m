//
//  AddressMainViewController.m
//  sjy
//
//  Created by 文沥信息科技 on 14-1-12.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "AddressMainViewController.h"
#import "AppViewController.h"

@interface AddressMainViewController ()

@end

@implementation AddressMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //加载标签控制器
    //self.navigationController.navigationBarHidden = YES;
    
    if (tabBarCon == nil) {
        tabBarCon = [[UITabBarController alloc] init];
        UIViewController *firstViewController = [[UIViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
        //[firstViewController.view setBackgroundColor:[UIColor redColor]];
        UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        firstNav.tabBarItem.image = [UIImage imageNamed:@"list_user.png"];
        [firstNav setTitle:@"用户"];
        
        UIViewController *secondViewController = [[UIViewController alloc] init];
        [secondViewController.view setBackgroundColor:[UIColor blueColor]];
        UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
        secondNav.tabBarItem.image = [UIImage imageNamed:@"list_group_grey.png"];
        [secondNav setTitle:@"群组"];
        
        UIViewController *threeViewController = [[UIViewController alloc] init];
        [threeViewController.view setBackgroundColor:[UIColor yellowColor]];
        UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:threeViewController];
        threeNav.tabBarItem.image = [UIImage imageNamed:@"list_enterprise_grey.png"];
        [threeNav setTitle:@"企业"];
        
        tabBarCon.viewControllers = [NSArray arrayWithObjects:firstNav,secondNav,threeNav, nil];
    }
    /*******************************************************************************************************/
    tabBarCon.view.frame = CGRectMake(0.0, -70.0, 320.0, 635.0);// 这句很关键，不加这句将会有一段状态栏高度的空白区域
    /*******************************************************************************************************/
    [self.view addSubview:tabBarCon.view];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
