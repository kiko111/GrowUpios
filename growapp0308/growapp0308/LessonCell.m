//
//  LessonCell.m
//  growapp0308
//
//  Created by kiko on 16/3/29.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "LessonCell.h"

@implementation LessonCell

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
        
        _cellview=[[UIView alloc] initWithFrame:CGRectMake(10, 10.5,([UIScreen mainScreen].bounds.size.width)-20,109)];
        _cellview.layer.cornerRadius=6;
        _cellview.layer.masksToBounds=YES;
        _cellview.layer.borderWidth=1;
        _cellview.layer.borderColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
        _cellview.backgroundColor=[UIColor whiteColor];
        [self addSubview:_cellview];
        
        
        
        _labelst=[[UILabel alloc ] initWithFrame:CGRectMake(20, 20,250 , 16)];
        _labelst.font=[UIFont systemFontOfSize:12];
        _labelst.textColor=[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        [self addSubview:_labelst];
        
        _labelcond=[[UILabel alloc ] initWithFrame:CGRectMake(20, 46,250 , 16)];
        _labelcond.font=[UIFont systemFontOfSize:12];
        _labelcond.textColor=[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        [self addSubview:_labelcond];
        
        _labelird=[[UILabel alloc ] initWithFrame:CGRectMake(20, 72,250 , 16)];
        _labelird.font=[UIFont systemFontOfSize:12];
        _labelcond.textColor=[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        [self addSubview:_labelird];
        
        _labelrth=[[UILabel alloc ] initWithFrame:CGRectMake(20, 98,250 , 16)];
        _labelrth.font=[UIFont systemFontOfSize:12];
        _labelrth.textColor=[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        [self addSubview:_labelrth];
        
        _labelfth=[[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)-90, 20,100 , 16)];
        _labelfth.font=[UIFont systemFontOfSize:13];
        _labelfth.textColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:255.0f/255.0f alpha:1];
        [self addSubview:_labelfth];
        
        
        
        
    }
    return self;
}
@end
