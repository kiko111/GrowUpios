//
//  MallHomeView3.m
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MallHomeView3.h"

@implementation MallHomeView3

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
        
        _img=[[UIImageView alloc] initWithFrame:CGRectMake((swidth/2-swidth/2.2)/2,0 ,swidth/2.2,120)];
        [self addSubview:_img];
        
        self.layer.borderColor=[UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1].CGColor;
        self.layer.borderWidth=0.5;
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0,132 ,swidth/2-5, 0.5)];
        line.backgroundColor=[UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1];
        [self addSubview:line];
        
        
        
        _label1=[[UILabel alloc] initWithFrame:CGRectMake(5,134 ,swidth/2-20, 50)];
        _label1.font=[UIFont systemFontOfSize:12];
        _label1.textColor=[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        _label1.numberOfLines=0;
        [self addSubview:_label1];
        
        _label2=[[UILabel alloc] initWithFrame:CGRectMake(8,180 ,swidth/2, 20)];
        _label2.font=[UIFont systemFontOfSize:12];
        _label2.textColor=[UIColor colorWithRed:1.0f/255.0f green:126.0f/255.0f blue:242.0f/255.0f alpha:1];
        [self addSubview:_label2];
        
    }
    return self;
}

@end
