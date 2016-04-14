//
//  SubPageView1.m
//  growapp0308
//
//  Created by kiko on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "SubPageView1.h"

@implementation SubPageView1

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
        _titlelabel=[[UILabel alloc] initWithFrame:CGRectMake(10,10 ,200, 20)];
        _titlelabel.font=[UIFont systemFontOfSize:13];
        _titlelabel.textColor=[UIColor blackColor];
        [self addSubview:_titlelabel];
        
        _contentlabel=[[UILabel alloc] initWithFrame:CGRectMake(10,35 ,([UIScreen mainScreen].bounds.size.width)-20, 35)];
        _contentlabel.font=[UIFont systemFontOfSize:11];
        _contentlabel.textColor=TEXTCOLOR;
        _contentlabel.numberOfLines = 0;
        [self addSubview:_contentlabel];
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(10, 74.5,([UIScreen mainScreen].bounds.size.width)-10, 0.5)];
        line.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
        [self addSubview:line];
        
    }
    return self;
}

@end
