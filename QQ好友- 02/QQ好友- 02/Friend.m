//
//  Friend.m
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithDict:(NSDictionary*)dict
{

    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return self;
    
}

+ (instancetype)friendWithDict:(NSDictionary*)dict
{

    return [[self alloc]initWithDict:dict];
    
}


@end
