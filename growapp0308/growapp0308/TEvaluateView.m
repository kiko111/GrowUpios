//
//  TEvaluateView.m
//  growapp0308
//
//  Created by zhengch on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "TEvaluateView.h"
#import "HMSegmentedControl.h"

@implementation TEvaluateView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 88)];
        number.text = @"5.0";
        number.textAlignment = NSTextAlignmentCenter;
        number.font = [UIFont systemFontOfSize:29];
        number.textColor = [UIColor colorWithRed:1 green:153.0f/255.0f blue:0 alpha:1];
        
        for (int i=0; i<5; i++) {
            UIImageView *starView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width/2-29)+12*i, 68, 10, 10)];
            starView.image = [UIImage imageNamed:@"th-star"];
            
            [number addSubview:starView];
        }
        
        [self addSubview:number];
        
        UIView *segmentBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, frame.size.width, 35)];
        segmentBgView.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        
        HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"全部(3)", @"好评(2)", @"中评(1)",@"差评(0)"]];
        segmentedControl.frame = CGRectMake(0, 0.5, frame.size.width, 34);
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
       // [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        
        segmentedControl.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]};
        
        segmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1]};
        [segmentBgView addSubview:segmentedControl];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 32.5, frame.size.width, 2)];
        line.backgroundColor = [UIColor whiteColor];
        [segmentBgView addSubview:line];
        
        [self addSubview:segmentBgView];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 123 , frame.size.width, frame.size.height-123)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.bounces = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:tableView];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
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
    
    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(14, 23, 32, 32)];
    photo.image = [UIImage imageNamed:@"th-Evaluationhead"];
    [cell.contentView addSubview:photo];
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(0, 62, 60, 9)];
    phone.font = [UIFont systemFontOfSize:8];
    phone.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    phone.text = @"138****1234";
    phone.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:phone];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(66, 9, tableView.frame.size.width-116, 13)];
    title.font = [UIFont systemFontOfSize:12];
    title.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    title.text = @"让内向孩子变勇敢的秘诀";
    [cell.contentView addSubview:title];
    
    UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(tableView.frame.size.width-40, 9, 30, 13)];
    type.font = [UIFont systemFontOfSize:12];
    type.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    type.text = @"线上";
    type.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:type];
    
    UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(66, 32, tableView.frame.size.width-76, 40)];
    detail.font = [UIFont systemFontOfSize:11];
    detail.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    detail.text = @"教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育政策千变万化，教育原则亘古不变教育";
    detail.numberOfLines = 0;
    [cell.contentView addSubview:detail];
    
    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(0, 82, tableView.frame.size.width-10, 11)];
    time.font = [UIFont systemFontOfSize:10];
    time.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    time.text = @"2015-12-12 12:12";
    time.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:time];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 100, tableView.frame.size.width, 10)];
    line.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
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
