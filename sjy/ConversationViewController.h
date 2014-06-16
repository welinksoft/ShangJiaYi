//
//  ConversationViewController.h
//  sjy
//
//  Created by 帅印 on 14-6-16.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKTabView.h"

@interface ConversationViewController : UIViewController<RKTabViewDelegate>
//顶部显示的tabsView
@property (nonatomic, strong) IBOutlet RKTabView *titledTabsView;

@end
