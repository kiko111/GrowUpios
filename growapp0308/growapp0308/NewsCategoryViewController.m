//
//  NewsCategoryViewController.m
//  growapp0308
//
//  Created by zhengch on 16/3/31.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "NewsCategoryViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

#define screenWidth ([UIScreen mainScreen].bounds.size.width)
#define screenHeight ([UIScreen mainScreen].bounds.size.height)

@interface NewsCategoryViewController ()
{
    NSArray *tvData;
    NSArray *cvData;
    NSDictionary *dataAll;
}
@end

@implementation NewsCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _selectedLeftIndex = 0;
    [self requestTableviewData];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 11, 22)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"backbluee"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = left;
    
    self.navigationItem.title = @"全部分类";
   // self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16], NSFontAttributeName,[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1],NSForegroundColorAttributeName,nil]];
    
    _leftTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, screenHeight-109)];
    _leftTV.dataSource = self;
    _leftTV.delegate = self;
    _leftTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_leftTV];
    
  //  NSString *plistName = [[NSBundle mainBundle] pathForResource:@"subjectsData" ofType:@"plist"];
 //   dataAll = [[NSDictionary alloc] initWithContentsOfFile:plistName] ;
    
   // tvData = [dataAll objectForKey:@"category"];
    
  //  cvData = [[dataAll objectForKey:@"data"] objectAtIndex:_selectedLeftIndex];
    
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
    
    _rightCV = [[UICollectionView alloc] initWithFrame:CGRectMake(110, 64, screenWidth-124, screenHeight) collectionViewLayout:fl];
    
    [_rightCV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_rightCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [_rightCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    _rightCV.backgroundColor = [UIColor whiteColor];
    _rightCV.delegate = self;
    _rightCV.dataSource = self;
    
    [self.view addSubview:_rightCV];
    
    
}
- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestTableviewData{
    NSString *url = @"http://10.104.5.39/dapi/rest/v1/cms_category/?cat_id=4";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [manager GET:url parameters:@{} progress:^(NSProgress *progress){
        
    }success:^(NSURLSessionDataTask *task,id responseObject){
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            id dataRecv = [responseObject objectForKey:@"category"];
            
            //NSLog(@"%@",tmpArr);
            tvData = (NSArray*)dataRecv;
            [_leftTV reloadData];
        }
        
    }failure:^(NSURLSessionDataTask *task,NSError *error){
        NSLog(@"error==%@",error);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tvData count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    UILabel *categoryTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 47)];
    categoryTitle.text = [tvData objectAtIndex:indexPath.row][@"category_name"];
    categoryTitle.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    categoryTitle.font = [UIFont systemFontOfSize:14];
    categoryTitle.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:categoryTitle];
    
    if (indexPath.row == _selectedLeftIndex) {
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        cell.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedLeftIndex = indexPath.row;
    [_leftTV reloadData];
    
 //   cvData = [[dataAll objectForKey:@"data"] objectAtIndex:_selectedLeftIndex];
 //   [_rightCV reloadData];
}

//collectionView delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [cvData count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [[[cvData objectAtIndex:section] objectForKey:@"list"] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *itemData = [[[cvData objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
    return CGSizeMake(collectionView.frame.size.width/5 , 35);
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
    
    UICollectionViewCell *cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    while ([cell.contentView.subviews lastObject] != nil) {
        [[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,screenWidth/5,35)];
    
    title.text = [[[cvData objectAtIndex:indexPath.section] objectForKey:@"list"] objectAtIndex:indexPath.row];
    title.font = [UIFont systemFontOfSize:13];
    title.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    
    [cell.contentView addSubview:title];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *view;
    
    if([kind isEqual:UICollectionElementKindSectionHeader])
    {
        view =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        while ([view.subviews lastObject] != nil) {
            [[view.subviews lastObject] removeFromSuperview];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 200, 30)];
        label.text = [[cvData objectAtIndex:indexPath.section] objectForKey:@"title"] ;
        label.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
        label.font = [UIFont systemFontOfSize:13];
        
        [view addSubview:label];
        
    }
    if ([kind isEqual:UICollectionElementKindSectionFooter]) {
        view =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        view.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
    }
    //view.backgroundColor = [UIColor blueColor];
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.frame.size.width, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeMake(collectionView.frame.size.width, 0.5);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
