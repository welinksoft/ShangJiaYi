//
//  Product_CategoryViewController.m
//  shangjiayi
//
//  Created by 帅印 on 14-7-3.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "Product_CategoryViewController.h"
#import "Product_Category_TableViewCell.h"
#import "Product_Category_TableViewTopView.h"

//定义刷新tableCell
NSString *const Product_Category_TableViewCellIdentifier = @"Product_Category_TableViewCell";

@interface Product_CategoryViewController (){
    MJRefreshHeaderView *_header;//下拉刷新
}

@end

@implementation Product_CategoryViewController

@synthesize allListData;
@synthesize allListData_for_top;
@synthesize tableView_this;

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
    
    //初始化数据源
    self.allListData = [[NSMutableDictionary alloc]init];
    self.allListData_for_top = [[NSMutableArray alloc]init];
    
    //在界面加载的时候加载数据
    //[self.tableView_this registerClass:[AddressListCellSubTableViewCell class] forCellReuseIdentifier:WeAddressListCellSubTableCellIdentifier];
    //[self addHeader];
    
    //去掉该死的ios7的分割线
    if ([self.tableView_this respondsToSelector:@selector(setSeparatorInset:)]) {
        //[self.tableView setSeparatorInset:UIEdgeInsetsZero];
        tableView_this.separatorStyle = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//刷新加载的方法
- (void)addHeader
{
    //__unsafe_unretained MainViewController *vc = self;
    
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView_this;
    header.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        
        
        //使用GCD
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 耗时的操作
            
            NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
            // 进入刷新状态就会回调这个Block
            //同步请求服务器数据
            //第一步，创建URL
            //            NSString *urlStr = [[defaults objectForKey:@"JKXY_main_uri"] stringByAppendingString:[CreateConnectStrUntiy CreateStr:@"other"]];
            //            NSURL *url = [NSURL URLWithString:urlStr];
            //            //第二步，通过URL创建网络请求
            //            NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
            //            //第三步，连接服务器
            //            NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            //            NSString *receiveStr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                // 更新界面
                //                //得到数据后解析数据
                //                //判断是否为空
                //                if (![@"" isEqualToString:receiveStr]) {
                //
                //                    NSMutableDictionary *infos = [receiveStr objectFromJSONString];
                //                    //获取到返回的状态
                //                    NSString *JKXY_status = [infos objectForKey:@"status"];
                //                }
                //
                //                // 刷新表格
                //                [self.tableView_this reloadData];
                //                // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
                //                [refreshView endRefreshing];
            });
        });
    };
    header.endStateChangeBlock = ^(MJRefreshBaseView *refreshView) {
        //刷新完毕
    };
    header.refreshStateChangeBlock = ^(MJRefreshBaseView *refreshView, MJRefreshState state) {
        // 控件的刷新状态切换了就会调用这个block
        switch (state) {
            case MJRefreshStateNormal:
                //普通状态
                break;
                
            case MJRefreshStatePulling:
                //松开即可刷新的状态
                break;
                
            case MJRefreshStateRefreshing:
                //正在刷新状态
                break;
            default:
                break;
        }
    };
    [header beginRefreshing];
    _header = header;
}

//加载tab
#pragma mark 显示一共有多少段
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
#pragma mark 显示Tab的分段自定义View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Product_Category_TableViewTopView" owner:self options:nil];
    Product_Category_TableViewTopView *customView = [nib objectAtIndex:0];
    
    return customView;
}
#pragma mark 显示Tab的数据条数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
#pragma mark 显示Tab的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}
#pragma mark 显示Tab每个cell的Style
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Product_Category_TableViewCellIdentifier = @"Product_Category_TableViewCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"Product_Category_TableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:Product_Category_TableViewCellIdentifier];
        nibsRegistered = YES;
    }
    
    
    Product_Category_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Product_Category_TableViewCellIdentifier];
    
    
    return cell;
}
#pragma markk Tab被点击时调用的方法  didSelectRowAtIndexPath
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //当表格被点击时,跳转到聊天界面
    
    return nil;
}
@end
