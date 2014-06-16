//
//  AppDelegate.h
//  sjy
//
//  Created by mbp-welink on 13-11-18.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPush.h"
#import "WXApi.h"


@class LoginViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,BPushDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LoginViewController *viewController;

@property (strong, nonatomic)  UINavigationController *naviController;

//@property NSString *appId;
//@property NSString *channelId;
//@property NSString *userId;

@end
