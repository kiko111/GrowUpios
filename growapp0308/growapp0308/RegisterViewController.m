//
//  RegisterViewController.m
//  OrgOnline
//
//  Created by zhengch on 16/3/2.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTwoViewController.h"
#import "AgreementViewController.h"

@interface RegisterViewController ()
{
    UITextField *phone;
    UITextField *valicode;
    UIButton *valicodeBtn;
    
    NSInteger seconds;
    
    UIButton *checkbox;
    UIImageView *checkboxView;
    NSInteger checkboxFlag;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    
    self.view.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    phone = [[UITextField alloc] initWithFrame:CGRectMake(10, 79, screenWidth-20, 44)];
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
    phone.layer.borderWidth = 0.5;
    [self.view addSubview:phone];
    
    valicode = [[UITextField alloc] initWithFrame:CGRectMake(10, 133, screenWidth*0.45, 44)];
    
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
    valicode.layer.borderWidth = 0.5;
    [self.view addSubview:valicode];
    
    valicodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-screenWidth*0.36-10, 133, screenWidth*0.36, 44)];
    valicodeBtn.backgroundColor = [UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1];
    valicodeBtn.layer.cornerRadius = 3;
    [valicodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [valicodeBtn setTitleColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1] forState:UIControlStateNormal];
    valicodeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [valicodeBtn addTarget:self action:@selector(getValicode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:valicodeBtn];
    
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(10, 187, 20, 20)];
    checkboxView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    checkboxView.image = [UIImage imageNamed:@"login-checkbox-selected"];
    [checkbox addSubview:checkboxView];
    
    checkboxFlag = 1;
    
    [self.view addSubview:checkbox];
    
    UILabel *agreementLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 193, 60, 11)];
    agreementLabel.text = @"已阅读并同意";
    agreementLabel.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    agreementLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:agreementLabel];
    
    UIButton *agreementBtn = [[UIButton alloc] initWithFrame:CGRectMake(98, 193, 100, 11)];
    agreementBtn.layer.cornerRadius = 3;
    agreementBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [agreementBtn setTitle:@"《365成长在线协议》" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1] forState:UIControlStateNormal];
    [agreementBtn addTarget:self action:@selector(agreementDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreementBtn];
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 232, screenWidth-20, 42)];
    registerBtn.backgroundColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    registerBtn.layer.cornerRadius = 3;
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [registerBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(doRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doRegister{
    UIViewController *vc = [[RegisterTwoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)agreementDetail{
    UIViewController *vc = [[AgreementViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)getValicode{
    //获取验证码
    
    //定时
    seconds = 20;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}

- (void)countDown:(NSTimer*)timer{
    if (seconds == 1) {
        seconds = 20;
        [timer invalidate];
        NSLog(@"meile");
        valicodeBtn.backgroundColor = [UIColor redColor];
    }
    else{
        seconds--;
        NSLog(@"%ld",seconds);
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
