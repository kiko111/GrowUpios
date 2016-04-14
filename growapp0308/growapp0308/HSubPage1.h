//
//  HSubPage1.h
//  growapp0308
//
//  Created by kiko on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//
 #import "MeBaseView.h"
#import <UIKit/UIKit.h>

@interface HSubPage1 :MeBaseView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) NSMutableArray *paras;
@property (nonatomic, assign) NSString *idstring;
@property (nonatomic, assign) NSString *titlename;
@end
