//
//  DiplomaCertificate.m
//  growapp0308
//
//  Created by kiko on 16/3/15.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "DiplomaCertificate.h"

@interface DiplomaCertificate ()

@end

@implementation DiplomaCertificate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"学历认证";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = BLUECOLOR;
    self.navigationItem.titleView = title;
    
    [self configHeadRight];
    
    [self configContent];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configHeadRight{
    
    
    UIButton *rbut = [[UIButton alloc] initWithFrame:CGRectMake(swidth-70, 18, 27, 8)];
    UILabel *t=[[UILabel alloc] initWithFrame:CGRectMake(0, 0 ,27, 8)];
    t.text=@"提交";
    t.font=[UIFont systemFontOfSize:13];
    t.textColor=BLUECOLOR;
    [rbut addSubview:t];
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithCustomView:rbut];
    self.navigationItem.rightBarButtonItem = rightbtn;
    
}

-(void)configContent{
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *spaceView=[[UIView alloc] initWithFrame:CGRectMake(0,64, swidth, 65)];
    spaceView.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [self.view addSubview:spaceView];
    
    UILabel *tips=[[UILabel alloc] initWithFrame:CGRectMake(10, 10 ,swidth-20, 40)];
    tips.textColor=GRAYTEXTCOLOR;
    tips.font=[UIFont systemFontOfSize:11];
    tips.numberOfLines=0;
    NSString *tipText=@"请提交能证明你学历水平的证件照片，如：学生证、在读证明、毕业证等（需包含照片、姓名、专业、校方印章等有效信息）";
    NSMutableAttributedString  *attributedStr=[[NSMutableAttributedString alloc] initWithString:tipText ];
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [tipText length])];
    tips.attributedText=attributedStr;
    [spaceView addSubview:tips];
    
    UIButton *handpic=[[UIButton alloc] initWithFrame:CGRectMake((swidth-200)/2, 160 ,200, 125)];
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
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
