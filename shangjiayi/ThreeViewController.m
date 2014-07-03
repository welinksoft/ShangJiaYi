//
//  ThreeViewController.m
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "ThreeViewController.h"
#import "AddressListCellSubTableViewCell.h"

//定义刷新tableCell
NSString *const WeAddressListCellSubTableCellIdentifier = @"AddressListCellSubTableViewCell";

//下拉刷新采用,通过block回调监听
@interface ThreeViewController (){
    MJRefreshHeaderView *_header;//下拉刷新
}

@end

@implementation ThreeViewController

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

-(void)viewWillAppear:(BOOL)animated{
    //设置导航栏的文字
    self.tabBarController.navigationItem.title = @"通讯录";
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
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    customView.backgroundColor = [UIColor colorWithRed:239.0/255 green:239.0/255 blue:239.0/255 alpha:255];
    //加入标题
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 250, 30)];
    leftLabel.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:255];
    leftLabel.font = [UIFont boldSystemFontOfSize:14];
    [customView addSubview:leftLabel];
    //加入指示图标
    UIImageView *umv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 15, 15)];
    [umv setImage:[UIImage imageNamed:@"setting_backIcon"]];
    [customView addSubview:umv];
    
    leftLabel.text = @"文沥信息技术有限公司";
    
    return customView;
}
#pragma mark 显示Tab的数据条数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
#pragma mark 显示Tab的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}
#pragma mark 显示Tab每个cell的Style
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *AddressListCellSubTableCellIdentifier = @"AddressListCellSubTableViewCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"AddressListCellSubTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:AddressListCellSubTableCellIdentifier];
        nibsRegistered = YES;
    }
    
    
    AddressListCellSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddressListCellSubTableCellIdentifier];
    
    
    return cell;
}
#pragma markk Tab被点击时调用的方法  didSelectRowAtIndexPath
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //当表格被点击时,跳转到聊天界面
    
    return nil;
}
@end
