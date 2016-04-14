//
//  ChildrenArticalsButton.m
//  growapp0308
//
//  Created by kiko on 16/3/23.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "ChildrenArticalsButton.h"

@implementation ChildrenArticalsButton

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
        _textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0,18 ,([UIScreen mainScreen].bounds.size.width)/3, 10)];
        
        _textlabel.font=[UIFont systemFontOfSize:13];
        _textlabel.textColor=[UIColor blackColor];
        _textlabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_textlabel];
        
    }
    return self;
}

@end
