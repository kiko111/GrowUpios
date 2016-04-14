//
//  TPhotoView.m
//  growapp0308
//
//  Created by zhengch on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "TPhotoView.h"

@implementation TPhotoView
{
    CGFloat cellWidth;
    CGFloat cellHeight;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor greenColor];
        
        UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
        
        _cv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, frame.size.height) collectionViewLayout:fl];
        
        [_cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _cv.backgroundColor = [UIColor whiteColor];
        _cv.delegate = self;
        _cv.dataSource = self;
        
        _cv.userInteractionEnabled = NO;
        
        [self addSubview:_cv];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [_cv addSubview:line];
        
        cellWidth = (_cv.frame.size.width-45)/3;
        cellHeight = cellWidth*127/210+51;
        
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _data.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(cellWidth , cellHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%3 == 0) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, cellHeight*(indexPath.row/3+1)-0.5, collectionView.frame.size.width   , 0.5)];
        line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
        [collectionView addSubview:line];
    }
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    while ([cell.contentView.subviews lastObject] != nil) {
        [[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 15, cellWidth, cellWidth*127/210)];
    img.image = [UIImage imageNamed:@"th-photo_1"];
    
    
    [cell.contentView addSubview:img];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, img.frame.origin.y+img.frame.size.height+10, cellWidth, 11)];
    //title.text = @"机构图片";
    title.text = [[_data objectAtIndex:indexPath.row] objectForKey:@"title"];
    title.font = [UIFont systemFontOfSize:10];
    title.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    title.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:title];
    
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
