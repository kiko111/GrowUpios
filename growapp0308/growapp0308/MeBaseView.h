//
//  MeBaseView.h
//  OrgOnline
//
//  Created by kiko on 16/3/2.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define GRAYTEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#define BLUECOLOR ([UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1])
#define swidth ([UIScreen mainScreen].bounds.size.width)
#define sheight ([UIScreen mainScreen].bounds.size.height)
#import <UIKit/UIKit.h>

@interface MeBaseView : UIViewController
-(void)viewDidLoadBlue;
-(void)viewDidLoadWhite;
@end
