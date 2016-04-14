//
//  TArticleView.m
//  growapp0308
//
//  Created by zhengch on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "TArticleView.h"

@implementation TArticleView
{
    
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10 , frame.size.width, frame.size.height-10)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:tableView];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [tableView addSubview:line];
        
        
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 143;
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
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, tableView.frame.size.width-10, 14)];
    title.font = [UIFont systemFontOfSize:14];
    title.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    //title.text = @"教育政策千变万化，教育原则亘古不变";
    title.text = [[_data objectAtIndex:indexPath.row] objectForKey:@"title"];
    [cell.contentView addSubview:title];
    
    UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(10, 47, tableView.frame.size.width-20, 60)];
    detail.font = [UIFont systemFontOfSize:11];
    detail.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    //detail.text = @"教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变";
    detail.numberOfLines = 0;
    detail.text = [[_data objectAtIndex:indexPath.row] objectForKey:@"content"];
    [cell.contentView addSubview:detail];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, tableView.frame.size.width-10, 11)];
    time.font = [UIFont systemFontOfSize:10];
    time.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    //time.text = @"2015-12-12 12:12";
    time.text = [[_data objectAtIndex:indexPath.row] objectForKey:@"time"];
    time.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:time];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 142.5, tableView.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
    [cell.contentView addSubview:line];
    
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
