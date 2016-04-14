//
//  HSubPage1.m
//  growapp0308
//  首页section1
//  Created by kiko on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "HomeView1.h"
#import "SubPageView1.h"
#import "HSubPage1.h"

#define TEXTCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1])
@interface HSubPage1 ()

@end

@implementation HSubPage1

- (void)viewDidLoad {
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0||section==1){
        return 1;
        
    }else
        return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return 150;
    }else if (indexPath.section==1){
        return 290;
    }else
        return 75;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if(indexPath.section==0){
        
        UILabel *titlelabel=[[UILabel alloc] initWithFrame:CGRectMake(10,10 ,150, 20)];
        titlelabel.font=[UIFont systemFontOfSize:14];
        titlelabel.textColor=[UIColor blackColor];
        titlelabel.text=@"如何处理这些家庭教育硬伤";
       
        
        UILabel *contentlabel=[[UILabel alloc] initWithFrame:CGRectMake(10,40 ,swidth/2-40, 90)];
        contentlabel.font=[UIFont systemFontOfSize:11];
        contentlabel.textColor=TEXTCOLOR;
        contentlabel.numberOfLines = 0;
        contentlabel.text=@"如何处理这些家庭教育硬伤,教育孩子时爸妈应扮好“红白脸”教育孩子时爸妈应扮好“红白脸《北京市续签教育条例》正是出台，这是全国第一部心理学教育课程是以培养个体良好的心理素质为目的的专门课程，是学校及幼儿园心里教育”";
        
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(swidth/2+10,10 ,110, 110)];
        img.image=[UIImage imageNamed:@"home56"];
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(10, 149.5,swidth-10, 0.5)];
        line.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        [cell.contentView addSubview:contentlabel];
        [cell.contentView addSubview:titlelabel];
        [cell.contentView addSubview:img];
        
        return cell;
        
    }
    else if (indexPath.section==1){
        
        for(NSInteger i=1;i<5;i++){
            UIButton *btn=[[UIButton alloc] init];
            HomeView1 *view=[[HomeView1 alloc] init];
            if(i%2!=0){
                view.frame=CGRectMake(10, (i-1)*67,swidth/2-20, 134);
                btn.frame=CGRectMake(0, 0,swidth/2-20, 134);
                
            }else{
                view.frame=CGRectMake(swidth/2+20, (i-2)*67,swidth/2-20, 134);
                btn.frame=CGRectMake(0, 0,swidth/2-20, 134);
            }
            view.img.image=[UIImage imageNamed:@"home1"];
            view.textlabel.text=@"教育孩子时爸妈应扮好“红白脸”教育孩子时爸妈应扮好“红白脸”";
            btn.tag=i-1;
            //NSNumber *j=[NSNumber numberWithInteger:btn.tag+2];
            //[parasList addObject:j];
            //[btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
            [cell addSubview:view];
            

        }
        
        
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(10, 289.5,swidth-10, 0.5)];
        line.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
        [cell.contentView addSubview:line];
        
        return cell;
        
        
    }else {
        
        for(NSInteger i=0;i<6;i++){
            
            SubPageView1 *view=[[SubPageView1 alloc] initWithFrame:CGRectMake(0, i*75,swidth, 75)];
            view.titlelabel.text=@"把孩子的早期教育交给谁";
            view.contentlabel.text=@"《北京市续签教育条例》正是出台，这是全国第一部心理学教育课程是以培养个体良好的心理素质为目的的专门课程，是学校及幼儿园心里教育";
            
            [cell addSubview:view];
        }
        return cell;
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
