//
//  SelectView.m
//  growapp0308
//
//  Created by kiko on 16/3/31.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define LINECOLOR ([UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1])
#import "SelectView.h"

@interface SelectView() {
    UITableView *_tableView;
    NSArray *array;
}

@end

@implementation SelectView

- (id) initWithArray:(NSArray*)stringArray frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        array = [NSArray arrayWithArray:stringArray];
        [self initTableView:CGRectMake(42, 28, 70, frame.size.height)];
    }
    return self;
}

- (void) initButton:(CGRect)frame {
}

- (void) initTableView:(CGRect)frame {
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.rowHeight = 30;
    _tableView.layer.borderColor=LINECOLOR.CGColor;
    _tableView.layer.borderWidth=1;
    
    [self addSubview:_tableView];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = array[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
  
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self removeFromSuperview];
    self.selected(array[indexPath.row]);
}


- (void) buttonDidClicked {
    [self initTableView:self.frame];
}


@end

