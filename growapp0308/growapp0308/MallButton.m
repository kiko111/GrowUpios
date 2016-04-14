//
//  MallButton.m
//  growapp0308
//
//  Created by kiko on 16/3/23.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MallButton.h"

@implementation MallButton

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
        _textlabel=[[UILabel alloc] initWithFrame:CGRectMake(0,15 ,(swidth-45)/5, 10)];
        
        _textlabel.font=[UIFont systemFontOfSize:12];
        _textlabel.textAlignment=NSTextAlignmentCenter;
        self.backgroundColor=[UIColor whiteColor];
        
        [self addSubview:_textlabel];
        
    }
    return self;
}
@end
