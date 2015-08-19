//
//  Friend.h
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property(nonatomic,strong)NSString * icon;

@property(nonatomic,strong)NSString * name;

@property(nonatomic,strong)NSString * intro;

@property(nonatomic,assign,getter=isVip)BOOL vip;

- (instancetype)initWithDict:(NSDictionary*)dict;

+ (instancetype)friendWithDict:(NSDictionary*)dict;

@end
