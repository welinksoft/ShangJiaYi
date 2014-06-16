//
//  MainViewController.m
//  sjy
//
//  Created by mbp-welink on 13-11-18.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
#import "RKTabView.h"
#import "ConversationViewController.h"
#import "AddressListViewController.h"

@interface MainViewController () <RKTabViewDelegate>
@property (nonatomic, strong) IBOutlet RKTabView *titledTabsView;
@end

@implementation MainViewController

@synthesize view01;
@synthesize view02;
@synthesize view03;
@synthesize view04;
@synthesize view05;

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
    //初始化视图
    ConversationViewController *conversationViewController = [[ConversationViewController alloc] init];
    [view02 addSubview:conversationViewController.view];
    
    AddressListViewController *addressListViewController = [[AddressListViewController alloc] init];
    [view03 addSubview:addressListViewController.view];
    
    //初始化显示的view
    view01.hidden = NO;
    view02.hidden = YES;
    view03.hidden = YES;
    view04.hidden = YES;
    view05.hidden = YES;
    
    RKTabItem *mastercardTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0101white"] imageDisabled:[UIImage imageNamed:@"main0101gray"]];
    mastercardTabItem.titleString = @"首页";
    RKTabItem *paypalTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0102white"] imageDisabled:[UIImage imageNamed:@"main0102gray"]];
    paypalTabItem.titleString = @"会话";
    RKTabItem *visaTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0103white"] imageDisabled:[UIImage imageNamed:@"main0103gray"]];
    visaTabItem.titleString = @"通讯录";
    RKTabItem *wuTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0104white"] imageDisabled:[UIImage imageNamed:@"main0104gray"]];
    wuTabItem.titleString = @"应用";
    RKTabItem *wireTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0105white"] imageDisabled:[UIImage imageNamed:@"main0105gray"]];
    wireTabItem.titleString = @"设置";
    
    mastercardTabItem.tabState = TabStateEnabled;
    self.titledTabsView.darkensBackgroundForEnabledTabs = YES;
    self.titledTabsView.horizontalInsets = HorizontalEdgeInsetsMake(0, 0);
    self.titledTabsView.enabledTabBackgrondColor = [UIColor colorWithRed:180.0f/255.0f green:25.0f/255.0f blue:25.0f/255.0f alpha:1.0];
    self.titledTabsView.backgroundColor = [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1.0];
    self.titledTabsView.titlesFontColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    self.titledTabsView.tabItems = @[mastercardTabItem, paypalTabItem, visaTabItem, wuTabItem, wireTabItem];
    
    //设置注销按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"退出"style:UIBarButtonItemStyleDone target:self action:@selector(exitButton:)];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {//判断版本是否为7.0以上
            [rightButton setTintColor:[UIColor whiteColor]];
    }
    self.navigationItem.rightBarButtonItem = rightButton;

    //判断是否登录
    //NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    //if(![defaults boolForKey:(@"isLogin")]){
    //    //判断主界面是否加载完成，加载完成后如果没有登录则跳转到登录界面
    //    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    //   [self presentViewController:login animated:YES completion:nil];
    //}

    //[self presentModalViewController:pNewController animated:YES];
    //替换为
    //[self presentViewController:pNewController animated:YES completion:nil];
    
    //相对应的
    //dismissModalViewControllerAnimated :animated: is deprecated :first deprecated in iOS6.0
    //[self dismissModalViewControllerAnimated:YES];
    //替换为
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//注销的按钮事件
-(void)exitButton:(id)sender{
    //提示用户是否要注销登录
    //弹出对话框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"商家易"
                                                    message:@"是否退出当前用户"
                                                   delegate:self
                                          cancelButtonTitle:@"退出"
                                          otherButtonTitles:@"取消", nil];
    //显示对话框
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (0 == buttonIndex) {
        //退出用户标示，跳转到登录界面
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        //[defaults setObject:[usernameTextField text] forKey:@"userName"];
        [defaults setObject:@"" forKey:@"passWord"];
        [defaults setBool:false forKey:@"isLogin"];
        [defaults synchronize];
        
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        [self presentViewController:login animated:YES completion:nil];
    }
}

#pragma mark - RKTabViewDelegate

- (void)tabView:(RKTabView *)tabView tabBecameEnabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    //NSLog(@"Tab № %d became enabled on tab view", index);
    //判断是那个tab被点击
    if (0 == index) {
        view01.hidden = NO;
        view02.hidden = YES;
        view03.hidden = YES;
        view04.hidden = YES;
        view05.hidden = YES;
    }else if(1 == index){
        view01.hidden = YES;
        view02.hidden = NO;
        view03.hidden = YES;
        view04.hidden = YES;
        view05.hidden = YES;
    }else if(2 == index){
        view01.hidden = YES;
        view02.hidden = YES;
        view03.hidden = NO;
        view04.hidden = YES;
        view05.hidden = YES;
    }else if(3 == index){
        view01.hidden = YES;
        view02.hidden = YES;
        view03.hidden = YES;
        view04.hidden = NO;
        view05.hidden = YES;
    }else if(4 == index){
        view01.hidden = YES;
        view02.hidden = YES;
        view03.hidden = YES;
        view04.hidden = YES;
        view05.hidden = NO;
    }
}

- (void)tabView:(RKTabView *)tabView tabBecameDisabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    //NSLog(@"Tab № %d became disabled on tab view", index);
}

@end
