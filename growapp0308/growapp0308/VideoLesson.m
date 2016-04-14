//
//  VideoLesson.m
//  growapp0308
//
//  Created by kiko on 16/3/29.
//  Copyright © 2016年 kiko. All rights reserved.
//
#import "VideoAdd.h"
#import "VideoLesson.h"

@interface VideoLesson (){
    NSArray *videoList;
    
}


@end

@implementation VideoLesson

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    // Do any additional setup after loading the view.
    // [self configHeadView];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"视频课";
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
    VideoAdd * view = [[VideoAdd alloc]init];
    [view setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:view animated:YES];
}





-(void)configContent{
    if(videoList==nil){
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
        
    }
    
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
