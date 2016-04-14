//
//  WhiteRoundField.m
//  OrgOnline
//
//  Created by kiko on 16/3/4.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "WhiteRoundField.h"

@implementation WhiteRoundField

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
        self.font=[UIFont systemFontOfSize:11];
        self.backgroundColor=[UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.borderColor=[UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1].CGColor;
        self.layer.borderWidth=1;
        self.secureTextEntry = YES;
        UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 15)];
        self.leftView = spaceView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
    // 设置富文本属性
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.font;
    dictM[NSForegroundColorAttributeName] = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    CGPoint point = CGPointMake(0, (rect.size.height - self.font.lineHeight) * 0.5);
    
    [self.placeholder drawAtPoint:point withAttributes:dictM];
}
@end
