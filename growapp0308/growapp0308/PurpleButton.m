//
//  PurpleButton.m
//  OrgOnline
//
//  Created by kiko on 16/3/3.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "PurpleButton.h"

@implementation PurpleButton

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
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
        [self.layer setBorderWidth:1.0]; //边框宽度
        self.layer.borderColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:239.0f/255.0f alpha:1].CGColor;
        self.backgroundColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:239.0f/255.0f alpha:1];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        
    }
    return self;
}

@end
