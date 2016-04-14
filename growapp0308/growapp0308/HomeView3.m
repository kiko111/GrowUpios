//
//  HomeView3.m
//  growapp0308
//
//  Created by kiko on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "HomeView3.h"

@implementation HomeView3

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame])
    {
        _img=[[UIImageView alloc] initWithFrame:CGRectMake(0,0 ,([UIScreen mainScreen].bounds.size.width)/3-10, 70)];
        [self addSubview:_img];
        
        UIView *belowview=[[UIView alloc] initWithFrame:CGRectMake(0,50 ,([UIScreen mainScreen].bounds.size.width)/3-10, 20)];
        belowview.backgroundColor=[UIColor blackColor];
        belowview.alpha = 0.8;
        
        
        _textlabel=[[UILabel alloc] initWithFrame:CGRectMake(10,3 ,([UIScreen mainScreen].bounds.size.width)/3-20, 20)];
        _textlabel.font=[UIFont systemFontOfSize:10];
        _textlabel.textColor=[UIColor whiteColor];
        //_textlabel.numberOfLines = 0;
        [belowview addSubview:_textlabel];
        [_img addSubview:belowview];
        
    }
    return self;
}




@end
