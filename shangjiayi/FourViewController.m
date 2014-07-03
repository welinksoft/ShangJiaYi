//
//  FourViewController.m
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "FourViewController.h"
#import "Product_CategoryViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

-(void)viewWillAppear:(BOOL)animated{
    //设置导航栏的文字
    self.tabBarController.navigationItem.title = @"应用";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//产品库存点击函数
-(IBAction)product_inventory_buttom_onclick:(id)sender{
    Product_CategoryViewController *pro = [[Product_CategoryViewController alloc]init];
    pro.title = @"产品分类";
    [self.navigationController pushViewController:pro animated:true];
}

@end
