//
//  AddressAdd.m
//  growapp0308
//
//  Created by kiko on 16/3/17.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "AddressField.h"
#import "AddressAdd.h"

@interface AddressAdd (){
    UIImageView *imgSelecta;
    UIButton *radioUp;
}

@end

@implementation AddressAdd

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *lview1=[[UIView alloc] initWithFrame:CGRectMake(0, 44 ,swidth, 0.5)];
    lview1.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    [self.view addSubview:lview1];
    
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"新建地址";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;

    [self.navigationController.navigationBar addSubview:lview1];
    self.view.backgroundColor=[UIColor whiteColor];
    
   [self configContent];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configContent{
    AddressField *namefield=[[AddressField alloc] initWithFrame:CGRectMake(0,64, swidth, 45)];
    namefield.placeholder=@"所在地区：";
    [self.view addSubview:namefield];
    
    AddressField *detaiaddress=[[AddressField alloc] initWithFrame:CGRectMake(0,109, swidth, 45)];
    detaiaddress.placeholder=@"详细地址：";
    [self.view addSubview:detaiaddress];
    
    radioUp=[[UIButton alloc] initWithFrame:CGRectMake(10,165, 20, 20)];
    imgSelecta=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,22,22)];
    imgSelecta.image=[UIImage imageNamed:@"notselect"];
    [radioUp addSubview:imgSelecta];
    radioUp.tag=0;
    [radioUp addTarget:self action:@selector(updiscountselect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:radioUp];
    
    UILabel *radiolable=[[UILabel alloc] initWithFrame:CGRectMake(50,165,70, 20)];
    radiolable.text=@"默认地址";
    radiolable.font=[UIFont systemFontOfSize:12];
    radiolable.textColor=[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];

    [self.view addSubview:radiolable];
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 199, swidth, 0.5)];
    line.backgroundColor=[UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1];
    [self.view addSubview:line];
    
    
}


-(void)updiscountselect:(UIButton *)btn{
    NSLog(@"left");
    if(btn.tag==0){
        imgSelecta.image=[UIImage imageNamed:@"select"];
        btn.tag=1;
    }else{
        imgSelecta.image=[UIImage imageNamed:@"notselect"];
        btn.tag=0;
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
