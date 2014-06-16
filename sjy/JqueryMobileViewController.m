//
//  JqueryMobileViewController.m
//  sjy
//
//  Created by 文沥信息科技 on 13-11-21.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import "JqueryMobileViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface JqueryMobileViewController ()

@end

@implementation JqueryMobileViewController

@synthesize webview;

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
    //加载数据
    NSString *urlStr = @"http://192.168.1.115:8080/SJYServices/index.jsp";
    
    //NSString *urlStr = @"http://view.jquerymobile.com/1.3.2/dist/demos/";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webview loadRequest:req];
    
    //禁止滚动
    UIScrollView *scrollView = (UIScrollView *)[[webview subviews] objectAtIndex:0];
    scrollView.bounces = NO;
    
    
    
    
    UIBarButtonItem *selectBtn = [[UIBarButtonItem alloc] initWithTitle:@"城市选择" style:UIBarButtonItemStyleBordered target:self action:@selector(selectCity)];
    self.navigationItem.rightBarButtonItem = selectBtn;
}

- (void)selectCity
{
    NSString *result = [self.webview stringByEvaluatingJavaScriptFromString:@"select();"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You select city:" message:result delegate:self cancelButtonTitle:@"Sure" otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//浏览器加载完成事件
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"finsh...");
    //这个方法可以执行一段JavaScript脚本
    NSString * s = [webview stringByEvaluatingJavaScriptFromString:@"document.documentElement.textContent"];
    NSLog(@"%@",s);
}



//浏览器加载失败事件
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error...");
    //NSError对象以后会常常用到，非常有用。
    NSLog(@"%@",[error description]);
}

//这个方法是网页中的每一个请求都会被触发的
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlString = [[request URL] absoluteString];
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if([urlComps count] && [[urlComps objectAtIndex:0] isEqualToString:@"objc"]){
        NSArray *arrFucnameAndParameter = [(NSString*)[urlComps objectAtIndex:1] componentsSeparatedByString:@":/"];
        NSString *funcStr = [arrFucnameAndParameter objectAtIndex:0];
        if (1 == [arrFucnameAndParameter count])
        {
            // 没有参数
            if([[funcStr componentsSeparatedByString:@"/" ][0] isEqualToString:@"palymusic"])
            {
                /*调用本地函数1*/
                NSLog(@"doFunc1");
                
                //后台播放音频设置
//                AVAudioSession *session = [AVAudioSession sharedInstance];
//                [session setActive:YES error:nil];
//                [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//                
//                //让app支持接受远程控制事件
//                [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//                
//                NSString *soundPath=[[NSBundle mainBundle] pathForResource:@"baqnl" ofType:@"mp3"];
//                NSURL *soundUrl=[[NSURL alloc] initFileURLWithPath:soundPath];
//                AVAudioPlayer *player=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//                [player prepareToPlay];
//                [player play];
            }
        }
        else if(2 == [arrFucnameAndParameter count])
        {
            //有参数的
            if([funcStr isEqualToString:@"doFunc1"] &&
               [arrFucnameAndParameter objectAtIndex:1])
            {
                /*调用本地函数1*/
                NSLog(@"doFunc1:parameter"); 
            } 
        } 
        return NO;
    };
    return YES; 
} 





@end
