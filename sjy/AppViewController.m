//
//  AppViewController.m
//  sjy
//
//  Created by 文沥信息科技 on 13-11-21.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import "AppViewController.h"
#import "JqueryMobileViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击测试
-(IBAction)testBtnOnclick:(id)sender{
    JqueryMobileViewController *app = [[JqueryMobileViewController alloc]initWithNibName:@"JqueryMobileViewController" bundle:nil];
    app.title = @"JQuery Mobile";
    [self.navigationController pushViewController:app animated:true];
}

@end
