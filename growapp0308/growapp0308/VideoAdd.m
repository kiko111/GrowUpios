//
//  VideoAdd.m
//  growapp0308
//
//  Created by kiko on 16/3/29.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "VideoAdd.h"

@interface VideoAdd ()

@end

@implementation VideoAdd

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    // Do any additional setup after loading the view.
    // [self configHeadView];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"添加视频课程";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    [self configHeadRight];
    //[self configContent];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configHeadRight{
    
    
    UIButton *rbut = [[UIButton alloc] initWithFrame:CGRectMake(swidth-70, 18, 27, 8)];
    UILabel *t=[[UILabel alloc] initWithFrame:CGRectMake(0, 0 ,27, 8)];
    t.text=@"保存";
    t.font=[UIFont systemFontOfSize:13];
    t.textColor=BLUECOLOR;
    [rbut addSubview:t];
    
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithCustomView:rbut];
    self.navigationItem.rightBarButtonItem = rightbtn;
    
    
    
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
