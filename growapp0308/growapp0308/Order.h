//
//  Order.h
//  OrgOnline
//
//  Created by kiko on 16/3/7.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface Order : MeBaseView<UITableViewDataSource,UITableViewDelegate>
//@property(nonatomic,readonly)int *selectedIndex;
@property (nonatomic, assign) NSInteger selectedIndex;

@end
