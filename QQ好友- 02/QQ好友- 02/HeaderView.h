//
//  HeaderView.h
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendGroup,HeaderView;

@protocol HeaderViewDetagate <NSObject>

@optional
- (void)headerViewDidClickedNameView:(HeaderView*)headerView;

@end

@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong)FriendGroup * group;

@property(nonatomic,weak)id<HeaderViewDetagate>  delegate;

+ (instancetype)headerViewWithTableView:(UITableView*)tableview;

@end
