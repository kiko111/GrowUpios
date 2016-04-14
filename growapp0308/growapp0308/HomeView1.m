//
//  HomeView1.m
//  growapp0308
//
//  Created by kiko on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "HomeView1.h"

@implementation HomeView1

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
        _img=[[UIImageView alloc] initWithFrame:CGRectMake(10,10 ,([UIScreen mainScreen].bounds.size.width)/2-50, 70)];
        [self addSubview:_img];
        
        _textlabel=[[UILabel alloc] initWithFrame:CGRectMake(10,85 ,([UIScreen mainScreen].bounds.size.width)/2-50, 35)];
        _textlabel.font=[UIFont systemFontOfSize:11];
        _textlabel.textColor=TEXTCOLOR;
        _textlabel.numberOfLines = 0;
        [self addSubview:_textlabel];

        
    }
    return self;
}


@end
