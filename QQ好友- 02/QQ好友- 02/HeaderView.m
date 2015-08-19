//
//  HeaderView.m
//  QQ好友- 02
//
//  Created by lanou3g on 15/7/17.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeaderView.h"

#import "FriendGroup.h"

@interface HeaderView ()

@property(nonatomic,weak)UILabel * countView;

@property(nonatomic,weak)UIButton * nameView;

@end

@implementation HeaderView

+ (instancetype)headerViewWithTableView:(UITableView*)tableview
{

    static NSString * ID = @"header";
    
    HeaderView * header = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (header == nil) {
        
        header = [[HeaderView alloc]initWithReuseIdentifier:ID];
    }

    return header;
    
}

/**
 *  按钮的监听方法
 */
- (void)nameViewClick
{
    
    self.group.opened = !self.group.opened;
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        
        [self.delegate headerViewDidClickedNameView:self];
        
    }
    
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //添加子控件
        //1.添加最大的那个按钮
        UIButton * nameView = [UIButton buttonWithType:UIButtonTypeCustom];

        
        
        [nameView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        //1.1给按钮添加背景图片(正常状态下的背景图片)
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        
        //1.2给按钮添加高亮状态下的背景图片
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
   
        
        //1.3给按钮内部添加图片(左边箭头图片)
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        //1.4设置按钮内部的对齐方式(设置成左对齐)
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //1.5因为文字默认是蓝色所以要把按钮上的文字设置成黑色
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //1.6设置按钮内文字的内边距
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //1.7设置按钮内部箭头图片的边距
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //1.8设置按钮内部的imageview的内容模式为居中
        nameView.imageView.contentMode = UIViewContentModeCenter;
        
        //1.9设置是否打开剪裁图片的超出部分
        nameView.imageView.clipsToBounds = NO;
        
        self.nameView = nameView;
        [self.contentView addSubview:_nameView];
        
        
        
        
        //2.添加好友数
        UILabel * countView = [[UILabel alloc]init];
        //2.1设置Lable中的文字的对齐方式
        countView.textAlignment = NSTextAlignmentRight;
        //2.2设置Lable中的文字的颜色(设置成黑色)
        countView.textColor = [UIColor blackColor];
        self.countView = countView;
        [self.contentView addSubview:_countView];
        
 
 
    }
    
    return self;
    
}

- (void)setGroup:(FriendGroup *)group
{

    _group = group;
    
    //1.设置按钮的文字(组名)
    [self.nameView setTitle:self.group.name forState:UIControlStateNormal];
    //2.设置好在线人数
    self.countView.text = [NSString stringWithFormat:@"%d/%lu",self.group.online,(unsigned long)self.group.friends.count];
    
}
/**
 *  当按钮上的子控件尺寸发生改变时就会调用此方法
 */
- (void)layoutSubviews
{
    
    [super layoutSubviews];

    //设置按钮的frame
    self.nameView.frame = self.bounds;
    //设置好友数的frame
    CGFloat countY = 0;
    CGFloat countW = 150;
    CGFloat countH = self.frame.size.height;
    CGFloat countX = self.frame.size.width - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
    
    
}

- (void)didMoveToSuperview
{

    if (self.group.opened) {
        
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    } else {
        
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
        
    }
    
}

@end
