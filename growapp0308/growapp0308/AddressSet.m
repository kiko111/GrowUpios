//
//  AddressSet.m
//  growapp0308
//
//  Created by kiko on 16/3/17.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "AddressAdd.h"
#import "AddressSet.h"
#import "AddressTableCell.h"
#import "PurpleButton.h"
#import "BlueButton.h"

@interface AddressSet (){
    NSDictionary *data;
}

@end

@implementation AddressSet

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"地址管理";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *lview1=[[UIView alloc] initWithFrame:CGRectMake(0, 64 ,swidth, 0.5)];
    lview1.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    [self.view addSubview:lview1];
    
    [self configContent];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)configContent{
    if(data==nil){
        PurpleButton *addbut=[PurpleButton buttonWithType:UIButtonTypeCustom];
        addbut.frame = CGRectMake((swidth-123)/2, 170, 123, 34);
        [addbut setTitle:@"添加地址" forState:UIControlStateNormal];
        [addbut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [addbut addTarget:self action:@selector(addressAdd) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:addbut];
        

    }else{
        
        UITableView *addressTable=[[UITableView alloc] initWithFrame:CGRectMake(0,64, swidth, sheight-80)];
        addressTable.delegate=self;
        addressTable.dataSource=self;
        addressTable.separatorStyle=NO;
        [self.view addSubview:addressTable];
        
        BlueButton *addbut=[BlueButton buttonWithType:UIButtonTypeCustom];
        addbut.frame = CGRectMake(20, sheight-80, swidth-40, 34);
        [addbut setTitle:@"添加地址" forState:UIControlStateNormal];
        [addbut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [addbut addTarget:self action:@selector(addressAdd) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:addbut];
        
    
    }
   
    
    
}

- (void)addressAdd{
    AddressAdd * view = [[AddressAdd alloc]init];
    [view setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:view animated:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"CellIdentifier";
    AddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];

    cell.label.text=@"北京市 昌平区 回龙观xxxxxxx";

    return cell;



//    telmsg.text=[[NSString alloc] initWithFormat:@"当前绑定手机号： %@ " ,tel];
//
//    but.textlabel.text=[titleList objectAtIndex:i];
//
//    NSUInteger row =indexPath.row-1;
//    NSDictionary *rowDict = [couponList objectAtIndex:row];


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
