//
//  HeaderCell.h
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Friend;

@interface HeaderCell : UITableViewCell

@property(nonatomic,strong)Friend * friendData;

+ (instancetype)cellWithTableView:(UITableView*)tableView;

@end
