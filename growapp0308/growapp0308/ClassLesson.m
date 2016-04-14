//
//  ClassLesson.m
//  growapp0308
//
//  Created by kiko on 16/3/29.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "ClassAdd.h"
#import "LessonCell.h"
#import "ClassLesson.h"

@interface ClassLesson (){
    NSArray *classList;
    UITableView *contentTable;
    
}

@end

@implementation ClassLesson

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    // Do any additional setup after loading the view.
    // [self configHeadView];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"班课";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    [self configHeadRight];
    [self configContent];
    
}

-(void)configHeadRight{
    
    
    UIButton *rbut = [[UIButton alloc] initWithFrame:CGRectMake(swidth-65, 11, 22, 22)];
    
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,22,22)];
    img.image=[UIImage imageNamed:@"kindsadd"];
    [rbut addSubview:img];
    
    [rbut addTarget:self action:@selector(couponAdd) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithCustomView:rbut];
    self.navigationItem.rightBarButtonItem = rightbtn;
    
    
    
}
- (void)couponAdd{
    ClassAdd * view = [[ClassAdd alloc]init];
    [view setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:view animated:YES];
}





-(void)configContent{
    if(classList!=nil){
        UIImageView *couponImg=[[UIImageView alloc] initWithFrame:CGRectMake((swidth-80)/2,114.5, 80, 70)];
        couponImg.image=[UIImage imageNamed:@"melesson"];
        [self.view addSubview:couponImg];
        
        UILabel *nilMsg=[[UILabel alloc] initWithFrame:CGRectMake(0,213.5, swidth, 40)];
        nilMsg.text=@"目前课程为空，赶紧添加课程吧";
        nilMsg.textColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
        nilMsg.textAlignment= NSTextAlignmentCenter;
        
        [self.view addSubview:nilMsg];
        
    }
    else{
        contentTable=[[UITableView alloc] initWithFrame:CGRectMake(0,10, swidth, sheight)];
        contentTable.delegate=self;
        contentTable.dataSource=self;
        contentTable.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
        contentTable.separatorStyle = NO;
        [self.view addSubview:contentTable];
        
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 119.5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    LessonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LessonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    NSArray *testarray=@[@"45645185415",@"儿童心理学—幼儿",@"线下",@"刘敏",@"一对一课程",@"删除订单",@"待支付"];
    cell.labelst.text=[[NSString alloc] initWithFormat:@"订单号： %@ " ,[testarray objectAtIndex:0]];
    cell.labelcond.text=[[NSString alloc] initWithFormat:@"课程名称： %@ " ,[testarray objectAtIndex:1]];
    cell.labelird.text=[[NSString alloc] initWithFormat:@"授课方式： %@ " ,[testarray objectAtIndex:2]];
    cell.labelrth.text=[[NSString alloc] initWithFormat:@"授课老师： %@ " ,[testarray objectAtIndex:3]];
    cell.labelfth.text=[testarray objectAtIndex:4];
    return cell;
    
    
    
    //    telmsg.text=[[NSString alloc] initWithFormat:@"当前绑定手机号： %@ " ,tel];
    //
    //    but.textlabel.text=[titleList objectAtIndex:i];
    //
    //    NSUInteger row =indexPath.row-1;
    //    NSDictionary *rowDict = [couponList objectAtIndex:row];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
