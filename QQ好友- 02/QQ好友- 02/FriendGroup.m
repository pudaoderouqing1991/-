//
//  FriendGroup.m
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "FriendGroup.h"

#import "Friend.h"

@implementation FriendGroup

- (instancetype)initWithDict:(NSDictionary*)dict
{

    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray * tempArray = [NSMutableArray array];
        
        for (NSDictionary * dict in self.friends) {
            
            Friend * friend = [Friend friendWithDict:dict];
            
            [tempArray addObject:friend];
            
        }
        
        self.friends = tempArray;
        
    }
    
    return self;
    
}

+ (instancetype)groupWithDict:(NSDictionary*)dict
{

    return [[self alloc]initWithDict:dict];
    
}

@end
