//
//  ConversationViewController.m
//  sjy
//
//  Created by 帅印 on 14-6-16.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "ConversationViewController.h"

@interface ConversationViewController ()

@end

@implementation ConversationViewController

@synthesize titledTabsView;

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
    
    //加入顶部的tabsView
    RKTabItem *mastercardTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0101white"] imageDisabled:[UIImage imageNamed:@"main0101gray"]];
    mastercardTabItem.titleString = @"用户";
    RKTabItem *paypalTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0102white"] imageDisabled:[UIImage imageNamed:@"main0102gray"]];
    paypalTabItem.titleString = @"群组";
    RKTabItem *visaTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"main0103white"] imageDisabled:[UIImage imageNamed:@"main0103gray"]];
    visaTabItem.titleString = @"企业";
    
    mastercardTabItem.tabState = TabStateEnabled;
    self.titledTabsView.darkensBackgroundForEnabledTabs = YES;
    self.titledTabsView.horizontalInsets = HorizontalEdgeInsetsMake(0, 0);
    self.titledTabsView.enabledTabBackgrondColor = [UIColor colorWithRed:180.0f/255.0f green:25.0f/255.0f blue:25.0f/255.0f alpha:1.0];
    self.titledTabsView.backgroundColor = [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1.0];
    self.titledTabsView.titlesFontColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    self.titledTabsView.tabItems = @[mastercardTabItem, paypalTabItem, visaTabItem];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - RKTabViewDelegate顶部的tabsView被点击
- (void)tabView:(RKTabView *)tabView tabBecameEnabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    //NSLog(@"Tab № %d became enabled on tab view", index);
    //判断是那个tab被点击

}

- (void)tabView:(RKTabView *)tabView tabBecameDisabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    //NSLog(@"Tab № %d became disabled on tab view", index);
}
@end
