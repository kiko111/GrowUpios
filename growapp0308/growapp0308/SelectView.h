//
//  SelectView.h
//  growapp0308
//
//  Created by kiko on 16/3/31.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectView : UIView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) void (^selected)(NSString *str);

- (id) initWithArray:(NSArray*)stringArray frame:(CGRect)frame;

@end
