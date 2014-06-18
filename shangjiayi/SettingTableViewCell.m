//
//  SettingTableViewCell.m
//  app
//
//  Created by 帅印 on 14-6-11.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

@synthesize title;
@synthesize description;
@synthesize titleLabel;
@synthesize descriptionLabel;
@synthesize image;
@synthesize image_go;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//重新SET函数
-(void)setTitle:(NSString *)t {
    if (![t isEqualToString:title]) {
        title = [t copy];
        self.titleLabel.text = title;
    }
}

-(void)setDescription:(NSString *)t {
    if (![t isEqualToString:description]) {
        description = [t copy];
        self.descriptionLabel.text = description;
    }
}

@end
