//
//  LoginViewController.m
//  sjy
//
//  Created by mbp-welink on 13-11-18.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

//合成
@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize tageLabel;
@synthesize receiveData;

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
    //当加载完成的时候，判断用户是否保存过用户信息
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    usernameTextField.text = ![defaults objectForKey:@"userName"]?@"":[defaults objectForKey:@"userName"];
    passwordTextField.text = ![defaults objectForKey:@"passWord"]?@"":[defaults objectForKey:@"passWord"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TextField_DidEndOnExit:(id)sender {
    // 隐藏键盘.
    [sender resignFirstResponder];
}

//登录时请求的事件
-(IBAction)loginLoadBtnOnclick:(id)sender{
    //判断是否有输入用户名
    if ([@"" isEqualToString:[usernameTextField text]]) {
        [tageLabel setText:@"请输入用户名称"];
        return;
    }
    if ([@"" isEqualToString:[passwordTextField text]]) {
        [tageLabel setText:@"请输入用户密码"];
        return;
    }
    
    
    
    //NSLog(@"loginLoadBtnOnclick");
    [ProgressHUD show:@"登录中..."];
    
    //第一步创建URL
    NSURL *url = [NSURL URLWithString:@"http://10.0.0.107:8080/mobile/login.htm"];
    //第二步创建ASIHTTPRequest请求
    //    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request setTimeOutSeconds:60];
    
    //第三步设置请求参数
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [request addPostValue:[usernameTextField text] forKey:@"account"];
    [request addPostValue:[passwordTextField text] forKey:@"pwd"];
    [request addPostValue:![defaults objectForKey:@"appid"]?@"":[defaults objectForKey:@"appid"] forKey:@"appId"];
    [request addPostValue:![defaults objectForKey:@"channelid"]?@"":[defaults objectForKey:@"channelid"] forKey:@"channelId"];
    [request addPostValue:![defaults objectForKey:@"userid"]?@"":[defaults objectForKey:@"userid"] forKey:@"userId"];
    [request addPostValue:@"IOS" forKey:@"targetAndroidOrIOS"];
    
    //第四步设置代理
    request.delegate = self;
    
    //设置网络请求完成后调用的block
    //Block Retain Cycles  ASI不支持ARC所以跟block冲突导致提前释放了对象
    __block ASIFormDataRequest *blockrequest = request;
    [request setCompletionBlock:^{
        //NSLog(@"%@",blockrequest.responseHeaders);
        
        //NSData *data = blockrequest.responseData;
        //[UIImage imageWithData:data];
        
        //---------------判断数据的来源:网络 or 缓存------------------
        if (blockrequest.didUseCachedResponse) {
            NSLog(@"数据来自缓存");
        } else {
            NSLog(@"数据来自网络");
        }
    }];
    
    //请求失败调用的block
    [request setFailedBlock:^{
        NSError *error = blockrequest.error;
        NSLog(@"请求网络出错：%@",error);
    }];
    
    //---------------------设置缓存------------------------
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    ASIDownloadCache *cache = [[ASIDownloadCache alloc] init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    //每次请求会将上一次的请求缓存文件清除
    //    request.cacheStoragePolicy = ASICacheForSessionDurationCacheStoragePolicy;
    //持久缓存，一直保存在本地
    //    request.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
    //    request.downloadCache = cache;
    
    
    //发送异步请求
    [request startAsynchronous];
}

#pragma mark - ASIHTTPRequest delegate
//请求数据完成
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSData *data = request.responseData;
    NSString *receiveStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //调用JSONKIT解析数据
    NSMutableDictionary *infos = [receiveStr objectFromJSONString];
    NSString *suinfo = [infos valueForKey:@"success"];
    if ([@"success" isEqualToString:suinfo]) {
        //登录成功
        //保存用户信息
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        [defaults setObject:[usernameTextField text] forKey:@"userName"];
        [defaults setObject:[passwordTextField text] forKey:@"passWord"];
        [defaults setBool:true forKey:@"isLogin"];
        [defaults synchronize];//用synchronize方法把数据持久化到standardUserDefaults数据库
        
        [ProgressHUD dismiss];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        //登录失败
        [ProgressHUD dismiss];
        [tageLabel setText:[infos valueForKey:@"msg"]];
    }
    

}

//请求失败
- (void)requestFailed:(ASIHTTPRequest *)request {
    //NSError *error = request.error;
    [ProgressHUD dismiss];
    [MBHUDView hudWithBody:@"网络异常" type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
}

@end
