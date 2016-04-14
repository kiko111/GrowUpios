//
//  MeHome.m
//  growapp0308
//
//  Created by kiko on 16/3/14.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "Order.h"
#import "MeHome.h"
#import "ImTeacher.h"
#import "IDCertificate.h"

@interface MeHome (){
    NSArray *titleList;
    NSArray *imgList;
    
}

@end

@implementation MeHome

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    
    titleList=[[NSArray alloc] init];
    titleList=@[@"课表",@"购物车",@"钱包",@"待支付",@"进行中",@"待评价",@"我是学生",@"我是老师",@"我的商城",@"设置"];
    
    imgList=[[NSArray alloc] init];
    imgList=@[@"meschedule",@"meshopcar",@"mewallet",@"medoing",@"menotpay",@"metoevalute",@"mesetup",@"mestudent",@"mestudent",@"mesetup"];
    
    
    //[self configHeadView];
    [self configMidTable];
    
    
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



-(void)configMidTable{
    self.tableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, swidth, sheight-44)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.separatorStyle = NO;
    self.tableview.scrollEnabled =YES;
    [self.view addSubview:self.tableview];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0||section==1||section==2||section==4){
        return 1;
    }else
        return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 156;
            break;
        case 1:
            return 81;
            break;
        case 2:
            return 111;
            break;
        default:
            return 40.5;
            break;
    }
    return 40;
}

//自定义section头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==2||section==3||section==4){
        return 15;}
    else
        return 0;
    
}
//自定义section头部view
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Background color
    view.tintColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    UIView *lview1=[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,swidth, 0.5)];
    lview1.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    UIView *lview2=[[UIView alloc] initWithFrame:CGRectMake(0, 14.5 ,swidth, 0.5)];
    lview2.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    [view addSubview:lview1];
    [view addSubview:lview2];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CGFloat threelength=(swidth-229)/2;
    
    if (indexPath.section==0) {
        UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,swidth, 156)];
        img1.image=[UIImage imageNamed:@"mebg"];
        
        UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake((swidth-61.5)/2, 25.5 ,61.5, 61.5)];
        img2.image=[UIImage imageNamed:@"mehead"];
        
        
        
        UIButton *but1=[[UIButton alloc] initWithFrame:CGRectMake(67.5, 40 ,60, 70)];
        UIImageView *img3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,60,70)];
        img3.image=[UIImage imageNamed:@"studenthome"];
        [but1 addSubview:img3];
        
        
        
        UIButton *but2=[[UIButton alloc] initWithFrame:CGRectMake((swidth-92)/2, 103.5,92, 25)];
        UIImageView *img4=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,92,25)];
        img4.image=[UIImage imageNamed:@"melogin"];
        [but2 addSubview:img4];
        
        UIButton *but3=[[UIButton alloc] initWithFrame:CGRectMake(swidth-127.5, 40 ,60, 70)];
        UIImageView *img5=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,60,70)];
        img5.image=[UIImage imageNamed:@"teacherhome"];
        [but3 addSubview:img5];
        
        
        //[cell.contentView addSubview:but];
        [cell.contentView addSubview:img1];
        [cell.contentView addSubview:img2];
        [cell.contentView addSubview:but1];
        [cell.contentView addSubview:but2];
        [cell.contentView addSubview:but3];
        
    }else if(indexPath.section==1){
        
        
        for(NSInteger i=0;i<3;i++){
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(32+i*(threelength+60), 15.5,60, 55)];
            
            UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(0, 30 ,80, 18)];
            title.font=[UIFont systemFontOfSize:13];
            title.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
            title.text=[titleList objectAtIndex:i];
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,27,25)];
            img.image=[UIImage imageNamed:[imgList objectAtIndex:i]];
            
            
            [btn addSubview:title];
            [btn addSubview:img];
            btn.tag=i;
            [cell.contentView addSubview:btn];
            
            [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    else if (indexPath.section==2){
        
        
        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(10, 10 ,100, 20)];
        label2.text=@"订单";
        label2.font=[UIFont systemFontOfSize:14];
        label2.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        
        UIButton *but=[[UIButton alloc] initWithFrame:CGRectMake(swidth-90, 10,120, 20)];
        UILabel *t=[[UILabel alloc] initWithFrame:CGRectMake(0, 0 ,60, 20)];
        t.text=@"全部订单";
        t.font=[UIFont systemFontOfSize:11];
        t.textColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(52, 5 ,5,10)];
        img.image=[UIImage imageNamed:@"mearrow"];
        but.tag=4;
        [but addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        [but addSubview:t];
        [but addSubview:img];
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(10, 29,swidth-10, 0.5)];
        line.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
        
        [cell.contentView addSubview:label2];
        [cell.contentView addSubview:but];
        [cell.contentView addSubview:line];
        
        
        
        for(NSInteger i=3;i<6;i++){
            UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(29.5+(i-3)*(threelength+60), 39,60, 55)];
            
            UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(0, 30 ,80, 18)];
            title.font=[UIFont systemFontOfSize:13];
            title.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
            title.text=[titleList objectAtIndex:i];
            
            UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(4, 3 ,27,18)];
            img.image=[UIImage imageNamed:[imgList objectAtIndex:i]];
            
            
            [btn addSubview:title];
            [btn addSubview:img];
            btn.tag=i;
            [cell.contentView addSubview:btn];
            
            [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
    }else{
        
        NSArray *titles1=[[NSArray alloc] init];
        titles1=@[@"我是学生",@"我是老师",@"我的商城"];
        
        NSArray *imgs1=[[NSArray alloc] init];
        imgs1=@[@"istudent",@"iteacher",@"ishopping"];
        
        NSArray *titles2=[[NSArray alloc] init];
        titles2=@[@"设置"];
        
        NSArray *imgs2=[[NSArray alloc] init];
        imgs2=@[@"isetup"];
        
        NSUInteger row = [indexPath row];
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 8.5, 24, 24)];
        //imageView.backgroundColor = [UIColor redColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        if(indexPath.section==3){
            imageView.image=[UIImage imageNamed:[imgs1 objectAtIndex:row]];
        }else
            imageView.image=[UIImage imageNamed:[imgs2 objectAtIndex:row]];
        
        
        
        [cell.contentView addSubview:imageView];
        
        
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, 100, 35)];
        
        if(indexPath.section==3){
            nameLabel.text=  [titles1 objectAtIndex:row];
        }else
            nameLabel.text=  [titles2 objectAtIndex:row];
        
        
        nameLabel.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
        nameLabel.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:nameLabel];
        
        UIImageView *indicatorview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mearrow"]];
        [indicatorview setFrame:CGRectMake(0, 0, 5, 10)];
        cell.accessoryView = indicatorview;
        
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 40.5, swidth, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==3&&indexPath.row==1){//我是老师
        ImTeacher *view=[[ImTeacher alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else if (indexPath.section==3&&indexPath.row==0){
        IDCertificate *view=[[IDCertificate alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (void)go:(UIButton *)button {
    if (button.tag==5){
        Order *view = [[Order alloc]init];
        view.selectedIndex=1;
        [view setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:view animated:YES];
    }
    
}


@end
