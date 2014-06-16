//
//  WebImageView.m
//  ASIHttpDemo
//
//  Created by wei.chen on 13-1-11.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "WebImageView.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "AppDelegate.h"

@implementation WebImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImageURL:(NSURL *)url {
    //同步请求
//    [self synchronous:url];
    
    //异步请求
    [self aSynchronous:url];
}

//异步请求
- (void)aSynchronous:(NSURL *)url {
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];

    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //POST请求
    //username=wxhl&password=123456
    //想请求体中设置参数
//    [request addPostValue:<#(id<NSObject>)#> forKey:<#(NSString *)#>];
    
    //设置代理
//    request.delegate = self;
    
    //设置网络请求完成后调用的block
    [request setCompletionBlock:^{
        NSLog(@"%@",request.responseHeaders);
        
        NSData *data = request.responseData;
        self.image = [UIImage imageWithData:data];
        
        //---------------判断数据的来源:网络 or 缓存------------------
        if (request.didUseCachedResponse) {
            NSLog(@"数据来自缓存");
        } else {
            NSLog(@"数据来自网络");
        }
    }];
    
    //请求失败调用的block
    [request setFailedBlock:^{
        NSError *error = request.error;
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
    
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    [appDelegate.queue addOperation:request];
}

//同步请求
- (void)synchronous:(NSURL *)url {
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:60];
    
    //设置请求头
    //    [request setRequestHeaders:<#(NSMutableDictionary *)#>];
    //设置cookies
    //    [request setRequestCookies:<#(NSMutableArray *)#>];
    
    //发送同步请求
    [request startSynchronous];
    
    NSError *error = request.error;
    if (error == nil) {
        //获取请求下来的数据
        NSData *data = request.responseData;
        UIImage *image = [UIImage imageWithData:data];
        self.image = image;
    } else {
        NSLog(@"请求网络出错：%@",error);
    }
}

#pragma mark - ASIHTTPRequest delegate
//请求数据完成
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSData *data = request.responseData;
    self.image = [UIImage imageWithData:data];
}

//请求失败
- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = request.error;
    NSLog(@"请求网络出错：%@",error);
}

@end
