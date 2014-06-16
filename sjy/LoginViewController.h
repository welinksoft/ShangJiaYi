//
//  LoginViewController.h
//  sjy
//
//  Created by mbp-welink on 13-11-18.
//  Copyright (c) 2013年 welinksoft_Shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

//定义用户名密码控件
@property(retain,nonatomic) IBOutlet UITextField *usernameTextField;
@property(retain,nonatomic) IBOutlet UITextField *passwordTextField;
//登录状态
@property(retain,nonatomic) IBOutlet UILabel *tageLabel;


//接收数据
@property(retain,nonatomic) NSMutableData *receiveData;

//登录时请求的事件
-(IBAction)loginLoadBtnOnclick:(id)sender;

@end
