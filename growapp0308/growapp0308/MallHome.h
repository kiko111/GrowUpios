//
//  MallHome.h
//  growapp0308
//商城首页
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface MallHome : MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, readwrite,retain) UISearchBar *searchBar;

@end
