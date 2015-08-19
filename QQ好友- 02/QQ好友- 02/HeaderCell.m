//
//  HeaderCell.m
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeaderCell.h"

#import "Friend.h"

@implementation HeaderCell

- (void)setFriendData:(Friend *)friendData
{

    _friendData = friendData;
    
    self.textLabel.text = friendData.name;
    
    self.textLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
    
    self.detailTextLabel.text = friendData.intro;
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    
}


+ (instancetype)cellWithTableView:(UITableView*)tableView
{

    static NSString * ID = @"friend";
    
    HeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[HeaderCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }

    return cell;
    
}

@end
