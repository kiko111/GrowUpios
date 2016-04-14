//
//  MeBaseView.m
//  OrgOnline
//
//  Created by kiko on 16/3/2.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MeBaseView.h"

@interface MeBaseView (){
  UIImageView *navBarHairlineImageView;
}
@end

@implementation MeBaseView

- (void)viewDidLoad {
    
    //self.view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight*2)];
    
   // navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
   // navBarHairlineImageView.hidden = YES;
    
    //self.view.backgroundColor = [UIColor colorWithRed:244.0f/255.0f green:245.0f/255.0f blue:247.0f/255.0f alpha:1];
    
    //self.navigationController.navigationBar.translucent = YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void) viewDidLoadBlue{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 11, 22)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"arrowleft"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = left;
    
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20], NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
}

- (void)viewDidLoadWhite{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    UIButton *backbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 7.5, 13.5)];
    [backbtn setBackgroundImage:[UIImage imageNamed:@"backbluee"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = left;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20], NSFontAttributeName,nil]];
    
    
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}@end
