//
//  SHomeViewController.m
//  growapp0308
//
//  Created by zhengch on 16/3/16.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "SHomeViewController.h"
#import "HMSegmentedControl.h"
#import "SHome.h"
#import "STrace.h"
#import "SInfo.h"

@interface SHomeViewController ()
{
    NSInteger pageFlag;
    
    UITableView *bgTableView;
    
    HMSegmentedControl *segmentControl;
    
    NSMutableArray *data;
}
@end

@implementation SHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    bgTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    bgTableView.dataSource = self;
    bgTableView.delegate = self;
    bgTableView.bounces = NO;
    bgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //   bgTableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgTableView];
    
    data = [[NSMutableArray alloc] initWithObjects:@"",@"",@"", nil];
    
    pageFlag = 0;
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UIView *)configSegmentView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth,41)];
    view.backgroundColor = [UIColor whiteColor];
    segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"主页", @"学习轨迹", @"个人资料"]];
    segmentControl.frame = CGRectMake(0, 2, screenWidth, 39);
    segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    [segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, -7, 0, -8);
    segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    
    segmentControl.selectedSegmentIndex = pageFlag;
    
    segmentControl.selectionIndicatorHeight = 2;
    segmentControl.selectionIndicatorColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    
    segmentControl.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]};
    
    segmentControl.selectedTitleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1]};
    
    [view addSubview:segmentControl];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 165;
    }else if (indexPath.row == 1){
        return 41;
    }else{
        if(segmentControl.selectedSegmentIndex == 0){
            return 620;
        }else if (segmentControl.selectedSegmentIndex == 1){
            NSInteger itemCount = [(NSArray*)[data objectAtIndex:1] count];
            if (itemCount%3 == 0) {
                return itemCount/3*((screenWidth-45)/3*127/210+85)+10;
            }else{
                return (itemCount+3-itemCount%3)/3*((screenWidth-45)/3*127/210+85)+10;
            }
            
        }else{
            return 1026;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell.contentView addSubview:[self configTopImageView]];
    }else if (indexPath.row == 1){
        [cell.contentView addSubview:[self configSegmentView]];
    }
    else{
        if(segmentControl.selectedSegmentIndex == 0){
            SHome *view = [[SHome alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            [cell.contentView addSubview:view];
        }else if (segmentControl.selectedSegmentIndex == 1){
            
            
        }else{
            
        }
        
        cell.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    }
    
    return cell;
}

- (UIView *)configTopImageView{
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,screenWidth , 165)];
    topView.image = [UIImage imageNamed:@"sh-bg"];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth-58)/2, 60, 58, 58)];
    headView.image = [UIImage imageNamed:@"sh-portrait"];
    [topView addSubview:headView];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 128, screenWidth, 14)];
    name.text = @"刘敏";
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    name.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:name];
    
    UILabel *idLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 148, screenWidth, 12)];
    idLabel.text = @"ID:123456789";
    idLabel.font = [UIFont systemFontOfSize:14];
    idLabel.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    idLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:idLabel];
    
    return topView;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    
    NSInteger index = segmentedControl.selectedSegmentIndex;
    
    pageFlag = index;
    
    if ([[data objectAtIndex:index]  isEqual: @""] && index != 0) {
        NSString *url ;
        
        if(segmentControl.selectedSegmentIndex == 0){
            url = @"http://inner.deepai.com:8880/rest/teacher_course/6?course_limit=6";
        }else if (segmentControl.selectedSegmentIndex == 1){
            url = @"http://inner.deepai.com:8880/rest/teacher_course/6?course_limit=6";
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
            [manager GET:url parameters:@{} progress:^(NSProgress *progress){
                
            }success:^(NSURLSessionDataTask *task,id responseObject){
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    id dataRecv = [responseObject objectForKey:@"teacherCourse"];
                    
                    [data replaceObjectAtIndex:index withObject:dataRecv];
                    
                    NSIndexPath * indexPath =  [NSIndexPath indexPathForRow:0 inSection:1];
                    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
                    [bgTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
                }
                
            }failure:^(NSURLSessionDataTask *task,NSError *error){
                NSLog(@"error==%@",error);
            }];
        }else if (segmentControl.selectedSegmentIndex == 2){
            // url = @"http://10.104.4.135/rest/teacher_course/6?course_limit=6";
            NSString *dataPlist = [[NSBundle mainBundle] pathForResource:@"teacherpagedata" ofType:@"plist"];
            NSDictionary *dataAll = [[NSDictionary alloc] initWithContentsOfFile:dataPlist] ;
            
            [data replaceObjectAtIndex:index withObject:[dataAll objectForKey:@"photo"]];
            
            NSIndexPath * indexPath =  [NSIndexPath indexPathForRow:0 inSection:1];
            NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
            [bgTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        }else{
            // url = @"http://10.104.4.135/rest/teacher_course/6?course_limit=6";
        }
        
        /*      AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
         manager.responseSerializer = [AFJSONResponseSerializer serializer];
         manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
         [manager GET:url parameters:@{} progress:^(NSProgress *progress){
         
         }success:^(NSURLSessionDataTask *task,id responseObject){
         if ([responseObject isKindOfClass:[NSDictionary class]]) {
         id dataRecv = [responseObject objectForKey:@"teacherCourse"];
         
         [data replaceObjectAtIndex:index withObject:dataRecv];
         
         NSIndexPath * indexPath =  [NSIndexPath indexPathForRow:0 inSection:1];
         NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
         [bgTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
         }
         
         }failure:^(NSURLSessionDataTask *task,NSError *error){
         NSLog(@"error==%@",error);
         }];
         */
    }else{
        NSIndexPath * indexPath =  [NSIndexPath indexPathForRow:0 inSection:1];
        NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
        [bgTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
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
