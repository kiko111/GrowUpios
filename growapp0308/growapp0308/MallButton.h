//
//  MallButton.h
//  growapp0308
//
//  Created by kiko on 16/3/23.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define swidth ([UIScreen mainScreen].bounds.size.width)
#define sheight ([UIScreen mainScreen].bounds.size.height)
#import <UIKit/UIKit.h>

@interface MallButton : UIButton
@property (nonatomic,strong)UILabel *textlabel;
@property (nonatomic, assign) NSString *idstring;
@end
