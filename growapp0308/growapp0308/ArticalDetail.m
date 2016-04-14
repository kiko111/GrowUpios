//
//  ArticalDetail.m
//  growapp0308
//
//  Created by kiko on 16/3/14.
//  Copyright © 2016年 kiko. All rights reserved.
//
#define TEXTCOLOR ([UIColor colorWithRed:136.0f/255.0f green:136.0f/255.0f blue:136.0f/255.0f alpha:1])
#import "ArticalDetail.h"

@interface ArticalDetail (){
    NSDictionary *data;
}

@end

@implementation ArticalDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    self.view.backgroundColor=[UIColor whiteColor];
   // _articalId=30;
   NSLog(@"============%@",_articalId);
    [self getData];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configContent{
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 64, swidth, 0.5)];
    line.backgroundColor=GRAYTEXTCOLOR;
    [self.view addSubview:line];
    
    UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(20, 82, swidth, 15)];
    title.text=[data objectForKey:@"cms_passage_title"];//@"如何处理这些家庭教育硬伤";
    title.font=[UIFont systemFontOfSize:17];
    [self.view addSubview:title];
    
    UILabel *timeLabel=[[UILabel alloc] initWithFrame:CGRectMake(24, 107, 200, 10)];
    timeLabel.font=[UIFont systemFontOfSize:10];
    timeLabel.textColor=GRAYTEXTCOLOR;
    timeLabel.text=[data objectForKey:@"cms_passage_update_time"];//@"2016-01-06  10:30:26";
    [self.view addSubview:timeLabel];
    
    UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(10, 127, swidth-20, 123)];
    img.image=[UIImage imageNamed:@"banner1"];
    // [img setImageWithURL:<#(nonnull NSURL *)#>]
    [self.view addSubview:img];
    
    
    UILabel *content=[[UILabel alloc] initWithFrame:CGRectMake(20, 250 ,swidth-40, sheight-260)];
    content.textColor=TEXTCOLOR;
    content.font=[UIFont systemFontOfSize:13];
    content.numberOfLines=0;
    NSString *tipText=[data objectForKey:@"cms_passage_content"];//@"2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率";
    NSMutableAttributedString  *attributedStr=[[NSMutableAttributedString alloc] initWithString:tipText ];
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [tipText length])];
    content.attributedText=attributedStr;
    [self.view addSubview:content];
    
    
    
    
}


- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    NSMutableString *szMuMyString = [NSMutableString stringWithString:@"http://inner.deepai.com:8880/rest/cms_article/"];
    [szMuMyString appendString: [NSString stringWithFormat: @"%@",_articalId]];
    [manager GET:szMuMyString parameters:@{} progress:^(NSProgress *progress){
        
    }success:^(NSURLSessionDataTask *task,id responseObject){
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"ooooo");
        }
        
       // NSLog(@"response==%@",responseObject);
        data = [responseObject objectForKey:@"userAlbum"];
        if(responseObject!=nil){
            [self configContent];
        }
        
        
        
    }failure:^(NSURLSessionDataTask *task,NSError *error){
        NSLog(@"error==%@",error);
    }];
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