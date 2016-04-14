//
//  HSubPage2.m
//  growapp0308
//
//  Created by kiko on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
#import "HomeView2.h"
#import "ArticalDetail.h"
#import "HSubPage2.h"

@interface HSubPage2 ()

@end

@implementation HSubPage2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = _titlename;
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
    UITableView  *mainTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, swidth, sheight)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.separatorStyle=NO;
    [self.view addSubview:mainTable];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return 135;
    }else
        return sheight-150;
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if(indexPath.section==0){
        
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0,0 ,swidth, 135)];
        img.image=[UIImage imageNamed:@"home65"];
        [cell.contentView addSubview:img];
        
        return cell;
        
    }
    else {
        
        for(NSInteger i=0;i<6;i++){
            UIButton *btn=[[UIButton alloc] init];
            HomeView2 *view=[[HomeView2 alloc]initWithFrame:CGRectMake(0, i*89,swidth, 60)];
            btn.frame=CGRectMake(0, 0,swidth, 60);
            
            
            view.img.image=[UIImage imageNamed:@"home3"];
            view.labelst.text=@"如果想成为一名儿童教育心理学的";
            view.labelcond.text=@"心理学教育课程是以培养个体良好的心理素质为目的的专门课程，是学校及幼儿园心里教育";
            btn.tag=i;
            [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            [cell.contentView addSubview:view];
        }
        
        return cell;
        
        
    }
    
    
    
}
-(void)go:(UIButton *)btn{
    if(btn.tag==0){
        ArticalDetail *view=[[ArticalDetail alloc] init];
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
