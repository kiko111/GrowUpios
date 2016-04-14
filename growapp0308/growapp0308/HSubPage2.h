//
//  HSubPage2.h
//  growapp0308
//  首页section2
//  Created by kiko on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//
 #import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface HSubPage2 :MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) NSString *idstring;
@property (nonatomic, assign) NSString *titlename;
@end
