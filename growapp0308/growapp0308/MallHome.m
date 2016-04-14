//
//  MallHome.m
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define BLUECOLOR ([UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1])
#define GRAY1COLOR ([UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1])
#define LINECOLOR ([UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1])
#import "SDCycleScrollView.h"
#import "MallHomeView1.h"
#import "MallHomeView2.h"
#import "MallHomeView3.h"
#import "MallButton.h"
#import "ChildrenArticals.h"
#import "MallHome.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "NewsCategoryViewController.h"
#import "growapp0308-Swift.h"


@interface MallHome ()<SDCycleScrollViewDelegate>{
    UITableView *mainTable;
    
    UIView *headview;
    
    NSMutableArray *parasList;
    NSDictionary *headtitle;
    
    NSArray *titles;//标题菜单以及大模块分类
    NSMutableArray *titlename;
    NSMutableArray *titleid;
    
    
    NSArray *urls;//轮播图片地址
    NSMutableArray *urlsimg;
    NSMutableArray *urlsid;
    
  
    NSArray *arr1;//推荐课程（图片）
    NSMutableArray *dic1url;
    NSMutableArray *dic1name;
    
    NSMutableArray *dic1id;
    
    
    NSArray *arr2;//课程列表（最下方）
    NSMutableArray *dic2url;
    NSMutableArray *dic2name;
    NSMutableArray *dic2price;
    NSMutableArray *dic2id;
    NSMutableArray *dic2content;
    

}


@end

@implementation MallHome

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    headview=[[UIView alloc] initWithFrame:CGRectMake(0, 0,swidth, 64)];
    headview.backgroundColor=[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    [self.view addSubview:headview];
    
    parasList=[[NSMutableArray alloc] init];
    [self getData];
    [self configHeadView];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

//首部导航设置
-(void)configHeadView{
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30,20, 20)];
    UIImageView *leftimg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,20, 20)];
    leftimg.image=[UIImage imageNamed:@"mallshopcar"];
    [leftButton addSubview:leftimg];
    [headview addSubview:leftButton];
    
    
    
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(45,27, swidth/1.5, 32)];
    self.searchBar.placeholder = @"搜索科目、老师";
    self.searchBar.layer.cornerRadius = 5;
    self.searchBar.layer.masksToBounds = YES;
    [self.searchBar.layer setBorderWidth:9];
    [self.searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [headview addSubview:self.searchBar];
    
    
    
    UIButton *combo=[[UIButton alloc] initWithFrame:CGRectMake(7,5, 55, 25)];
    UIImageView *comboimg=[[UIImageView alloc] initWithFrame:CGRectMake(45,0, 10, 10)];
    comboimg.image=[UIImage imageNamed:@"home7"];
    [combo addSubview:comboimg];
    UILabel *combotext=[[UILabel alloc] initWithFrame:CGRectMake(5,0, 35, 20)];
    combotext.text=@"老师";
    combotext.textColor=[UIColor darkGrayColor];
    combotext.font=[UIFont systemFontOfSize:13];
    [combo addSubview:combotext];
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(100,27, 0.5, 32)];
    line.backgroundColor=GRAYTEXTCOLOR;
    [headview addSubview:line];
    
    [_searchBar addSubview:combo];
    
    

    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(swidth/1.5+40, 30,50, 25)];
    UIImageView *rightimg=[[UIImageView alloc] initWithFrame:CGRectMake(20, 4,20, 20)];
    rightimg.image=[UIImage imageNamed:@"news"];
    [rightButton addSubview:rightimg];
    
    UIImageView *img1a=[[UIImageView alloc] initWithFrame:CGRectMake(28, -2 ,14,14)];
    img1a.image=[UIImage imageNamed:@"circle"];
    [rightButton addSubview:img1a];
    
    UILabel *t1a=[[UILabel alloc] initWithFrame:CGRectMake(33, 0 ,5,10)];
    t1a.text=@"1";
    t1a.font=[UIFont systemFontOfSize:9];
    t1a.textColor=[UIColor whiteColor];
    [rightButton addSubview:t1a];
    
    [headview addSubview:rightButton];
    
    
    UIButton *rightButton1 = [[UIButton alloc]initWithFrame:CGRectMake(swidth/1.5+74, 25,50, 30)];
    UIImageView *rightimg1=[[UIImageView alloc] initWithFrame:CGRectMake(20, 5,25, 25)];
    rightimg1.image=[UIImage imageNamed:@"homehead"];
    [rightButton1 addSubview:rightimg1];
    //[rightButton1 addTarget:self action:@selector(mehome) forControlEvents:UIControlEventTouchUpInside];
    
    [headview addSubview:rightButton1];
    
    
}



//获取数据
- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [manager GET:@"http://inner.deepai.com:8880/rest/mall_home/?product_number=6&store_name=mall" parameters:@{} progress:^(NSProgress *progress){//
        
    }success:^(NSURLSessionDataTask *task,id responseObject){
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //NSLog(@"ooooo");
        }
        
        // NSLog(@"response==%@",responseObject);
        arr1 = [responseObject objectForKey:@"recommdenede_products"];
        arr2 = [responseObject objectForKey:@"product_list"];
        titles=[responseObject objectForKey:@"home_category_list"];

        if(responseObject!=nil){//成功获取数据
            [self configData];
            [self configContent];
        }
        
    }failure:^(NSURLSessionDataTask *task,NSError *error){
        //NSLog(@"error==%@",error);
    }];
    
    
    
}

//url图片转uiimage
-(UIImage *) imageFromURLString: (NSString *) urlstring
{
    // This call is synchronous and blocking
    return [UIImage imageWithData:[NSData
                                   dataWithContentsOfURL:[NSURL URLWithString:urlstring]]];
}

//配置数据格式
-(void)configData{
    
    titlename=[[NSMutableArray alloc] init];
    titleid=[[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<titles.count;i++){
        NSDictionary *dic=[titles objectAtIndex:i];
        [titlename addObject:[dic objectForKey:@"categroy_name"]];
        [titleid addObject:[dic objectForKey:@"categroy_id"]];
        
    }
    
    dic1url=[[NSMutableArray alloc] init];
    dic1name=[[NSMutableArray alloc] init];
    dic1id=[[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<arr1.count;i++){
        
        NSDictionary *dic=[arr1 objectAtIndex:i];
        
        [dic1url addObject:[dic objectForKey:@"recommendedProduct_image"]];
        [dic1id addObject:[dic objectForKey:@"recommendedProduct_price_id"]];
        
    }
   
    
    dic2url=[[NSMutableArray alloc] init];
    dic2name=[[NSMutableArray alloc] init];
    dic2price=[[NSMutableArray alloc] init];
    dic2id=[[NSMutableArray alloc] init];
    dic2content=[[NSMutableArray alloc] init];

    for(NSUInteger i=0; i<arr2.count;i++){
        
        NSDictionary *dic=[arr2 objectAtIndex:i];
        [dic2url addObject:[dic objectForKey:@"product_picture"]];
        [dic2name addObject:[dic objectForKey:@"product_name"]];
        [dic2id addObject:[dic objectForKey:@"product_id"]];
        [dic2price addObject:[dic objectForKey:@"product_price"]];
        [dic2content addObject:[dic objectForKey:@"product_content"]];
        
    }
    
    

    
    
}


//table初始化
-(void)configContent{
    mainTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 64,swidth, sheight-64)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.separatorStyle=NO;
    // mainTable.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [self.view addSubview:mainTable];
    
    
}


//table配置
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 40;
    }else if (indexPath.row==1){
        return 167.5;
    }else if (indexPath.row==2){
        return 141;
    }else if (indexPath.row==3){
        return 300;
    }else
        return 680;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    if(indexPath.row==0){//文字菜单 titles
        MallButton *headbtn=[[MallButton alloc] initWithFrame:CGRectMake(0, 0, (swidth-45)/5, 40)];
        headbtn.textlabel.textColor=[UIColor colorWithRed:1.0f/255.0f green:126.0f/255.0f blue:242.0f/255.0f alpha:1];
        headbtn.textlabel.text=@"首页";
        [cell.contentView addSubview:headbtn];
        for(NSInteger i=0;i<titles.count;i++){
            MallButton *btn=[[MallButton alloc]init];
            btn.textlabel.textColor=GRAY1COLOR;
            btn.frame=CGRectMake((1+i)*(swidth-45)/5, 0,(swidth-45)/5,40);
            btn.textlabel.text=[titlename objectAtIndex:i];//@"如果想成为一名儿童教育心理学的";
            btn.tag=9;
            [btn addTarget:self action:@selector(gos:) forControlEvents:UIControlEventTouchUpInside];
             //[btn addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
            [cell.contentView addSubview:btn];
        }
        
        UIButton *btnimg=[[UIButton alloc] initWithFrame:CGRectMake(swidth-45, 0, 45, 40)];
        btnimg.backgroundColor=[UIColor whiteColor];
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(15, 16, 15, 10)];
        img.image=[UIImage imageNamed:@"mallclass"];
        [btnimg addSubview:img];
        [btnimg addTarget:self action:@selector(goKinds) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btnimg];
        
        
        
        return cell;
        
    }
    else if(indexPath.row==1){//banner urls
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        CGRect imageFrame = CGRectMake(0, 0, swidth, 162.5);
        NSArray *imageNames;
        imageNames = @[@"mallbanner1",
                            @"mallbanner2",
                            @"mallbanner3"// 本地图片请填写全名
                            ];
        SDCycleScrollView *imageScroll = [SDCycleScrollView cycleScrollViewWithFrame:imageFrame imageNamesGroup:imageNames];
        imageScroll.autoScrollTimeInterval = 3.0;
        
        imageScroll.currentPageDotColor = [UIColor blackColor];
        imageScroll.pageDotColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [cell.contentView addSubview:imageScroll];
        
        
    }
    else if (indexPath.row==2){//推荐商品（只含图片） arr1
      
        MallHomeView1 *view1=[[MallHomeView1 alloc] initWithFrame:CGRectMake(0, 0,swidth/2, 136)];
        view1.img.image=[self imageFromURLString:dic1url[0]];//@"mallimg1"];
        
        MallHomeView1 *view2=[[MallHomeView1 alloc] initWithFrame:CGRectMake(swidth/2, 0,swidth/4, 70)];
        view2.img.image=[self imageFromURLString:dic1url[1]];//[UIImage imageNamed:@"mallimg2"];
        
        MallHomeView1 *view3=[[MallHomeView1 alloc] initWithFrame:CGRectMake(3*swidth/4, 0,swidth/4, 70)];
        view3.img.image=[self imageFromURLString:dic1url[2]];//[UIImage imageNamed:@"mallimg3"];
        
        MallHomeView1 *view4=[[MallHomeView1 alloc] initWithFrame:CGRectMake(swidth/2, 70,swidth/2, 66)];
        view4.img.image=[self imageFromURLString:dic1url[3]];//[UIImage imageNamed:@"mallimg4"];
        
        [cell.contentView addSubview:view1];
        [cell.contentView addSubview:view2];
        [cell.contentView addSubview:view3];
        [cell.contentView addSubview:view4];
        
        
    }
    else if (indexPath.row==3){//推荐商品分类 titles
       NSArray *imgarr=@[[UIImage imageNamed:@"mallimg5"],[UIImage imageNamed:@"mallimg5"],[UIImage imageNamed:@"mallimg6"],[UIImage imageNamed:@"mallimg6"],[UIImage imageNamed:@"mallimg7"],[UIImage imageNamed:@"mallimg8"]];
        
        //NSArray *namearr=@[@"儿童数据",@"儿童书籍",@"电子产品",@"电子产品",@"学习用品",@"老师教材"];
        
        for(NSInteger i=0;i<titles.count;i++){
            MallHomeView2 *view=[[MallHomeView2 alloc]init];
            if(i%2==0){
                view.frame=CGRectMake(0, i*50,swidth/2-1,100);
            
            }else{
                view.frame=CGRectMake(swidth/2, (i-1)*50,swidth/2-1,100);
            }
            view.img.image=[imgarr objectAtIndex:i];
            view.name.text=[titlename objectAtIndex:i];//@"如果想成为一名儿童教育心理学的";
            view.idstring=[titleid objectAtIndex:i];
            UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goview2:)];
            [view addGestureRecognizer:tapGesture];
            [cell.contentView addSubview:view];
        }
        return cell;
        
    }
    
    else{//arr2
      // NSArray *imgarr=@[[UIImage imageNamed:@"mallimg9"],[UIImage imageNamed:@"mallimg9"],[UIImage imageNamed:@"mallimg9"],[UIImage imageNamed:@"mallimg9"],[UIImage imageNamed:@"mallimg9"],[UIImage imageNamed:@"mallimg9"]];
        // NSLog(@"response==%@",dic3name);
          //NSLog(@"response==%@",dic3url);
        for(NSInteger i=0;i<arr2.count;i++){
            MallHomeView3 *view=[[MallHomeView3 alloc]init];
            if(i%2==0){
                view.frame=CGRectMake(0, i*102+(i/2+1)*5,swidth/2-5,204);
                
            }else{
                view.frame=CGRectMake(swidth/2+5, (i-1)*102+((i-1)/2+1)*5,swidth/2-5,204);
            }
            view.img.image=[self imageFromURLString:dic2url[i]];//[UIImage imageNamed:@"mallimg9"];
            view.label1.text=[dic2content objectAtIndex:i];//@"快";
            view.label2.text=[dic2price objectAtIndex:i];//;
            view.idstring=[dic2url objectAtIndex:i];
            UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goview3:)];
            [view addGestureRecognizer:tapGesture];
            [cell.contentView addSubview:view];
        }


    } return cell;
    
}


//儿童用品
-(void)gos:(MallButton *)btn{
    //if(btn.tag==0){
        ChildrenArticals *view = [[ChildrenArticals alloc]init];
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
    //}
}

-(void)goKinds{
    NewsCategoryViewController *view = [[NewsCategoryViewController alloc]init];
    [view setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:view animated:YES];

}
-(void)goview1:(UITapGestureRecognizer *)gesture  {
    
    if ([gesture.view isKindOfClass:[MallHomeView1 class]]) {
        MallHomeView1 *view=(MallHomeView1*)gesture.view;
        GoodsViewController * dview = [[GoodsViewController alloc]init];
        NSLog(@"vvvvvvvvvv%@",view.idstring);
        dview.idString = view.idstring;
        [dview setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:dview animated:YES];
        
    }
}
-(void)goview2:(UITapGestureRecognizer *)gesture  {
    
    if ([gesture.view isKindOfClass:[MallHomeView2 class]]) {
        MallHomeView2 *view=(MallHomeView2*)gesture.view;
        GoodsViewController * dview = [[GoodsViewController alloc]init];
        NSLog(@"vvvvvvvvvv%@",view.idstring);
        dview.idString=view.idstring;
        [dview setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:dview animated:YES];
        
    }
}
-(void)goview3:(UITapGestureRecognizer *)gesture  {
    
    if ([gesture.view isKindOfClass:[MallHomeView3 class]]) {
        MallHomeView3 *view=(MallHomeView3*)gesture.view;
        GoodsViewController * dview = [[GoodsViewController alloc]init];
        NSLog(@"vvvvvvvvvv%@",view.idstring);
        dview.idString=view.idstring;
        [dview setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:dview animated:YES];
        
    }
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
