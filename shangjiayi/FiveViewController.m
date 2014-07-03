//
//  FiveViewController.m
//  shangjiayi
//
//  Created by 帅印 on 14-5-22.
//  Copyright (c) 2014年 welinksoft_Shuaiyin. All rights reserved.
//

#import "FiveViewController.h"
#import "SettingTableViewCell.h"

@interface FiveViewController ()

@end

@implementation FiveViewController
//当前表格
@synthesize tableView_this;
@synthesize allListData;

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
    self.tabBarController.navigationItem.title = @"设置";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化数据
    //初始化数据源
    self.allListData = [[NSMutableArray alloc]init];
    //初始化数据
    for (int i = 0; i < 4; i++) {
        //tag  1为没有  2为文字 3为图片
        if (i == 0) {
            NSMutableArray *infos1 = [[NSMutableArray alloc] init];
            NSMutableDictionary *info1 = [[NSMutableDictionary alloc] init];
            [info1 setObject:@"setting_yqhzhb" forKey:@"image"];
            [info1 setObject:@"邀请合作伙伴" forKey:@"title"];
            [info1 setObject:@"3" forKey:@"tag"];
            [infos1 addObject:info1];
            [self.allListData addObject:infos1];
        }else if(i == 1){
            NSMutableArray *infos2 = [[NSMutableArray alloc] init];
            
            NSMutableDictionary *info1 = [[NSMutableDictionary alloc] init];
            [info1 setObject:@"setting_yhgrsz" forKey:@"image"];
            [info1 setObject:@"个人设置" forKey:@"title"];
            [info1 setObject:@"3" forKey:@"tag"];
            [infos2 addObject:info1];
            
            NSMutableDictionary *info2 = [[NSMutableDictionary alloc] init];
            [info2 setObject:@"setting_yhqysz" forKey:@"image"];
            [info2 setObject:@"企业设置" forKey:@"title"];
            [info2 setObject:@"3" forKey:@"tag"];
            [infos2 addObject:info2];
            
            [self.allListData addObject:infos2];
        }else if(i == 2){
            NSMutableArray *infos2 = [[NSMutableArray alloc] init];
            
            NSMutableDictionary *info1 = [[NSMutableDictionary alloc] init];
            [info1 setObject:@"setting_clean" forKey:@"image"];
            [info1 setObject:@"清除缓存" forKey:@"title"];
            [info1 setObject:@"2" forKey:@"tag"];
            [infos2 addObject:info1];
            
            NSMutableDictionary *info2 = [[NSMutableDictionary alloc] init];
            [info2 setObject:@"setting_share" forKey:@"image"];
            [info2 setObject:@"推荐好友" forKey:@"title"];
            [info2 setObject:@"1" forKey:@"tag"];
            [infos2 addObject:info2];
            
            NSMutableDictionary *info3 = [[NSMutableDictionary alloc] init];
            [info3 setObject:@"setting_rate" forKey:@"image"];
            [info3 setObject:@"好评支持" forKey:@"title"];
            [info3 setObject:@"1" forKey:@"tag"];
            [infos2 addObject:info3];
            
            [self.allListData addObject:infos2];
        }else if(i == 3){
            NSMutableArray *infos3 = [[NSMutableArray alloc] init];
            
            NSMutableDictionary *info1 = [[NSMutableDictionary alloc] init];
            [info1 setObject:@"setting_about" forKey:@"image"];
            [info1 setObject:@"关于我们" forKey:@"title"];
            [info1 setObject:@"3" forKey:@"tag"];
            [infos3 addObject:info1];
            
            NSMutableDictionary *info2 = [[NSMutableDictionary alloc] init];
            [info2 setObject:@"setting_faq" forKey:@"image"];
            [info2 setObject:@"常见问题" forKey:@"title"];
            [info2 setObject:@"3" forKey:@"tag"];
            [infos3 addObject:info2];
            
            NSMutableDictionary *info3 = [[NSMutableDictionary alloc] init];
            [info3 setObject:@"setting_weibo" forKey:@"image"];
            [info3 setObject:@"文沥科技(Welinksoft)" forKey:@"title"];
            [info3 setObject:@"3" forKey:@"tag"];
            [infos3 addObject:info3];
            
            NSMutableDictionary *info4 = [[NSMutableDictionary alloc] init];
            [info4 setObject:@"setting_feedback" forKey:@"image"];
            [info4 setObject:@"意见反馈" forKey:@"title"];
            [info4 setObject:@"3" forKey:@"tag"];
            [infos3 addObject:info4];
            
            NSMutableDictionary *info5 = [[NSMutableDictionary alloc] init];
            [info5 setObject:@"setting_version" forKey:@"image"];
            [info5 setObject:@"检查更新" forKey:@"title"];
            [info5 setObject:@"2" forKey:@"tag"];
            [infos3 addObject:info5];
            
            [self.allListData addObject:infos3];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//加载tab
#pragma mark 显示每个段里面有多少行
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [allListData count];
}
#pragma mark 显示Tab的数据条数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[allListData objectAtIndex:section] count];
}
#pragma mark 显示Tab的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

#pragma mark 显示Tab每个cell的Style
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *SettingCellIdentifier = @"SettingCellIdentifier";
    UINib *nib = [UINib nibWithNibName:@"SettingTableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:SettingCellIdentifier];
    
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingCellIdentifier];
    //让部分控件隐藏
    cell.image_go.hidden = YES;
    cell.descriptionLabel.hidden = YES;
    //显示图标跟文字
    NSMutableDictionary *ms = [[self.allListData objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    cell.title = [ms objectForKey:@"title"];
    [cell.image setImage:[UIImage imageNamed:[ms objectForKey:@"image"]]];
    
    NSString *tag = [ms objectForKey:@"tag"];
    if ([@"1" isEqualToString:tag]) {
        cell.image_go.hidden = YES;
        cell.descriptionLabel.hidden = YES;
    }else if([@"2" isEqualToString:tag]){
        cell.image_go.hidden = YES;
        cell.descriptionLabel.hidden = NO;
    }else if([@"3" isEqualToString:tag]){
        cell.image_go.hidden = NO;
        cell.descriptionLabel.hidden = YES;
    }
    
//    //如果是版本信息
//    if (2 == [indexPath section]){
//        if(4 == [indexPath row]){
//            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//            // app版本
//            //NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//            // app build版本
//            NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
//            cell.descriptionLabel.text = app_build;
//        }
//    }
    
    return cell;
}
#pragma markk Tab被点击时调用的方法  didSelectRowAtIndexPath
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}



@end
