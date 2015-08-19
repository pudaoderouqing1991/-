//
//  FriendGroup.h
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

@property(nonatomic,copy)NSString * name;

@property(nonatomic,assign)int online;

@property(nonatomic,strong)NSArray * friends;

@property(nonatomic,assign,getter=isOpened)BOOL opened;

- (instancetype)initWithDict:(NSDictionary*)dict;

+ (instancetype)groupWithDict:(NSDictionary*)dict;

@end
