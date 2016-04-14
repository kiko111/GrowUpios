//
//  THomePageView.m
//  growapp0308
//
//  Created by zhengch on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "THomePageView.h"

@implementation THomePageView
{
    NSArray *dataTitleArr;
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {  
        
        CGFloat y = 105;
        
        UIView *org = [[UIView alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 95)];
        org.backgroundColor = [UIColor whiteColor];
        
        UIImageView *orgImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 71, 71)];
        orgImage.image = [UIImage imageNamed:@"th-logo"];
        [org addSubview:orgImage];
        
        UILabel *orgLabel = [[UILabel alloc] initWithFrame:CGRectMake(97, 22, 200, 14)];
        orgLabel.font = [UIFont systemFontOfSize:13];
        orgLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        orgLabel.text = @"未来之星教育";
        [org addSubview:orgLabel];
        
        UILabel *orgLabelType = [[UILabel alloc] initWithFrame:CGRectMake(97, 61, 32, 14)];
        orgLabelType.font = [UIFont systemFontOfSize:13];
        orgLabelType.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        orgLabelType.text = @"资质:";
        [org addSubview:orgLabelType];
        
        UILabel *orgLabelTypeValue = [[UILabel alloc] initWithFrame:CGRectMake(141, 52, 61, 25)];
        orgLabelTypeValue.font = [UIFont systemFontOfSize:13];
        orgLabelTypeValue.textColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
        orgLabelTypeValue.text = @"公司";
        orgLabelTypeValue.textAlignment = NSTextAlignmentCenter;
        orgLabelTypeValue.layer.borderColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1].CGColor;
        orgLabelTypeValue.layer.borderWidth = 0.5;
        orgLabelTypeValue.layer.cornerRadius = 3;
        [org addSubview:orgLabelTypeValue];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [org addSubview:line];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, 94.5, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [org addSubview:line];
        
        [self addSubview:org];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, y , frame.size.width, frame.size.height-y-10)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.userInteractionEnabled = NO;
        
        [self addSubview:tableView];
        
        dataTitleArr = @[@"认证",@"教育经历",@"课程",@"相册",@"视频",@"评价"];
        
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 35;
    }
    else{
        if (indexPath.section == 0) {
            return 91;
        }else if (indexPath.section == 1){
            return 91;
        }
        else if (indexPath.section == 2){
            return 149;
        }
        else if (indexPath.section == 3){
            return 117;
        }
        else if (indexPath.section == 4){
            return 117;
        }
        else {
            return 112;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10)];
    view.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    return view;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    if (indexPath.row == 0) {
        UILabel *cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 100, 33)];
        cellTitle.text = [dataTitleArr objectAtIndex:indexPath.section];
        cellTitle.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        cellTitle.font = [UIFont systemFontOfSize:14];
        
        [cell.contentView addSubview:cellTitle];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(10, 34.5, tableView.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        
        
        cell.accessoryView = imgView;
    }
    else{
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, [tableView rectForRowAtIndexPath:indexPath].size.height-0.5, tableView.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
