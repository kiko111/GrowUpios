//
//  MallHomeView2.h
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define swidth ([UIScreen mainScreen].bounds.size.width)
#define sheight ([UIScreen mainScreen].bounds.size.height)
#import <UIKit/UIKit.h>

@interface MallHomeView2 : UIView
@property (nonatomic,strong)UIImageView *img;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic, assign) NSString *idstring;
@end
