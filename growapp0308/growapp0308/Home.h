//
//  Home.h
//  growapp0308
//  首页
//  Created by kiko on 16/3/8.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MeBaseView.h"
#import <UIKit/UIKit.h>
#import "SelectView.h"

@interface Home : MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, readwrite,retain) UISearchBar *searchBar;
@end
