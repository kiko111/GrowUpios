//
//  Home.m
//  growapp0308
//
//  Created by kiko on 16/3/8.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define BLUECOLOR ([UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1])
#define LINECOLOR ([UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1])
#define GRAY1COLOR ([UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1])
#import "SDCycleScrollView.h"
#import "HomeView1.h"
#import "HomeView3.h"
#import "HomeView2.h"
#import "HSubPage1.h"
#import "HSubPage2.h"
#import "MeHome.h"
#import "MallButton.h"
#import "NewsCategoryViewController.h"
#import "Home.h"
#import "ArticalDetail.h"

#import "TCourseView.h"
#import "MBProgressHUD.h"

@interface Home ()<SDCycleScrollViewDelegate>{
    UITableView *mainTable;
    UIView *headview;
    SelectView * view1;
    NSMutableArray *parasList;
    
    NSArray *titles;//标题菜单
    NSMutableArray *titlename;
    NSMutableArray *titleid;
    

    NSArray *urls;//轮播图片地址
    NSMutableArray *urlsimg;
    NSMutableArray *urlsid;
    
    
    NSArray *news;//滚动新闻
    NSMutableArray *newname;
    NSMutableArray *newid;
    
 
    
    NSDictionary *dic1;
    NSMutableArray *dic1url;
    NSMutableArray *dic1name;
    NSMutableArray *dic1content;
    NSMutableArray *dic1id;
    
    
    NSDictionary *dic2;
    NSMutableArray *dic2url;
    NSMutableArray *dic2name;
    NSMutableArray *dic2content;
    NSMutableArray *dic2id;
    
    NSDictionary *dic3;
    NSMutableArray *dic3url;
    NSMutableArray *dic3name;
    NSMutableArray *dic3content;
    NSMutableArray *dic3id;
    
    
    
    
    NSDictionary *headtitle;
    
    
    // NSMutableArray *parasLists;
}

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    headview=[[UIView alloc] initWithFrame:CGRectMake(0, 0,swidth, 64)];
    headview.backgroundColor=[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    [self.view addSubview:headview];
    parasList=[[NSMutableArray alloc] init];
    [self getData];
    //    NSLog(@"%@",dic1);
    //    NSLog(@"jsjsjjsjsjsjjjsjsjsjs");
    [self configHeadView];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) buttonDidClicked:(UIButton*)sender {
    NSLog(@"askdjuyiuqw");
    
    view1 = [[SelectView alloc] initWithArray:@[@"老师",@"机构",@"课程",@"商品",@"知识"] frame:CGRectMake(CGRectGetMidX(sender.frame), CGRectGetMaxY(sender.frame), 100, CGRectGetHeight(sender.frame) * 5)];
    [self.view addSubview:view1];
    view1.selected = ^(NSString *str) {
        [sender setTitle:str forState:UIControlStateNormal];
    };
        
    
}

-(void)configHeadView{
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 30,60, 25)];
    UILabel *lefttitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 0,50, 25)];
    lefttitle.text=@"北京";
    lefttitle.textColor=[UIColor whiteColor];
    lefttitle.font=[UIFont systemFontOfSize:15];
    [leftButton addSubview:lefttitle];
    
    UIImageView *leftimg=[[UIImageView alloc] initWithFrame:CGRectMake(45, 8,11, 7)];
    leftimg.image=[UIImage imageNamed:@"home7"];
    [leftButton addSubview:leftimg];
    [headview addSubview:leftButton];
    
    
    
    UIView *searchview=[[UIView alloc]initWithFrame:CGRectMake(swidth/2-swidth/3,27, swidth/1.7, 32)];
    searchview.backgroundColor=[UIColor whiteColor];
    searchview.layer.cornerRadius=5;
    searchview.layer.masksToBounds = YES;
    [searchview.layer setBorderWidth:3];
    [searchview.layer setBorderColor:[UIColor whiteColor].CGColor];
    [headview addSubview:searchview];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"老师" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    button.frame = CGRectMake(-13, 0, 80, 32);
    UIImageView *selectimg=[[UIImageView alloc] initWithFrame:CGRectMake(62, 12, 10, 8)];
    selectimg.image=[UIImage imageNamed:@"homeselect"];
    [button addSubview:selectimg];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [searchview addSubview:button];
    
    UIView *verline=[[UIView alloc] initWithFrame:CGRectMake(swidth/2-swidth/3+68, 27, 1, 31)];
    verline.backgroundColor=LINECOLOR;
    [headview addSubview:verline];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(75,0, swidth/1.7-70, 32)];
    self.searchBar.placeholder = @"搜索科目、老师、课程";
    self.searchBar.layer.cornerRadius = 5;
    self.searchBar.layer.masksToBounds = YES;
    [self.searchBar.layer setBorderWidth:9];
    [self.searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [searchview addSubview:self.searchBar];
    
    
    
    
    
    
    
    
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(4.4*swidth/6, 30,50, 25)];
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
    
    
    UIButton *rightButton1 = [[UIButton alloc]initWithFrame:CGRectMake(5*swidth/6, 25,50, 30)];
    UIImageView *rightimg1=[[UIImageView alloc] initWithFrame:CGRectMake(20, 5,25, 25)];
    rightimg1.image=[UIImage imageNamed:@"homehead"];
    [rightButton1 addSubview:rightimg1];
    [rightButton1 addTarget:self action:@selector(mehome) forControlEvents:UIControlEventTouchUpInside];
    
    [headview addSubview:rightButton1];
    
    
}
-(void)mehome{
    MeHome * view = [[MeHome alloc]init];
    //[view setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:view animated:YES];

}
- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [manager GET:@"http://inner.deepai.com:8880/rest/cms_home/12?picture_limit=3&picture_catId=8&catalog_id_1=11&floor_1_limit=4&catalog_id_2=12&floor_2_limit=6&catalog_id_3=13&floor_3_limit=1&catalog_id_4=14&floor_4_limit=6&cat_id=4&news_limited=3" parameters:@{} progress:^(NSProgress *progress){//
        
    }success:^(NSURLSessionDataTask *task,id responseObject){
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            //NSLog(@"ooooo");
        }
        
       // NSLog(@"response==%@",responseObject);
        dic1 = [responseObject objectForKey:@"floor1_article"];
        dic2 = [responseObject objectForKey:@"floor2_article"];
        dic3 = [responseObject objectForKey:@"floor4_article"];
        urls=[responseObject objectForKey:@"banner_URL"];
        news=[responseObject objectForKey:@"news_list"];
        titles=[responseObject objectForKey:@"category"];
        
        headtitle=[responseObject objectForKey:@"mainpage_head"];
        //[mainTable reloadData];
        //[self addSubview:cv];
        if(responseObject!=nil){
            [self configData];
            [self configContent];
        }
        
    }failure:^(NSURLSessionDataTask *task,NSError *error){
        //NSLog(@"error==%@",error);
    }];
    
    
    
}



-(void)configContent{
    mainTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 64,swidth, sheight-64)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.separatorStyle=NO;
    [self.view addSubview:mainTable];
}
-(void)configData{
    
    titlename=[[NSMutableArray alloc] init];
    titleid=[[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<titles.count;i++){
        NSDictionary *dic=[titles objectAtIndex:i];
        [titlename addObject:[dic objectForKey:@"category_name"]];
        [titleid addObject:[dic objectForKey:@"category_id"]];
        
    }
    

    urlsimg=[[NSMutableArray alloc] init];
    urlsid=[[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<urls.count;i++){
        NSDictionary *dic=[urls objectAtIndex:i];
        [urlsimg addObject:[dic objectForKey:@"picture_url"]];
        [urlsid addObject:[dic objectForKey:@"picture_url_passage_id"]];
        
    }
    
    newname=[[NSMutableArray alloc] init];
    newid=[[NSMutableArray alloc] init];
    for(NSUInteger i=0; i<news.count;i++){
        NSDictionary *dic=[news objectAtIndex:i];
        [newname addObject:[dic objectForKey:@"article_title"]];
        [newid addObject:[dic objectForKey:@"article_id"]];
        
    }
    

    
    
    
    
    
    NSArray *arr1=[dic1 objectForKey:@"list"];
    
    dic1url=[[NSMutableArray alloc] init];
    dic1name=[[NSMutableArray alloc] init];
    dic1content=[[NSMutableArray alloc] init];
    dic1id=[[NSMutableArray alloc] init];
    
    for(NSUInteger i=0; i<arr1.count;i++){
        NSDictionary *dic=[arr1 objectAtIndex:i];
        [dic1url addObject:[dic objectForKey:@"floor_1_artile_file_piture"]];
        [dic1name addObject:[dic objectForKey:@"floor_1_artile_title"]];
        [dic1id addObject:[dic objectForKey:@"floor_1_artile_id"]];
        
    }
    
    
    
    NSArray *arr2=[dic2 objectForKey:@"list"];
    dic2url=[[NSMutableArray alloc] init];
    dic2name=[[NSMutableArray alloc] init];
    dic2content=[[NSMutableArray alloc] init];
    dic2id=[[NSMutableArray alloc] init];
    
    for(NSUInteger i=0; i<arr2.count;i++){
        
        NSDictionary *dic=[arr2 objectAtIndex:i];
        [dic2url addObject:[dic objectForKey:@"floor_1_artile_file_piture"]];
        [dic2name addObject:[dic objectForKey:@"floor_1_artile_title"]];
        [dic2content addObject:[dic objectForKey:@"floor_1_artile_title"]];
        [dic2id addObject:[dic objectForKey:@"floor_1_artile_id"]];
        
    }
    
    NSArray *arr3=[dic3 objectForKey:@"list"];
    dic3url=[[NSMutableArray alloc] init];
    dic3name=[[NSMutableArray alloc] init];
    dic3content=[[NSMutableArray alloc] init];
    dic3id=[[NSMutableArray alloc] init];
    

    for(NSUInteger i=0; i<arr3.count;i++){
        
        NSDictionary *dic=[arr3 objectAtIndex:i];
        
        [dic3url addObject:[dic objectForKey:@"floor_1_artile_file_piture"]];
        [dic3name addObject:[dic objectForKey:@"floor_1_artile_title"]];
        [dic3content addObject:[dic objectForKey:@"floor_1_artile_title"]];
        [dic3id addObject:[dic objectForKey:@"floor_1_artile_id"]];
        
    }

  
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return 3;
        
    }else
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0&&indexPath.row==0){
        return 40;
    }else if (indexPath.section==0&&indexPath.row==1){
        return 163;
    }else if (indexPath.section==0&&indexPath.row==2){
        return 35;
    }else if (indexPath.section==1){
        return 290;
    }else if (indexPath.section==2){
        return 564;
    }else
        return 280;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
 
    
  
    if(indexPath.section==0&&indexPath.row==0){
        MallButton *headbtn=[[MallButton alloc] initWithFrame:CGRectMake(0, 0, (swidth-45)/5, 40)];
        headbtn.textlabel.textColor=[UIColor colorWithRed:1.0f/255.0f green:126.0f/255.0f blue:242.0f/255.0f alpha:1];
        headbtn.textlabel.text=@"首页";
        [cell.contentView addSubview:headbtn];
       // NSArray *namearr=@[@"心理学教育",@"教育心得",@"教育文章",@"教育技巧"];
        
        for(NSInteger i=0;i<4;i++){
            MallButton *btn=[[MallButton alloc]init];
            btn.textlabel.textColor=GRAY1COLOR;
            btn.frame=CGRectMake((1+i)*(swidth-45)/5, 0,(swidth-45)/5,40);
            btn.textlabel.text=[titlename objectAtIndex:i+1];//@"如果想成为一名儿童教育心理学的";
            btn.tag=10;
            btn.idstring=[titleid objectAtIndex:i];
            [btn addTarget:self action:@selector(gos:) forControlEvents:UIControlEventTouchUpInside];
            //[btn addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
            [cell.contentView addSubview:btn];
        }
        
        UIButton *btnimg=[[UIButton alloc] initWithFrame:CGRectMake(swidth-45, 0, 45, 40)];
        btnimg.backgroundColor=[UIColor whiteColor];
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(15, 16, 15, 10)];
        img.image=[UIImage imageNamed:@"mallclass"];
        [btnimg addSubview:img];
        btnimg.tag=95;
        [btnimg addTarget:self action:@selector(gos:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btnimg];
        
        
        
        return cell;
        
        
    }
    
    
    
    
    if(indexPath.section==0&&indexPath.row==1){
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        CGRect imageFrame = CGRectMake(0, 0, swidth, 164);
        //NSArray *imageNames;
        //        if(urls!=nil){
//        imageNames = @[[urlsimg objectAtIndex:0],
//                       [urls objectAtIndex:1],
//                       [urls objectAtIndex:2],
//                       [urls objectAtIndex:0]// 本地图片请填写全名
//                       ];
        //        }else{
        //            imageNames = @[@"banner1",
        //                                @"banner2",
        //                                @"banner3",
        //                                @"banner2"// 本地图片请填写全名
        //                                ];
        //
        //        }
        SDCycleScrollView *imageScroll = [SDCycleScrollView cycleScrollViewWithFrame:imageFrame imageNamesGroup:urlsimg];
        imageScroll.autoScrollTimeInterval = 3.0;
        
        imageScroll.currentPageDotColor = [UIColor blackColor];
        imageScroll.pageDotColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        
        [cell.contentView addSubview:imageScroll];
        return cell;
        
    }
    else if(indexPath.section==0&&indexPath.row==2){
        UIImageView *notifyImg=[[UIImageView alloc] initWithFrame:CGRectMake(19, 11.5,15, 20)];
        notifyImg.image=[UIImage imageNamed:@"notify"];
        [cell addSubview:notifyImg];
        
        UILabel *notifyLabel=[[UILabel alloc] initWithFrame:CGRectMake(57.5, 13.5,200, 15)];
        notifyLabel.font=[UIFont systemFontOfSize:12];
        notifyLabel.textColor=BLUECOLOR;
        notifyLabel.text=[newname objectAtIndex:0];//@"6.16学习狂欢节疯狂助学1，6亿";
        [cell addSubview:notifyLabel];
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 34.5,swidth, 0.5)];
        line.backgroundColor=LINECOLOR;
        [cell.contentView addSubview:line];
        return cell;
        
    }else if (indexPath.section==1){
        UIView *verline=[[ UIView alloc] initWithFrame:CGRectMake(10, 15,2, 15) ];
        verline.backgroundColor=BLUECOLOR;
        [cell.contentView addSubview:verline];
        
        UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(20, 15,80, 15) ];
        title.font=[UIFont systemFontOfSize:15];
        title.textColor=[UIColor blackColor];
        title.text=[dic1 objectForKey:@"floor_1_category_name"];//@"心理学教育";
        [cell addSubview:title];
        
        
     
        
        
        
        for(NSUInteger i=1;i<dic1name.count+1;i++){
            UIButton *btn=[[UIButton alloc] init];
            HomeView1 *view=[[HomeView1 alloc] init];
            if(i%2!=0){
                view.frame=CGRectMake(10, 35+(i-1)*67,swidth/2-20, 134);
                btn.frame=CGRectMake(0, 0,swidth/2-20, 134);
                
            }else{
                view.frame=CGRectMake(swidth/2+20, 35+(i-2)*67,swidth/2-20, 134);
                btn.frame=CGRectMake(0, 0,swidth/2-20, 134);
            }
            //[view.img setImageWithURL:[arr1img objectAtIndex:i-1]];
            view.img.image=[UIImage imageNamed:@"home3"];
            view.textlabel.text=[dic1name objectAtIndex:i-1];//@"教育孩子时爸妈应扮好“红白脸”教育孩子时爸妈应扮好“红白脸”";
            btn.tag=i-1+30;
            NSNumber *j=[NSNumber numberWithInteger:btn.tag+2];
            [parasList addObject:j];
            [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            [cell addSubview:view];
        }
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 289.5,swidth, 0.5)];
        line.backgroundColor=LINECOLOR;
        [cell.contentView addSubview:line];
        return cell;
        
        
    }else if (indexPath.section==2){
        UIView *verline=[[ UIView alloc] initWithFrame:CGRectMake(10, 12,2, 15) ];
        verline.backgroundColor=BLUECOLOR;
        [cell.contentView addSubview:verline];
        
        UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(20, 10,80, 20) ];
        title.font=[UIFont systemFontOfSize:15];
        title.textColor=[UIColor blackColor];
        title.text=[dic2 objectForKey:@"floor_1_category_name"];
        [cell addSubview:title];
        

        
        for(NSInteger i=0;i<dic2name.count;i++){
            UIButton *btn=[[UIButton alloc] init];
            HomeView2 *view=[[HomeView2 alloc]initWithFrame:CGRectMake(0, 40+i*89,swidth, 60)];
            btn.frame=CGRectMake(0, 0,swidth, 60);
            
            
            view.img.image=[UIImage imageNamed:@"home3"];
            view.labelst.text=[dic2name objectAtIndex:i];//@"如果想成为一名儿童教育心理学的";
            view.labelcond.text=[dic2content objectAtIndex:i];//@"心理学教育课程是以培养个体良好的心理素质为目的的专门课程，是学校及幼儿园心里教育";
            btn.tag=i+40;
            [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            [cell.contentView addSubview:view];
        }
        
        
        
        return cell;
    }
    
    
    else{
        
        UIView *verline=[[ UIView alloc] initWithFrame:CGRectMake(10, 23,2, 15) ];
        verline.backgroundColor=BLUECOLOR;
        [cell.contentView addSubview:verline];
        
        UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(20, 20,80, 20) ];
        title.font=[UIFont systemFontOfSize:15];
        title.textColor=[UIColor blackColor];
        title.text=[dic3 objectForKey:@"floor_1_category_name"];
        [cell addSubview:title];
        
       
        
        for(NSInteger i=1;i<dic3name.count+1;i++){
            HomeView3 *view=[[HomeView3 alloc] init];
            view.userInteractionEnabled = YES;
            if(i<4){
                view.frame=CGRectMake((i-1)*(swidth/3-10)+i*10, 50,swidth/3-10, 70);
                
            }else{
                view.frame=CGRectMake((i-4)*(swidth/3-10)+(i-3)*10, 140,swidth/3-10, 70);
            }
            view.img.image=[UIImage imageNamed:@"home5"];
            view.textlabel.text=[dic3name objectAtIndex:0];//@"宝宝学说话，妈妈最担心";
            view.idstring=[dic3id objectAtIndex:i-1];
            UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goview:)];
            [view addGestureRecognizer:tapGesture];
            [cell addSubview:view];
            
        }
        
        
        return cell;
    }
    
}

- (void)go:(UIButton *)button {
    if(button.tag>=30&&button.tag<=34){
        ArticalDetail * view = [[ArticalDetail alloc]init];
       // view.paras=parasList;//[parasList objectAtIndex:button.tag];//  向子页面传递数组；
        NSUInteger j=button.tag-30;
        view.articalId=[dic1id objectAtIndex:j];
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
    }else if(button.tag>=40&&button.tag<=45){
        ArticalDetail * view = [[ArticalDetail alloc]init];
        NSUInteger j=button.tag-40;
        view.articalId=[dic2id objectAtIndex:j];
        //view.paras=parasList;//[parasList objectAtIndex:button.tag];//  向子页面传递数组；
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
        
    }

}

-(void)gos:(MallButton *)btn{
    if(btn.tag==95){
        NewsCategoryViewController *view = [[NewsCategoryViewController alloc]init];
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
    }else if(btn.tag==10){
        HSubPage2 *view = [[HSubPage2 alloc]init];
        view.idstring=btn.idstring;
        view.titlename=btn.textlabel.text;
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
        
        
    }
}

-(void)goview:(UITapGestureRecognizer *)gesture  {
    
    if ([gesture.view isKindOfClass:[HomeView3 class]]) {
        HomeView3 *view=(HomeView3*)gesture.view;
        ArticalDetail * dview = [[ArticalDetail alloc]init];
        NSLog(@"vvvvvvvvvv%@",view.idstring);
        dview.articalId=view.idstring;
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
