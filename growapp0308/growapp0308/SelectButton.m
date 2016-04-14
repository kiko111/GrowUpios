//
//  SelectButton.m
//  OrgOnline
//
//  Created by kiko on 16/3/7.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "SelectButton.h"

@implementation SelectButton

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
        _textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0,18 ,([UIScreen mainScreen].bounds.size.width)/2, 10)];
        
        _textlabel.font=[UIFont systemFontOfSize:13];
        _textlabel.textColor=[UIColor blackColor];
        _textlabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_textlabel];
        
        _line=[[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/7.6,38.5 ,([UIScreen mainScreen].bounds.size.width)/4.5, 2)];
        [self addSubview:_line];
        
    }
    return self;
}
@end
