//
//  SettingTableViewCell.h
//  app
//
//  Created by 帅印 on 14-6-11.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *description;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong,nonatomic) IBOutlet UIImageView *image;
@property (strong,nonatomic) IBOutlet UIImageView *image_go;

@end
