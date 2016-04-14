//
//  HomeView2.m
//  growapp0308
//
//  Created by kiko on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "HomeView2.h"

@implementation HomeView2

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
        _img=[[UIImageView alloc ] initWithFrame:CGRectMake(10, 10,120 , 70)];
        [self addSubview:_img];
        
        
       // NSLog(@"4444");
        _labelst=[[UILabel alloc] initWithFrame:CGRectMake(140, 15, ([UIScreen mainScreen].bounds.size.width)-130, 20)];
        _labelst.font=[UIFont systemFontOfSize:14];
        _labelst.textColor=[UIColor blackColor];
        [self addSubview:_labelst];
        
        _labelcond=[[UILabel  alloc] initWithFrame:CGRectMake(140, 40, ([UIScreen mainScreen].bounds.size.width)-130, 40)];
        _labelcond.textColor=TEXTCOLOR;
        _labelcond.font=[UIFont systemFontOfSize:11];
        _labelcond.numberOfLines=0;
        [self addSubview:_labelcond];
        
        
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 88.5,[UIScreen mainScreen].bounds.size.width, 1)];
        line.backgroundColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [self addSubview:line];
        
        
        
    }
    return self;
}



@end
