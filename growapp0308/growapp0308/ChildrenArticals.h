//
//  ChildrenArticals.h
//  growapp0308
// 儿童用品
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface ChildrenArticals : MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) NSInteger selectedIndex;
@end
