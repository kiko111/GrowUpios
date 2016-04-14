//
//  NewsCategoryViewController.h
//  growapp0308
//
//  Created by zhengch on 16/3/31.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UITableView *leftTV;
@property (nonatomic,strong) UICollectionView *rightCV;

@property NSInteger selectedLeftIndex;

@end
