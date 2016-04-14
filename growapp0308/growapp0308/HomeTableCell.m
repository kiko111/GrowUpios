//
//  HomeTableCell.m
//  growapp0308
//
//  Created by kiko on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "HomeTableCell.h"

@implementation HomeTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
       
        //NSLog(@"4444");
        _labelst=[[UILabel alloc] initWithFrame:CGRectMake(140, 10, ([UIScreen mainScreen].bounds.size.width)-130, 20)];
        _labelst.font=[UIFont systemFontOfSize:14];
        _labelst.textColor=[UIColor blackColor];
        [self addSubview:_labelst];
        
        _labelcond=[[UILabel  alloc] initWithFrame:CGRectMake(120, 10, ([UIScreen mainScreen].bounds.size.width)-130, 20)];
        _labelcond.textColor=TEXTCOLOR;
        _labelcond.font=[UIFont systemFontOfSize:11];
        _labelcond.numberOfLines=0;
        [self addSubview:_labelcond];
       
        _img=[[UIImageView alloc ] initWithFrame:CGRectMake(10, 10,120 , 64)];
        [self addSubview:_img];
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 30.5,([UIScreen mainScreen].bounds.size.width)-20, 1)];
        line.backgroundColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [self addSubview:line];
        
        
    }
    return self;
}

@end
