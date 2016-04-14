//
//  MallHomeView2.m
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MallHomeView2.h"

@implementation MallHomeView2

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
        self.backgroundColor=[UIColor whiteColor];
        _img=[[UIImageView alloc] initWithFrame:CGRectMake((swidth/2-swidth/2.5)/2,10 ,swidth/2.5,80)];
        [self addSubview:_img];
        
        self.layer.borderColor=[UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1].CGColor;
        self.layer.borderWidth=0.5;
        
        _name=[[UILabel alloc] initWithFrame:CGRectMake(0,70 ,swidth/2, 20)];
        _name.font=[UIFont systemFontOfSize:15];
        _name.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        _name.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_name];
        
        
        
    }
    return self;
}
@end
