//
//  ImTeacher.m
//  growapp0308
//
//  Created by kiko on 16/3/12.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "TeacherSetup.h"
#import "LessonSet.h"
#import "ImTeacher.h"

@interface ImTeacher (){
    UITableView *mainTable;
}

@end

@implementation ImTeacher

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"我是老师";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    
    [self configContent];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configContent{
    mainTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, swidth, sheight)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.separatorStyle=NO;
    [self.view addSubview:mainTable];
    


}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0||section==1){
        return 3;
    }else
        return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 15;
    
    
}
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
    
    
    NSArray *section1=[[NSArray alloc] init];
    section1=@[@"老师设置",@"课程设置",@"我的订单"];
    
    NSArray *section2=[[NSArray alloc] init];
    section2=@[@"我的学生",@"我的文章",@"我的邀请"];
    
    NSArray *section3=[[NSArray alloc] init];
    section3=@[@"我的优惠券",@"我的评价"];

    
    NSUInteger row = [indexPath row];
    
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 100, 35)];

    switch (indexPath.section) {
        case 0:
            nameLabel.text=  [section1 objectAtIndex:row];
            break;
        case 1:
            nameLabel.text=  [section2 objectAtIndex:row];
            break;
        case 2:
            nameLabel.text=  [section3 objectAtIndex:row];
            break;
        default:
            break;
    }
    
    nameLabel.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    nameLabel.font = [UIFont systemFontOfSize:13];
    [cell.contentView addSubview:nameLabel];
    
    UIImageView *indicatorview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mearrow"]];
    [indicatorview setFrame:CGRectMake(0, 0, 5, 10)];
    cell.accessoryView = indicatorview;
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 40.5, swidth, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    [cell.contentView addSubview:line];
    
        
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0&&indexPath.row==0){//老师设置
        TeacherSetup *view=[[TeacherSetup alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else if(indexPath.section==0&&indexPath.row==1){//课程设置
        LessonSet *view=[[LessonSet alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
        self.hidesBottomBarWhenPushed = NO;
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
