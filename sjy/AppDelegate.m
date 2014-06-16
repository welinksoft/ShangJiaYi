//
//  AppDelegate.m
//  sjy
//
//  Created by mbp-welink on 13-11-18.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "BPush.h"
#import "JSONKit.h"

@implementation AppDelegate

//@synthesize appId, channelId, userId;

- (void)dealloc
{
    //采用ARC方式不需要开发者手动释放内存，部分第三方框架过滤采用ARC方式
    //[_window release];
    //[_viewController release];
    //[super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {//判断版本是否为7.0以上
         [application setStatusBarStyle:UIStatusBarStyleLightContent];//黑体白字
         //[application setStatusBarStyle:UIStatusBarStyleDefault];//黑体黑字
     }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.viewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    //if(ScreenHeight == 568){
        MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainViewController_568" bundle:nil];
        _naviController = [[UINavigationController alloc]initWithRootViewController:viewController];
        viewController.title = @"商家易";
    //}else{
    //    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    //    _naviController = [[UINavigationController alloc]initWithRootViewController:viewController];
    //    viewController.title = @"商家易";
    //}
    
    
    //viewController
    //给导航控制器设置文字颜色
    NSDictionary *navTitleArr = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIFont boldSystemFontOfSize:20],UITextAttributeFont,
                                 [UIColor whiteColor],UITextAttributeTextColor ,
                                 [NSValue valueWithCGSize:CGSizeMake(0.0, 0.0)] , UITextAttributeTextShadowOffset ,
                                 [UIColor whiteColor] ,UITextAttributeTextShadowColor ,
                                 nil];
    [_naviController.navigationBar setTitleTextAttributes:navTitleArr];
    
    //设置导航栏的颜色
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {//判断版本是否为7.0以上
        [_naviController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bgs.png"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//给导航栏返回按钮设置颜色
    }else{
        [_naviController.navigationBar setBackgroundImage: [UIImage imageNamed:@"nav_bg_ios6s.png"] forBarMetrics:UIBarMetricsDefault];
    }
    
    self.window.rootViewController = _naviController;
    [self.window makeKeyAndVisible];
    
    [BPush setupChannel:launchOptions];
    [BPush setDelegate:self];
    
    [application setApplicationIconBadgeNumber:0];
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeAlert
     | UIRemoteNotificationTypeBadge
     | UIRemoteNotificationTypeSound];
    
    //请求百度KEY对手机进行绑定
    if ([@"" isEqualToString:[BPush getUserId]]) {
        [BPush bindChannel];
    }
    //[BPush unbindChannel];
    
    
    //向微信注册
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"demo 2.0"];
    
    return YES;
}


- (void) onMethod:(NSString*)method response:(NSDictionary*)data {
    NSLog(@"On method:%@", method);
    NSLog(@"data:%@", [data description]);
    NSDictionary* res = [[NSDictionary alloc] initWithDictionary:data];
    if ([BPushRequestMethod_Bind isEqualToString:method]) {
        NSString *appid = [res valueForKey:BPushRequestAppIdKey];
        NSString *userid = [res valueForKey:BPushRequestUserIdKey];
        NSString *channelid = [res valueForKey:BPushRequestChannelIdKey];
        //NSString *requestid = [res valueForKey:BPushRequestRequestIdKey];
        int returnCode = [[res valueForKey:BPushRequestErrorCodeKey] intValue];
        
        if (returnCode == BPushErrorCode_Success) {
            // 在内存中备份，以便短时间内进入可以看到这些值，而不需要重新bind保存到用户数据中
            NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
            [defaults setObject:appid forKey:@"appid"];
            [defaults setObject:channelid forKey:@"channelid"];
            [defaults setObject:userid forKey:@"userid"];
            [defaults synchronize];//用synchronize方法把数据持久化到standardUserDefaults数据库
            
        }
    } else if ([BPushRequestMethod_Unbind isEqualToString:method]) {
        int returnCode = [[res valueForKey:BPushRequestErrorCodeKey] intValue];
        if (returnCode == BPushErrorCode_Success) {
            //self.viewController.appidText.text = nil;
            //self.viewController.useridText.text = nil;
            //self.viewController.channelidText.text = nil;
        }
    }
    //self.viewController.textView.text = [[NSString alloc] initWithFormat: @"%@ return: \n%@", method, [data description]];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//推送实现回调，错误时
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"error : %@",[error localizedDescription]);
}
//推送实现回调，正确返回token时
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // NSLog(@"test:%@",deviceToken);
    [BPush registerDeviceToken: deviceToken];
    
    //self.viewController.textView.text = [self.viewController.textView.text stringByAppendingFormat: @"Register device token: %@\n", deviceToken];
}
//推送实现回调，正确返回消息时
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"Receive Notify: %@", [userInfo JSONString]);
    NSString *alert = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
//    NSString *appcode = [[userInfo objectForKey:@"aps"] objectForKey:@"appcode"];
//    if ([@"LOGINOUT" isEqualToString:appcode]) {
//        //退出用户标示，跳转到登录界面
//        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
//        //[defaults setObject:[usernameTextField text] forKey:@"userName"];
//        [defaults setObject:@"" forKey:@"passWord"];
//        [defaults setBool:false forKey:@"isLogin"];
//        [defaults synchronize];
//        
//        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
//        [_naviController presentViewController:login animated:YES completion:nil];
//    }
    
    
    
    
    if (application.applicationState == UIApplicationStateActive) {
        // Nothing to do if applicationState is Inactive, the iOS already displayed an alert view.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Did receive a Remote Notification"
                                                            message:[NSString stringWithFormat:@"The application received this remote notification while it was running:\n%@", alert]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    [application setApplicationIconBadgeNumber:0];
    
    [BPush handleNotification:userInfo];
    
    //self.viewController.textView.text = [self.viewController.textView.text stringByAppendingFormat:@"Receive notification:\n%@", [userInfo JSONString]];
}


//IOS7将会调用这个方法
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    //IOS7特有的后台后处理APP
//    NSLog(@"IOS_OK");
//}


// 跟微信有关
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL isSuc = [WXApi handleOpenURL:url delegate:self];
    NSLog(@"url %@ isSuc %d",url,isSuc == YES ? 1 : 0);
    return  isSuc;
}

@end
