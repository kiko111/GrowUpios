//
//  AddressField.m
//  growapp0308
//
//  Created by kiko on 16/3/17.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "AddressField.h"

@implementation AddressField

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
        self.font=[UIFont systemFontOfSize:12];
        self.backgroundColor=[UIColor whiteColor];
//        self.layer.borderColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
//        self.layer.borderWidth=0.5;
        self.secureTextEntry = YES;
        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 15)];
        self.leftView = spaceView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 39.5, ([UIScreen mainScreen].bounds.size.width), 0.5)];
        line.backgroundColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [self addSubview:line];
    }
    return self;
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
    // 设置富文本属性
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.font;
    dictM[NSForegroundColorAttributeName] = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    CGPoint point = CGPointMake(0, (rect.size.height - self.font.lineHeight) * 0.45);
    
    [self.placeholder drawAtPoint:point withAttributes:dictM];
}
@end
