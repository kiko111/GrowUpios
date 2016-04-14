//
//  IDCertificate.m
//  growapp0308
//
//  Created by kiko on 16/3/12.
//  Copyright © 2016年 kiko. All rights reserved.
//

#define TEXTCOLOR ([UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1])
#define SELECTEDCOLOR ([UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:239.0f/255.0f alpha:1])

#import "SelectButton.h"
#import "WhiteRoundField.h"
#import "IDCertificate.h"

@interface IDCertificate (){
    UIScrollView *mainScrollView;
    UIView *idView;
    UIView *passView;
    // NSInteger *selectedIndex;
    NSMutableArray *buttonList;
    
}

@end

@implementation IDCertificate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidLoadWhite];
    //NSLog(@"《《《《《《《《《《《《《");
    //NSLog(@"%@",_paras);
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"身份认证";
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
    mainScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, swidth, sheight)];
    mainScrollView.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    mainScrollView.pagingEnabled=YES;
    mainScrollView.contentSize=CGSizeMake(swidth,sheight*1.2);
    [self.view addSubview:mainScrollView];
    
    UILabel *tipstitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 13 ,100, 25)];
    tipstitle.textColor=[UIColor  blackColor];
    tipstitle.text=@"温馨提示：";
    tipstitle.font=[UIFont systemFontOfSize:14 ];
    [mainScrollView addSubview:tipstitle];
    
    
    UILabel *tips1=[[UILabel alloc] initWithFrame:CGRectMake(10, 42 ,swidth-20, 20)];
    tips1.textColor=GRAYTEXTCOLOR;
    tips1.font=[UIFont systemFontOfSize:11];
    tips1.text=@"1、您的证件信息成长在线将为您保密，只用于认证身份、不会挪作他用";
    [mainScrollView addSubview:tips1];
    
    
    UILabel *tips2=[[UILabel alloc] initWithFrame:CGRectMake(10, 65 ,swidth-20, 40)];
    tips2.textColor=GRAYTEXTCOLOR;
    tips2.font=[UIFont systemFontOfSize:11];
    tips2.numberOfLines=0;
    NSString *tipText=@"2、上传 “身份证正面” 或者 “护照信息、签证页” 的照片可以有效提高审核通过的概率";
    NSMutableAttributedString  *attributedStr=[[NSMutableAttributedString alloc] initWithString:tipText ];
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [tipText length])];
    tips2.attributedText=attributedStr;
    [mainScrollView addSubview:tips2];
    
    
    
    
    UIView *unchangedView=[[UIView alloc] initWithFrame:CGRectMake(0, 120 ,swidth, 41)];
    unchangedView.backgroundColor=[UIColor whiteColor];
    [mainScrollView addSubview:unchangedView];
    
    
    buttonList=[[NSMutableArray alloc] init];
    
    NSArray *titleList=@[@"身份证认证",@"护照认证"];
    for(NSInteger i=0;i<2 ;i++){
        SelectButton *but=[[SelectButton alloc] initWithFrame:CGRectMake(i*swidth/2, 0, swidth/2, 40.5)];
        but.textlabel.text=[titleList objectAtIndex:i];
        but.tag=i;
        [buttonList addObject:but];
        [unchangedView addSubview:but];
        [but addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    //selectedIndex=[[NSInteger alloc] init];
    _selectedIndex=0;
    
    SelectButton *btn = [buttonList objectAtIndex:0];
    btn.textlabel.textColor=SELECTEDCOLOR;
    btn.line.backgroundColor=SELECTEDCOLOR;
    
    idView=[[UIView alloc] initWithFrame:CGRectMake(0, 160 ,swidth, sheight)];
    passView=[[UIView alloc] initWithFrame:CGRectMake(0, 160 ,swidth, sheight)];
    [self changeView];
    
    
}
-(void)changeView{
    
    idView.backgroundColor=[UIColor whiteColor];
    
    [self configidView];
    [mainScrollView addSubview:idView];
    
    
    passView.backgroundColor=[UIColor whiteColor];
    [self configpassView];
}



-(void)menu:(SelectButton *)btn{
    //NSLog(@"%ld",(long)btn.tag);
    if (_selectedIndex == btn.tag) {
        btn.textlabel.textColor=SELECTEDCOLOR;
        btn.line.backgroundColor=SELECTEDCOLOR;
        _selectedIndex = -1;
    }
    else{
        for (int i=0; i<buttonList.count; i++) {
            SelectButton *btns = [buttonList objectAtIndex:i];
            if (i == btn.tag) {
                btns.textlabel.textColor=SELECTEDCOLOR;
                btns.line.backgroundColor=SELECTEDCOLOR;
            }
            else{
              //  NSLog(@"22222222");
                btns.textlabel.textColor=TEXTCOLOR;
                btns.line.backgroundColor=[UIColor whiteColor];
            }
            
        }
        _selectedIndex = btn.tag;
        // NSLog(@"%ld",_selectedIndex);
    }
    NSLog(@">>>>>>>>>>>>>>>>");
    NSLog(@"%ld",(long)btn.tag);
    
    if (_selectedIndex == -1) {
        idView.hidden = YES;
    }
    else if(_selectedIndex==0){
        NSLog(@"ccccccccccccc");
        [passView removeFromSuperview];
        [mainScrollView addSubview:idView];
    }else{
        [idView removeFromSuperview];
        [mainScrollView addSubview:passView];
    }
    
    
}


-(void)configidView{
    WhiteRoundField *namefield=[[WhiteRoundField alloc] initWithFrame:CGRectMake(10,15, swidth-30, 35)];
    namefield.placeholder=@"姓名：";
    [idView addSubview:namefield];
    
    WhiteRoundField *idfield=[[WhiteRoundField alloc] initWithFrame:CGRectMake(10,63, swidth-30, 35)];
    idfield.placeholder=@"身份证号：";
    [idView addSubview:idfield];
    
    
    
    UIView *spaceView1=[[UIView alloc] initWithFrame:CGRectMake(0,110, swidth, 65)];
    spaceView1.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [idView addSubview:spaceView1];
    
    UILabel *tipstitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 8 ,200, 25)];
    tipstitle.textColor=[UIColor  blackColor];
    tipstitle.text=@"手持身份证照片（必填）";
    tipstitle.font=[UIFont systemFontOfSize:14 ];
    [spaceView1 addSubview:tipstitle];
    
    UILabel *tips1=[[UILabel alloc] initWithFrame:CGRectMake(10, 35 ,swidth-20, 20)];
    tips1.textColor=GRAYTEXTCOLOR;
    tips1.font=[UIFont systemFontOfSize:11];
    tips1.text=@"提示：免冠，保证五官清晰可见，手持证件，不要遮挡证件信息";
    [spaceView1 addSubview:tips1];
    
    
    
    
    UIButton *handpic1=[[UIButton alloc] initWithFrame:CGRectMake(swidth/4-50, 200 ,100, 75)];
    UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
    img1.image=[UIImage imageNamed:@"122"];
    [handpic1 addSubview:img1];
    [idView addSubview:handpic1];
    
    
    
    UIView *spaceView2=[[UIView alloc] initWithFrame:CGRectMake(0,300, swidth, 65)];
    spaceView2.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [idView addSubview:spaceView2];
    
    UILabel *tipstitle1=[[UILabel alloc] initWithFrame:CGRectMake(10, 8 ,200, 25)];
    tipstitle1.textColor=[UIColor  blackColor];
    tipstitle1.text=@"身份证正面";
    tipstitle1.font=[UIFont systemFontOfSize:14 ];
    [spaceView2 addSubview:tipstitle1];
    
    UILabel *tips2=[[UILabel alloc] initWithFrame:CGRectMake(10, 35 ,swidth-20, 20)];
    tips2.textColor=GRAYTEXTCOLOR;
    tips2.font=[UIFont systemFontOfSize:11];
    tips2.text=@"提示：免冠，保证五官清晰可见，手持证件，不要遮挡证件信息";
    [spaceView2 addSubview:tips2];
    
    
    
    UIButton *handpic2=[[UIButton alloc] initWithFrame:CGRectMake(swidth/4-50, 385 ,100, 75)];
    UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
    img2.image=[UIImage imageNamed:@"122"];
    [handpic2 addSubview:img2];
    [idView addSubview:handpic2];
    
}


-(void)configpassView{
    WhiteRoundField *namefield=[[WhiteRoundField alloc] initWithFrame:CGRectMake(10,15, swidth-30, 35)];
    namefield.placeholder=@"姓名：";
    [passView addSubview:namefield];
    
    WhiteRoundField *idfield=[[WhiteRoundField alloc] initWithFrame:CGRectMake(10,63, swidth-30, 35)];
    idfield.placeholder=@"护照号码：";
    [passView addSubview:idfield];
    
    
    
    UIView *spaceView1=[[UIView alloc] initWithFrame:CGRectMake(0,110, swidth, 65)];
    spaceView1.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [passView addSubview:spaceView1];
    
    UILabel *tipstitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 8 ,200, 25)];
    tipstitle.textColor=[UIColor  blackColor];
    tipstitle.text=@"手持护照照片（必填）";
    tipstitle.font=[UIFont systemFontOfSize:14 ];
    [spaceView1 addSubview:tipstitle];
    
    UILabel *tips1=[[UILabel alloc] initWithFrame:CGRectMake(10, 35 ,swidth-20, 20)];
    tips1.textColor=GRAYTEXTCOLOR;
    tips1.font=[UIFont systemFontOfSize:11];
    tips1.text=@"提示：免冠，保证五官清晰可见，手持证件，不要遮挡证件信息";
    [spaceView1 addSubview:tips1];
    
    
    
    
    UIButton *handpic1=[[UIButton alloc] initWithFrame:CGRectMake(swidth/4-50, 200 ,100, 75)];
    UIImageView *img1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
    img1.image=[UIImage imageNamed:@"122"];
    [handpic1 addSubview:img1];
    [passView addSubview:handpic1];
    
    
    
    UIView *spaceView2=[[UIView alloc] initWithFrame:CGRectMake(0,300, swidth, 65)];
    spaceView2.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [passView addSubview:spaceView2];
    
    UILabel *tipstitle1=[[UILabel alloc] initWithFrame:CGRectMake(10, 8 ,200, 25)];
    tipstitle1.textColor=[UIColor  blackColor];
    tipstitle1.text=@"护照信息页";
    tipstitle1.font=[UIFont systemFontOfSize:14 ];
    [spaceView2 addSubview:tipstitle1];
    
    UILabel *tips2=[[UILabel alloc] initWithFrame:CGRectMake(10, 35 ,swidth-20, 20)];
    tips2.textColor=GRAYTEXTCOLOR;
    tips2.font=[UIFont systemFontOfSize:11];
    tips2.text=@"提示：证件与手持证件一致，证件文字清晰可见";
    [spaceView2 addSubview:tips2];
    
    
    
    UIButton *handpic2=[[UIButton alloc] initWithFrame:CGRectMake(swidth/4-50, 385 ,100, 75)];
    UIImageView *img2=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
    img2.image=[UIImage imageNamed:@"122"];
    [handpic2 addSubview:img2];
    [passView addSubview:handpic2];
    
    
    
    UIView *spaceView3=[[UIView alloc] initWithFrame:CGRectMake(0,470, swidth, 65)];
    spaceView3.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    [passView addSubview:spaceView3];
    
    UILabel *tipstitle2=[[UILabel alloc] initWithFrame:CGRectMake(10, 8 ,200, 25)];
    tipstitle2.textColor=[UIColor  blackColor];
    tipstitle2.text=@"护照信息页";
    tipstitle2.font=[UIFont systemFontOfSize:14 ];
    [spaceView3 addSubview:tipstitle2];
    
    UILabel *tips3=[[UILabel alloc] initWithFrame:CGRectMake(10, 35 ,swidth-20, 20)];
    tips3.textColor=GRAYTEXTCOLOR;
    tips3.font=[UIFont systemFontOfSize:11];
    tips3.text=@"提示：证件与手持证件一致，证件文字清晰可见";
    [spaceView3 addSubview:tips3];
    
    
    
    UIButton *handpic3=[[UIButton alloc] initWithFrame:CGRectMake(swidth/4-50, 550 ,100, 75)];
    UIImageView *img3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0 ,100, 75)];
    img3.image=[UIImage imageNamed:@"122"];
    [handpic3 addSubview:img3];
    [passView addSubview:handpic3];
    
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
