//
//  LoginViewController.m
//  OrgOnline
//
//  Created by zhengch on 16/3/1.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPassViewController.h"

#define screenWidth ([UIScreen mainScreen].bounds.size.width)
#define screenHeight ([UIScreen mainScreen].bounds.size.height)

@interface LoginViewController ()
{
    UITextField *username;
    UITextField *password;
    UIButton *submiteBtn;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth-84)/2, 105, 84, 84)];
    logoView.image = [UIImage imageNamed:@"login-logo"];
    [self.view addSubview:logoView];
    
    UIView *loginForm = [[UIView alloc] initWithFrame:CGRectMake(0, 219, screenWidth, 100.5)];
    loginForm.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginForm];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 50, screenWidth, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:226.0f/255.0f green:226.0f/255.0f blue:226.0f/255.0f alpha:0.6];
    [loginForm addSubview:line];
    
    UIImageView *phoneView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 26, 21)];
    phoneView.image = [UIImage imageNamed:@"login-phone"];
    [loginForm addSubview:phoneView];
    
    username = [[UITextField alloc] initWithFrame:CGRectMake(66, 15, screenWidth-96, 21)];
    username.clearButtonMode = UITextFieldViewModeAlways;
    [loginForm addSubview:username];
    
    UIImageView *passwordView = [[UIImageView alloc] initWithFrame:CGRectMake(30.5, 65.5, 25.5, 21)];
    passwordView.image = [UIImage imageNamed:@"login-password"];
    [loginForm addSubview:passwordView];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(66, 65.5, screenWidth-96, 21)];
    password.secureTextEntry = true;
    password.clearButtonMode = UITextFieldViewModeAlways;
    [loginForm addSubview:password];

    
    submiteBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 335, screenWidth-20, 42)];
    submiteBtn.backgroundColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    submiteBtn.layer.cornerRadius = 3;
    submiteBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [submiteBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [submiteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submiteBtn addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submiteBtn];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 392, 52, 14)];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [registerBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    UIButton *forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-80, 392, 52, 14)];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgetBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetPass) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)doLogin{
    NSString *usernameText = username.text;
    NSString *passwordText = password.text;
    NSLog(@"%@===%@",usernameText,passwordText);
}

- (void)doRegister{
    UIViewController *vc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)forgetPass{
    UIViewController *vc = [[ForgetPassViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
