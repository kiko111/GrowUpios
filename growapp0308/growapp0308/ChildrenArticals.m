//
//  ChildrenArticals.m
//  growapp0308
//
//  Created by kiko on 16/3/22.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "ChildrenArticalsButton.h"
#import "MallHomeView3.h"
#import "ChildrenArticals.h"
#define TEXTCOLOR ([UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1])
#define SELECTED_TEXTCOLOR ([UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1])
@interface ChildrenArticals (){
    NSMutableArray *buttonList;
    NSArray *titleList;
    UITableView *mainTable;
    UIView *menuview;
    
    
    NSArray *dataList;
    
}


@end

@implementation ChildrenArticals

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"儿童用品";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [self configContent];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configContent{

        _selectedIndex=0;
    
    mainTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,swidth, sheight)];
    mainTable.delegate=self;
    mainTable.dataSource=self;
    mainTable.separatorStyle=NO;
    
    [self.view addSubview:mainTable];
    
    
    
}

-(void)menu:(ChildrenArticalsButton *)btn{
    //NSLog(@"%ld",(long)btn.tag);
    if (_selectedIndex == btn.tag) {
        btn.textlabel.textColor=SELECTED_TEXTCOLOR;
        //_selectedIndex = -1;
    }
    else{
        for (int i=0; i<buttonList.count; i++) {
            ChildrenArticalsButton *btns = [buttonList objectAtIndex:i];
            if (i == btn.tag) {
                btns.textlabel.textColor=SELECTED_TEXTCOLOR;
                //改变数数据源，并[mainTable reloadData]
            }
            else{
                //NSLog(@"22222222");
                btns.textlabel.textColor=TEXTCOLOR;
            }
        }
        _selectedIndex = btn.tag;
        // NSLog(@"%ld",_selectedIndex);
    }
    //NSLog(@">>>>>>>>>>>>>>>>");
    
    if (_selectedIndex == -1) {
        mainTable.hidden = YES;
    }
    else{
        [self.view addSubview:mainTable];
        
    }
    
    
}



// mainTable.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 40.5;
    }else
        return sheight*2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
   
    if(indexPath.row==0){
        menuview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, swidth, 40.5)];
        menuview.backgroundColor=[UIColor whiteColor];
        
        // [self configMenu];
        
        buttonList = [[NSMutableArray alloc] init];
        titleList=@[@"综合排序",@"人气",@"销量"];
        dataList=@[@"全部",@"待支付",@"进行中",@"待评价"];
        
        for(NSInteger i=0;i<titleList.count ;i++){
            ChildrenArticalsButton *but=[[ChildrenArticalsButton alloc] initWithFrame:CGRectMake(i*swidth/3, 0, swidth/3, 40.5)];
            but.textlabel.text=[titleList objectAtIndex:i];
            but.tag=i;
            [buttonList addObject:but];
            [menuview addSubview:but];
            [but addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        ChildrenArticalsButton *btns = [buttonList objectAtIndex:0];
        btns.textlabel.textColor=SELECTED_TEXTCOLOR;
        
        [cell addSubview:menuview];
    
    }else{
        for(NSInteger i=0;i<10;i++){
            MallHomeView3 *view=[[MallHomeView3 alloc]init];
            if(i%2==0){
                view.frame=CGRectMake(0, i*102+(i/2+1)*5,swidth/2-5,204);
                
            }else{
                view.frame=CGRectMake(swidth/2+5, (i-1)*102+((i-1)/2+1)*5,swidth/2-5,204);
            }
            view.img.image=[UIImage imageNamed:@"mallimg9"];
            view.label1.text=@"快译通M9 学习机小学初中高中10.1英寸学生平板电脑同步教材点读机家教";
            view.label2.text=@"¥105.5";
            //btn.tag=i+5;
            //[btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:view];
        }

    }
    
    return cell;
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
