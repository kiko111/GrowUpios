//
//  HomePageViewController.m
//  growapp0308
//
//  Created by zhengch on 16/3/8.
//  Copyright © 2016年 kiko. All rights reserved.
//

#import "HomePageViewController.h"
#import "HMSegmentedControl.h"
#import "THomePageView.h"
#import "TCourseView.h"
#import "TPhotoView.h"
#import "TVideoView.h"
#import "TArticleView.h"
#import "TEvaluateView.h"

@interface HomePageViewController ()
{
    NSMutableArray *pageFlags;
    
    UITableView *bgTableView;
    
    HMSegmentedControl *segmentControl;
    
    NSMutableArray *data;
}

@end

@implementation HomePageViewController

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
    
    data = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"", nil];
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 46;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth,46)];
    view.backgroundColor = [UIColor whiteColor];
    segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"主页", @"课程", @"相册",@"视频",@"文章",@"评价"]];
    segmentControl.frame = CGRectMake(0, 9, screenWidth, 37);
    segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    [segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 9);
    segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    
    segmentControl.selectionIndicatorHeight = 2;
    segmentControl.selectionIndicatorColor = [UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1];
    
    segmentControl.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]};
    
    segmentControl.selectedTitleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:1.0f/255.0f green:146.0f/255.0f blue:242.0f/255.0f alpha:1]};
    
    [view addSubview:segmentControl];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 210;
    }else{
        if(segmentControl.selectedSegmentIndex == 0){
            return 1052;
        }else if (segmentControl.selectedSegmentIndex == 1){
            NSInteger itemCount = [(NSArray*)[data objectAtIndex:1] count];
            if (itemCount%3 == 0) {
                return itemCount/3*((screenWidth-45)/3*127/210+85)+10;
            }else{
                return (itemCount+3-itemCount%3)/3*((screenWidth-45)/3*127/210+85)+10;
            }
            
        }else if (segmentControl.selectedSegmentIndex == 2){
            NSInteger itemCount = [(NSArray*)[data objectAtIndex:2] count];
            
            if (itemCount%3 == 0) {
                return itemCount/3*((screenWidth-45)/3*127/210+51)+10;
            }else{
                return (itemCount+3-itemCount%3)/3*((screenWidth-45)/3*127/210+51)+10;
            }
        }else if (segmentControl.selectedSegmentIndex == 3){
            NSInteger itemCount = [(NSArray*)[data objectAtIndex:3] count];
            
            if (itemCount%3 == 0) {
                return itemCount/3*((screenWidth-45)/3*127/210+51)+10;
            }else{
                return (itemCount+3-itemCount%3)/3*((screenWidth-45)/3*127/210+51)+10;
            }
        }else if (segmentControl.selectedSegmentIndex == 4){
            NSInteger itemCount = [(NSArray*)[data objectAtIndex:4] count];
            return itemCount*143+10;
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
    
    if (indexPath.section == 0) {
        [cell.contentView addSubview:[self configTopImageView]];
    }
    else{
        if(segmentControl.selectedSegmentIndex == 0){
            THomePageView *view = [[THomePageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            [cell.contentView addSubview:view];
        }else if (segmentControl.selectedSegmentIndex == 1){
            TCourseView *view = [[TCourseView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            view.data = [data objectAtIndex:1];
        
            [cell.contentView addSubview:view];
            
        }else if (segmentControl.selectedSegmentIndex == 2){
            TPhotoView *view = [[TPhotoView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            view.data = [data objectAtIndex:2];
            
            [cell.contentView addSubview:view];
        }else if (segmentControl.selectedSegmentIndex == 3){
            TVideoView *view = [[TVideoView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            view.data = [data objectAtIndex:3];
            
            [cell.contentView addSubview:view];
        }else if (segmentControl.selectedSegmentIndex == 4){
            TArticleView *view = [[TArticleView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, [tableView rectForRowAtIndexPath:indexPath].size.height)];
            view.data = [data objectAtIndex:4];
            
            [cell.contentView addSubview:view];
        }else{
            
        }
        
        cell.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:242.0f/255.0f blue:247.0f/255.0f alpha:1];
    }
    
    return cell;
}

- (UIView *)configTopImageView{
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,screenWidth , 210)];
    topView.image = [UIImage imageNamed:@"th-head-bg"];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth-75)/2, 55, 75, 75)];
    headView.image = [UIImage imageNamed:@"th-headportrait"];
    [topView addSubview:headView];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, screenWidth, 14)];
    name.text = @"刘敏";
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    name.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:name];
    
    UILabel *area = [[UILabel alloc] initWithFrame:CGRectMake(0, 164, screenWidth, 12)];
    area.text = @"北京市-海淀区";
    area.font = [UIFont systemFontOfSize:12];
    area.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    area.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:area];
    
    UILabel *brief = [[UILabel alloc] initWithFrame:CGRectMake(0, 191, screenWidth, 13)];
    brief.text = @"简介：只有不断学习，才能遇见更好的自己";
    brief.font = [UIFont systemFontOfSize:13];
    brief.textColor = [UIColor colorWithRed:117.0f/255.0f green:115.0f/255.0f blue:113.0f/255.0f alpha:1];
    brief.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:brief];
    
    return topView;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    
    NSInteger index = segmentedControl.selectedSegmentIndex;
    
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
        }else if (segmentControl.selectedSegmentIndex == 3){
           // url = @"http://10.104.4.135/rest/teacher_course/6?course_limit=6";
            NSString *dataPlist = [[NSBundle mainBundle] pathForResource:@"teacherpagedata" ofType:@"plist"];
            NSDictionary *dataAll = [[NSDictionary alloc] initWithContentsOfFile:dataPlist] ;
            
            [data replaceObjectAtIndex:index withObject:[dataAll objectForKey:@"video"]];
            
            NSIndexPath * indexPath =  [NSIndexPath indexPathForRow:0 inSection:1];
            NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
            [bgTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        }else if (segmentControl.selectedSegmentIndex == 4){
           // url = @"http://10.104.4.135/rest/teacher_course/6?course_limit=6";
            NSString *dataPlist = [[NSBundle mainBundle] pathForResource:@"teacherpagedata" ofType:@"plist"];
            NSDictionary *dataAll = [[NSDictionary alloc] initWithContentsOfFile:dataPlist] ;
            
            [data replaceObjectAtIndex:index withObject:[dataAll objectForKey:@"article"]];
            
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

- (void)scrollViewDidScroll:(UIScrollView *)sscrollView{
//    if (sscrollView.contentOffset.y > 250) {
//        TPhotoView *view = (TPhotoView *)currentView;
//        view.cv.userInteractionEnabled = YES;
//    }
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
