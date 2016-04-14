//
//  SHome.m
//  growapp0308
//
//  Created by zhengch on 16/3/16.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "SHome.h"

@implementation SHome
{
    NSArray *titleArr;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , frame.size.width, frame.size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView.userInteractionEnabled = NO;
        
        [self addSubview:tableView];
        
        titleArr = @[@"感兴趣课程",@"教育信息",@"工作信息",@"学习轨迹"];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 41;
    }
    else{
        if (indexPath.row == 0) {
            return 36;
        }else{
            if (indexPath.section == 1) {
                return 65;
            }else if (indexPath.section == 2){
                return 70;
            }
            else if (indexPath.section == 3){
                return 80;
            }
            else {
                return 250;
            }
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
    
    if (indexPath.section == 0) {
        
        UILabel *area = [[UILabel alloc] initWithFrame:CGRectMake(30, 9, 200, 32)];
        area.text = @"北京市-海淀区";
        area.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
        area.font = [UIFont systemFontOfSize:12];
        
        [cell.contentView addSubview:area];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, 40.5, tableView.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
    }
    else{
        if (indexPath.row == 0) {
            UILabel *cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 100, 34)];
            cellTitle.text = [titleArr objectAtIndex:indexPath.section-1];
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
            
            if (indexPath.section == 1) {
                
            }else if (indexPath.section == 2){
                
                UILabel *university = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 300, 12)];
                university.text = @"大学: 天津对外经济贸易学院";
                university.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                university.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:university];
                
                UILabel *shenfen = [[UILabel alloc] initWithFrame:CGRectMake(20, 27, 300, 12)];
                shenfen.text = @"身份: 学生";
                shenfen.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                shenfen.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:shenfen];
                
                UILabel *school = [[UILabel alloc] initWithFrame:CGRectMake(20, 44, 300, 12)];
                school.text = @"院系: 经济管理系";
                school.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                school.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:school];
                
            }else if (indexPath.section == 3){
                UILabel *companyName = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 300, 12)];
                companyName.text = @"公司名称: 北京新东方";
                companyName.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                companyName.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:companyName];
                
                UILabel *hangye = [[UILabel alloc] initWithFrame:CGRectMake(20, 27, 300, 12)];
                hangye.text = @"行业: 教育";
                hangye.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                hangye.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:hangye];
                
                UILabel *zhiwu = [[UILabel alloc] initWithFrame:CGRectMake(20, 44, 300, 12)];
                zhiwu.text = @"职务: 运营主管";
                zhiwu.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                zhiwu.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:zhiwu];
                
                UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(20, 61, 300, 12)];
                time.text = @"工作时间: 2015-12 至 2015-12";
                time.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
                time.font = [UIFont systemFontOfSize:11];
                
                [cell.contentView addSubview:time];
            }else{
                
            }
        }
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
