//
//  MallHomeView1.m
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MallHomeView1.h"

@implementation MallHomeView1

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
        _img=[[UIImageView alloc] initWithFrame:CGRectMake(0.5,0.5 ,frame.size.width-1, frame.size.height-1)];
        [self addSubview:_img];
        
        self.layer.borderColor=[UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1].CGColor;
        self.layer.borderWidth=0.5;
        
        
        
    }
    return self;
}
@end
