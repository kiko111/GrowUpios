//
//  MyVideo.m
//  growapp0308
//
//  Created by kiko on 16/3/17.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MyVideo.h"

@interface MyVideo ()

@end

@implementation MyVideo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"我的视频";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    
    UIView *lview1=[[UIView alloc] initWithFrame:CGRectMake(0, 44 ,swidth, 0.5)];
    lview1.backgroundColor=[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1];
    [self.view addSubview:lview1];
    
    [self.navigationController.navigationBar addSubview:lview1];
    
    [self configContent];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configContent{
    self.view.backgroundColor=[UIColor whiteColor];
    
//    UIView *spaceView=[[UIView alloc] initWithFrame:CGRectMake(0,64, swidth, 55)];
//    spaceView.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
//    [self.view addSubview:spaceView];
    
    UILabel *tips=[[UILabel alloc] initWithFrame:CGRectMake(10, 74 ,swidth-20, 40)];
    tips.textColor=[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:239.0f/255.0f alpha:1];
    tips.font=[UIFont systemFontOfSize:11];
    tips.numberOfLines=0;
    NSString *tipText=@"请上传自我介绍、课程短片、才艺展示等有利于学生了解您的视频";
    NSMutableAttributedString  *attributedStr=[[NSMutableAttributedString alloc] initWithString:tipText ];
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [tipText length])];
    tips.attributedText=attributedStr;
    [self.view addSubview:tips];
    
    UIButton *handpic=[[UIButton alloc] initWithFrame:CGRectMake(20, 130 ,140, 125)];
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 70)];
    img.image=[UIImage imageNamed:@"122"];
    [handpic addSubview:img];
    [self.view addSubview:handpic];
    
    
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
