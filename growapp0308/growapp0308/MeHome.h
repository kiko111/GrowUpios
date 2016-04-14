//
//  MeHome.h
//  growapp0308
// 我 主页
//  Created by kiko on 16/3/14.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface MeHome : MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableview;
@end
