//
//  RegisterTwoViewController.m
//  OrgOnline
//
//  Created by zhengch on 16/3/3.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "RegisterTwoViewController.h"

@interface RegisterTwoViewController ()
{
    UITextField *password;
    UITextField *passwordRepeat;
}

@end

@implementation RegisterTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置密码";
    
    self.view.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(10, 74, screenWidth-20, 44)];
    password.keyboardType = UIKeyboardTypePhonePad;
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 52, 44)];
    leftLabel.text = @"设置密码:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftView addSubview:leftLabel];
    
    password.leftView = leftView;
    password.leftViewMode = UITextFieldViewModeAlways;
    password.backgroundColor = [UIColor whiteColor];
    password.layer.cornerRadius = 3;
    password.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    password.layer.borderWidth = 0.5;
    [self.view addSubview:password];
    
    passwordRepeat = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, screenWidth-20, 44)];
    passwordRepeat.keyboardType = UIKeyboardTypePhonePad;
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 52, 44)];
    leftLabel.text = @"确认密码:";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [leftView addSubview:leftLabel];
    
    passwordRepeat.leftView = leftView;
    passwordRepeat.leftViewMode = UITextFieldViewModeAlways;
    passwordRepeat.backgroundColor = [UIColor whiteColor];
    passwordRepeat.layer.cornerRadius = 3;
    passwordRepeat.layer.borderColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:1].CGColor;
    passwordRepeat.layer.borderWidth = 0.5;
    [self.view addSubview:passwordRepeat];
    
    UILabel *passLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 123, screenWidth, 13)];
    passLabel.text = @"密码长度为6到30位，数字、字母、字符至少包括两种";
    passLabel.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    passLabel.font = [UIFont systemFontOfSize:12];
    passLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:passLabel];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 215, screenWidth-20, 42)];
    registerBtn.backgroundColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    registerBtn.layer.cornerRadius = 3;
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submit{
   // UIViewController *vc = [[RegisterThreeViewController alloc] init];
   // [self.navigationController pushViewController:vc animated:YES];
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
