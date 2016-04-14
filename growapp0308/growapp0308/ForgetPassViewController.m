//
//  ForgetPassViewController.m
//  OrgOnline
//
//  Created by zhengch on 16/3/7.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "ForgetPassViewController.h"

@interface ForgetPassViewController ()
{
    UITextField *phone;
    UITextField *valicode;
    UIButton *valicodeBtn;
    
    UITextField *password;
    UITextField *passwordag;
    
    UIButton *submit;
}

@end

@implementation ForgetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"找回密码";
    self.view.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    phone = [[UITextField alloc] initWithFrame:CGRectMake(10, 85, screenWidth-20, 44)];
    phone.keyboardType = UIKeyboardTypePhonePad;
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 44)];
    leftLabel.text = @"手机号:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftView addSubview:leftLabel];
    
    phone.leftView = leftView;
    phone.leftViewMode = UITextFieldViewModeAlways;
    phone.backgroundColor = [UIColor whiteColor];
    phone.layer.cornerRadius = 3;
    phone.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    phone.layer.borderWidth = 1;
    
    [self.view addSubview:phone];
    
    valicode = [[UITextField alloc] initWithFrame:CGRectMake(10, 139, screenWidth*0.45, 44)];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 44)];
    leftLabel.text = @"验证码:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftView addSubview:leftLabel];
    
    valicode.leftView = leftView;
    valicode.leftViewMode = UITextFieldViewModeAlways;
    valicode.backgroundColor = [UIColor whiteColor];
    valicode.layer.cornerRadius = 3;
    valicode.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    valicode.layer.borderWidth = 1;
    [self.view addSubview:valicode];
    
    valicodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-screenWidth*0.36-10, 139, screenWidth*0.36, 44)];
    valicodeBtn.backgroundColor = [UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1];
    valicodeBtn.layer.cornerRadius = 3;
    [valicodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [valicodeBtn setTitleColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1] forState:UIControlStateNormal];
    valicodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [valicodeBtn addTarget:self action:@selector(getValicode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:valicodeBtn];
    
    //密码
    password = [[UITextField alloc] initWithFrame:CGRectMake(10, 193, screenWidth-20, 44)];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 52, 44)];
    leftLabel.text = @"设置密码:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 72, 44)];
    [leftView addSubview:leftLabel];
    
    password.leftView = leftView;
    password.leftViewMode = UITextFieldViewModeAlways;
    password.backgroundColor = [UIColor whiteColor];
    password.layer.cornerRadius = 3;
    password.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    password.layer.borderWidth = 1;
    [self.view addSubview:password];
    
    UILabel *passTip = [[UILabel alloc] initWithFrame:CGRectMake(0, 243, screenWidth, 13)];
    passTip.text = @"密码长度为6到30位，数字、字母、符号至少包含两种";
    passTip.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    passTip.font = [UIFont systemFontOfSize:12];
    passTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:passTip];
    
    passwordag = [[UITextField alloc] initWithFrame:CGRectMake(10, 269, screenWidth-20, 44)];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 52, 44)];
    leftLabel.text = @"确认密码:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 72, 44)];
    [leftView addSubview:leftLabel];
    
    passwordag.leftView = leftView;
    passwordag.leftViewMode = UITextFieldViewModeAlways;
    passwordag.backgroundColor = [UIColor whiteColor];
    passwordag.layer.cornerRadius = 3;
    passwordag.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    passwordag.layer.borderWidth = 1;
    [self.view addSubview:passwordag];
    
    submit = [[UIButton alloc] initWithFrame:CGRectMake(10, 363, screenWidth-20, 41)];
    submit.backgroundColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    submit.layer.cornerRadius = 3;
    [submit setTitle:@"提交" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:14];
    [submit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submit];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getValicode{
    
}

- (void)submit{
    
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
