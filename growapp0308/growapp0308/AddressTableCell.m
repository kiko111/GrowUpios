//
//  AddressTableCell.m
//  growapp0308
//
//  Created by kiko on 16/3/17.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "AddressTableCell.h"

@implementation AddressTableCell

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
        
        
       // NSLog(@"4444");
        _label=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, ([UIScreen mainScreen].bounds.size.width)-90, 20)];
        _label.font=[UIFont systemFontOfSize:14];
        _label.textColor=[UIColor blackColor];
        [self addSubview:_label];
        
        if(self.tag==0){
            UIButton *extrabtn=[[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)-70, 10, 20, 10)];
            UIImageView *img=[[UIImageView alloc ] initWithFrame:CGRectMake(0, 0,20 , 10)];
            img.image=[UIImage imageNamed:@"addresslabel"];
            [_btnupdate addSubview:img];
            [self addSubview:extrabtn];
        
        }

        _btnupdate=[[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)-60, 10, 10, 20)];
        UIImageView *img1=[[UIImageView alloc ] initWithFrame:CGRectMake(0, 0,10 , 20)];
        img1.image=[UIImage imageNamed:@"meedit"];
        [_btnupdate addSubview:img1];
        [self addSubview:_btnupdate];
        
        _btndel=[[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)-40, 10, 10, 20)];
        UIImageView *img2=[[UIImageView alloc ] initWithFrame:CGRectMake(0, 0,10 , 20)];
        img2.image=[UIImage imageNamed:@"medel"];
        [_btnupdate addSubview:img2];
        [self addSubview:_btndel];
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 30.5,([UIScreen mainScreen].bounds.size.width)-20, 1)];
        line.backgroundColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [self addSubview:line];
        
        
    }
    return self;
}
@end
