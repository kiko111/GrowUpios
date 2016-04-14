//
//  TPhotoView.h
//  growapp0308
//
//  Created by zhengch on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPhotoView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *cv;
@property(nonatomic,strong) NSArray *data;

@end
