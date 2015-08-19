//
//  FriendViewController.m
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FriendViewController.h"

#import "HeaderCell.h"

#import "FriendGroup.h"

#import "Friend.h"

@interface FriendViewController ()

@property(nonatomic,strong)NSArray * groups;

@end

@implementation FriendViewController

- (BOOL)prefersStatusBarHidden
{

    return YES;
    
}

- (NSArray *)groups
{

    if (_groups == nil) {
        
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray * tempArray = [NSMutableArray array];
        
        for (NSDictionary * dict in array) {
            
            FriendGroup * group = [FriendGroup groupWithDict:dict];
            
            [tempArray addObject:group];
            
        }
        
        _groups = tempArray;
        
    }
    
    return _groups;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.tableView.sectionHeaderHeight = 44;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.groups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    FriendGroup * friendgroup = self.groups[section];
    
    return (friendgroup.isOpened ? friendgroup.friends.count : 0);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HeaderCell * cell = [HeaderCell cellWithTableView:tableView];
    
    FriendGroup * group = self.groups[indexPath.section];
    
    Friend * friend = group.friends[indexPath.row];
    
    cell.friendData = friend;
    
    return cell;
  
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    //创建头部空间
    HeaderView * header = [HeaderView headerViewWithTableView:tableView];
    
    //给header设置数据源(给header传递数据模型)
    FriendGroup * group = self.groups[section];
    
    header.delegate = self;
    header.group = group;
    
    return header;

}

- (void)headerViewDidClickedNameView:(HeaderView *)headerView
{

    [self.tableView reloadData];
    
}

@end
