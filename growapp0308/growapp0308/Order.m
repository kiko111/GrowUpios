//
//  Order.m
//  OrgOnline
// 订单
//  Created by kiko on 16/3/7.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1])
#define SELECTED_TEXTCOLOR ([UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1])

//#import "OrderTableCell.h"
//#import "SelectButton.h"
#import "Order.h"

@interface Order (){
    NSMutableArray *buttonList;
    NSArray *titleList;
    UITableView *contentTable;
    UIView *menuview;
    
    NSArray *dataList;

}
@end

@implementation Order

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [self viewDidLoadBlue];
    //[self configHeadRight];
    //[self configContent];
    // Do any additional setup after loading the view.
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)configContent{
//    titleList=@[@"全部",@"待支付",@"进行中",@"待评价"];
//    dataList=@[@"全部",@"待支付",@"进行中",@"待评价"];
//    buttonList = [[NSMutableArray alloc] init];
//    
//    menuview=[[UIView alloc] initWithFrame:CGRectMake(0, 66, swidth, 40.5)];
//    menuview.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:menuview];
//   // [self configMenu];
//    
//    
//    for(NSInteger i=0;i<titleList.count ;i++){
//        SelectButton *but=[[SelectButton alloc] initWithFrame:CGRectMake(i*swidth/4, 0, swidth/4, 40.5)];
//        but.textlabel.text=[titleList objectAtIndex:i];
//        but.tag=i;
//        [buttonList addObject:but];
//        [menuview addSubview:but];
//        [but addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        
//    }
//    
//    contentTable=[[UITableView alloc] initWithFrame:CGRectMake(0,106.5, swidth, sheight-106.5)];
//    contentTable.delegate=self;
//    contentTable.dataSource=self;
//    contentTable.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
//    contentTable.separatorStyle = NO;
//   // NSLog(@"%lu",(unsigned long)buttonList.count);
//    if(dataList==nil){//如果没有订单
//        _selectedIndex = 0;
////        UIImageView *couponImg=[[UIImageView alloc] initWithFrame:CGRectMake((swidth-50)/2,154, 50, 70)];
////        couponImg.image=[UIImage imageNamed:@"order"];
////        [self.view addSubview:couponImg];
////        
////        UILabel *nilMsg=[[UILabel alloc] initWithFrame:CGRectMake(0,259.5, swidth, 40)];
////        nilMsg.text=@"目前还没有订单哦～";
////        nilMsg.textColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
////        nilMsg.textAlignment= NSTextAlignmentCenter;
////        [self.view addSubview:nilMsg];
////        
////        _selectedIndex = -1;
//        
//    }else{
//       // _selectedIndex = 1;
//        SelectButton *btns = [buttonList objectAtIndex:_selectedIndex];
//        btns.textlabel.textColor=SELECTED_TEXTCOLOR;
//        btns.line.backgroundColor=SELECTED_TEXTCOLOR;
//        [self.view addSubview:contentTable];
//    
//    }
//    
//    
////    contentTable=[[UITableView alloc] initWithFrame:CGRectMake(0,106.5, swidth, sheight-106.5)];
////    contentTable.delegate=self;
////    contentTable.dataSource=self;
////    contentTable.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
////    contentTable.separatorStyle = NO;
//    
//
//}
//
//-(void)menu:(SelectButton *)btn{
//     //NSLog(@"%ld",(long)btn.tag);
//    if (_selectedIndex == btn.tag) {
//        btn.textlabel.textColor=SELECTED_TEXTCOLOR;
//        btn.line.backgroundColor=SELECTED_TEXTCOLOR;
//        _selectedIndex = -1;
//    }
//    else{
//        for (int i=0; i<buttonList.count; i++) {
//           SelectButton *btns = [buttonList objectAtIndex:i];
//            if (i == btn.tag) {
//                btns.textlabel.textColor=SELECTED_TEXTCOLOR;
//                btns.line.backgroundColor=SELECTED_TEXTCOLOR;
//            }
//            else{
//                NSLog(@"22222222");
//                btns.textlabel.textColor=TEXTCOLOR;
//                btns.line.backgroundColor=[UIColor whiteColor];
//            }
//        }
//        _selectedIndex = btn.tag;
//        // NSLog(@"%ld",_selectedIndex);
//    }
//    //NSLog(@">>>>>>>>>>>>>>>>");
//    
//    if (_selectedIndex == -1) {
//        contentTable.hidden = YES;
//    }
//    else{
//        [self.view addSubview:contentTable];
//        
//    }
//    
//    
//}
//
//
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 2;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 119.5;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *CellIdentifier = @"CellIdentifier";
//    OrderTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[OrderTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
//    
//    NSArray *testarray=@[@"45645185415",@"儿童心理学—幼儿",@"线下",@"刘敏",@"一对一课程",@"删除订单",@"待支付"];
//    cell.labelst.text=[[NSString alloc] initWithFormat:@"订单号： %@ " ,[testarray objectAtIndex:0]];
//    cell.labelcond.text=[[NSString alloc] initWithFormat:@"课程名称： %@ " ,[testarray objectAtIndex:1]];
//    cell.labelird.text=[[NSString alloc] initWithFormat:@"授课方式： %@ " ,[testarray objectAtIndex:2]];
//    cell.labelrth.text=[[NSString alloc] initWithFormat:@"授课老师： %@ " ,[testarray objectAtIndex:3]];
//    cell.labelfth.text=[testarray objectAtIndex:4];
//    cell.delbtn.textlabel.text=[testarray objectAtIndex:5];
//    cell.waitbtn.textlabel.text=[testarray objectAtIndex:6];
//    return cell;
//    
//    
//    
////    telmsg.text=[[NSString alloc] initWithFormat:@"当前绑定手机号： %@ " ,tel];
////    
////    but.textlabel.text=[titleList objectAtIndex:i];
////    
////    NSUInteger row =indexPath.row-1;
////    NSDictionary *rowDict = [couponList objectAtIndex:row];
//
//    
//}
//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
