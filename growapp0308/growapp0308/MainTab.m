//
//  MainTab.m
//  OrgOnline
//
//  Created by kiko on 16/3/2.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "MainTab.h"

@interface MainTab ()

@end

@implementation MainTab

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBar *tabBar = self.tabBar;
    
    tabBar.contentMode = UIViewContentModeScaleAspectFill;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
     UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];

    
//    
//       tabBarItem1.image =[self reSizeImage:[UIImage imageNamed:@"news"] toSize:CGSizeMake(32, 32)];
//       tabBarItem2.image =[self reSizeImage:[UIImage imageNamed:@"teacher"] toSize:CGSizeMake(32, 32)];
//       tabBarItem3.image =[self reSizeImage:[UIImage imageNamed:@"course"] toSize:CGSizeMake(32, 32)];
//       tabBarItem4.image =[self reSizeImage:[UIImage imageNamed:@"me"] toSize:CGSizeMake(32, 32)];
//     //  tabBarItem5.image =[self reSizeImage:[UIImage imageNamed:@"设置2"] toSize:CGSizeMake(30, 30)];
    
    tabBarItem1.image =[UIImage imageNamed:@"home"];
    tabBarItem2.image =[UIImage imageNamed:@"mall"];
    tabBarItem3.image =[UIImage imageNamed:@"course"];
    tabBarItem4.image =[UIImage imageNamed:@"qatab"];
    tabBarItem5.image =[UIImage imageNamed:@"my"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
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
