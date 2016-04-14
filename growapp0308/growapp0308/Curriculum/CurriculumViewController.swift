//
//  CurriculumViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/8.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit
import Alamofire

class CurriculumViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NSURLSessionDataDelegate{
    

//    var config:NSURLSessionConfiguration!
//    var session:NSURLSession!
//    var task:NSURLSessionDataTask!
    private var curriculumDetailViewController = CurriculumDetailViewController()
    
    private var allTeacherViewController=AllteacherViewController()
    private var allOrgViewController=AllorgViewController()
    private var allCurriculumViewController=AllcurriculumViewController()
   
//    let img1 = ["org","teacher","class_subject","qa"]
//    let line1 = ["机构","老师","科目","问答"]
//    let headimg = ["head portrait_1","head portrait_2","head portrait_3","head portrait_4"]
//    let name = ["辉辉","鹏鹏","秋秋","井井"]
//    let classData = [["class1","让孩子变勇敢的秘诀","2015-12-26","直播课","¥250"],["class1","让孩子变聪明的秘诀","1250-12-26","直播课","¥250"],["class1","让孩子变厉害的秘诀","2501-12-26","直播课","¥250"]]
//    let org = ["logo","logo","logo","logo"]
    

    var banner:NSDictionary!
    var message:NSMutableArray! = []
    var bannerUrl:NSMutableArray = []
    
    var teacherId:NSMutableArray = []
    var teachYears:NSMutableArray = []
    var teacherImg1:NSMutableArray = []
    var teacherImg2:NSMutableArray = []
    var teacherName1:NSMutableArray = []
    var teacherName2:NSMutableArray = []
    
    var courseId:NSMutableArray = []
    var course1:NSMutableArray = []
    var course2:NSMutableArray = []
    
    var OrgId:NSMutableArray = []
    var orgImg1:NSMutableArray = []
    var orgImg2:NSMutableArray = []
    

    
    let img1 = ["org","teacher","class_subject","qa"]      //固定不变的图片
    let line1 = ["机构","老师","科目","问答"]                //也是相对固定的文字
    
    let headimg = ["head portrait_1","head portrait_2","head portrait_3","head portrait_4"]
    let name = ["辉辉","鹏鹏","秋秋","井井"]
    let classData = [["class1","让孩子变勇敢的秘诀","2015-12-26","直播课","¥250"],["class1","让孩子变聪明的秘诀","1250-12-26","直播课","¥250"],["class1","让孩子变厉害的秘诀","2501-12-26","直播课","¥250"]]
    let org = ["logo","logo","logo","logo"]
    
    
    
    let imgLast = ["searchTeacher","buyClass","dateClass","classCri"]
    let textLast = ["1.搜搜老师","2.购买课程","3.约课上课","4.课程评价"]
    
    
    func getData(httpRequestUrl:String){
        
        let request = Alamofire.request(.GET, httpRequestUrl)
        
        request.responseJSON { (json) -> Void in
            
    
            let jsonAll = json.result.value as? NSDictionary
          
            if jsonAll != nil {
                let curriculumTable:UITableView!
                curriculumTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-50), style: UITableViewStyle.Plain)
                curriculumTable.delegate = self
                curriculumTable.dataSource = self
                curriculumTable.sectionHeaderHeight = 0
                curriculumTable.separatorStyle = UITableViewCellSeparatorStyle.None
                curriculumTable.backgroundColor = UIColor.clearColor()
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
                self.view.addSubview(curriculumTable)
                curriculumTable.reloadData()
                self.banner = jsonAll?.objectForKey("course_banners") as? NSDictionary
                
//                print(self.navigationController?.automaticallyAdjustsScrollViewInsets)
                //bannerUrl赋值
                for (var i=0;i<self.banner.count;i++){
                    
                    self.bannerUrl.addObject(self.banner.objectForKey("course_home_banner\(i+1)")!)
                }
                
                //广告，消息  index0:是id  index1:title
                let messageDic = jsonAll?.objectForKey("course_mainpage_head") as? NSDictionary
                self.message.addObject((messageDic?.objectForKey("article_id"))!)
                self.message.addObject((messageDic?.objectForKey("article_title"))!)
                
                
                //推荐老师：－－－－－－－－－－－－－－－－－－－－－
                
                let recommendTeacher = jsonAll?.objectForKey("course_recommend_teachers") as? NSMutableArray
                
  

                let teacherImg : NSMutableArray = []
                let teacherName : NSMutableArray = []
                
               
                for singleUnit in recommendTeacher!
                {
                    self.teacherId.addObject(singleUnit.objectForKey("teacher_home_teacher_id")!)
                    self.teachYears.addObject(singleUnit.objectForKey("teacher_home_teach_year")!)
                    teacherName.addObject(singleUnit.objectForKey("teacher_home_teacher_name")!)
                    teacherImg.addObject(singleUnit.objectForKey("teacher_home_avatar")!)
                }
                for (var i=0;i<4;i++){
                    
                    self.teacherImg1.addObject(teacherImg[i])
                    self.teacherImg2.addObject(teacherImg[i+4])
                    
                    self.teacherName1.addObject(teacherName[i])
                    self.teacherName2.addObject(teacherName[i+4])
                    
                }
                
           
                //热门课程－－－－－－－－－－－－－－－－－－
                let hotCourse = jsonAll?.objectForKey("course_recommend_courses") as? NSMutableArray

                

                let classAll:NSMutableArray = []
                
                
                for singleUnit in hotCourse!
                {
                    let singleClass:NSMutableArray = []
                    
                    self.courseId.addObject(singleUnit.objectForKey("hotcourse_id")!)
                    singleClass.addObject(singleUnit.objectForKey("hotcourse_imgurl")!)
                    singleClass.addObject(singleUnit.objectForKey("hotcourse_name")!)
                    singleClass.addObject(singleUnit.objectForKey("hotcourse_time")!)
                    singleClass.addObject(singleUnit.objectForKey("hotcourse_courseTypeText")!)
                    singleClass.addObject(singleUnit.objectForKey("hotcourse_course_price")!)
                    
//                        singleClass.addObject(singleUnit.objectForKey("hotcourse_picture")!)
//                        singleClass.addObject(singleUnit.objectForKey("hotcourse_name")!)
//                        singleClass.addObject(singleUnit.objectForKey("hotcourse_course_created_at")!)
//                        singleClass.addObject(singleUnit.objectForKey("hotcourse_type")!)
//                        singleClass.addObject(singleUnit.objectForKey("hotcourse_course_price")!)
                    classAll.addObject(singleClass)
                    
                }
                
                for (var i=0;i<3;i++){
                    self.course1.addObject(classAll[i])
                    self.course2.addObject(classAll[i+3])
                }
                
                
                //热门机构－－－－－－－－－－－－－－－－－－－－－－－－－
//                let hotOrg = jsonAll?.objectForKey("institutions") as? NSMutableArray
                let hotOrg = jsonAll?.objectForKey("course_recommend_org") as? NSMutableArray
                
                let orgImg : NSMutableArray = []
                
                
                for singleUnit in hotOrg!
                {
                    
//                    self.OrgId.addObject(singleUnit.objectForKey("institution_id")!)
//                    orgImg.addObject(singleUnit.objectForKey("institution_picture")!)
                    self.OrgId.addObject(singleUnit.objectForKey("hotorg_id")!)
                    orgImg.addObject(singleUnit.objectForKey("hotorg_imgurl")!)
                    
                }
                for (var i=0;i<4;i++){
                    self.orgImg1.addObject(orgImg[i])
                    self.orgImg2.addObject(orgImg[i+4])
                }
                
            }
            
            
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.automaticallyAdjustsScrollViewInsets = true
        self.edgesForExtendedLayout = UIRectEdge.None
        
//        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.backgroundColor = BlueColor_0192F2
        getData("http://buptcnc.cn/rest/course_mainpage/testdata")
//         getData("http://inner.deepai.com:8880/rest/course_mainpage/?limit=6&teacher_limit=8&institution_limit=8")

        
//        getData("http://localhost:8080/rest/course_mainpage/testdata")
        
        
        

        self.navigationController?.navigationBar.barTintColor = BlueColor_0192F2
        
        let topbar = UIView(frame: CGRect(x: 15, y: 8, width: UIScreen.mainScreen().bounds.width-70, height: 30))
        topbar.backgroundColor = UIColor.whiteColor()
        topbar.layer.cornerRadius = 5
        let leftButton = UIButton(frame: CGRect(x: 20, y: 7, width: 40, height: 18))
        leftButton.setTitle("课程", forState: UIControlState.Normal)
        leftButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        let verticleLine = UILabel(frame: CGRect(x: CGRectGetMaxX(leftButton.frame)+10, y: 0, width: 1, height: 30))
        verticleLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        

        
        let searchBar = UISearchBar(frame: CGRect(x: CGRectGetMaxX(verticleLine.frame)+10, y: 1, width: topbar.bounds.width-CGRectGetMaxX(verticleLine.frame)-15, height: 28))
        searchBar.layer.borderColor = UIColor.whiteColor().CGColor
        searchBar.layer.borderWidth = 1
        searchBar.placeholder = "搜索课程、老师、机构"
        
        topbar.addSubview(leftButton)
        topbar.addSubview(verticleLine)
        topbar.addSubview(searchBar)
        
        
        //(应该把这个topbar单独写成一个uiview，直接写在这儿太占地方了，管他呢）
        
        self.navigationController?.navigationBar.addSubview(topbar)
        
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width:20,height: 30))
        rightButton.setBackgroundImage(UIImage(named: "book"), forState: .Normal)
        
        rightButton.addTarget(self, action: "inviteTeacher:", forControlEvents: UIControlEvents.TouchUpInside)
        let rightbtn = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightbtn
        
        
        

//        let curriculumTable:UITableView!
//        curriculumTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-50))
//        curriculumTable.delegate = self
//        curriculumTable.dataSource = self
//        curriculumTable.separatorStyle = UITableViewCellSeparatorStyle.None
//        curriculumTable.backgroundColor = UIColor.clearColor()
//        self.view.addSubview(curriculumTable)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
          }
    
    
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
            
        case 1:
            return 3
            
        case 2:
            return 3
            
        case 3:
            return 3
            
        case 4:
            return 2
            
        default:
            break
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if indexPath.section == 0 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section1ScrollViewCell") as? ScrollViewTableViewCell
            if cell == nil {
                cell = ScrollViewTableViewCell(style: .Default, reuseIdentifier: "section1ScrollViewCell",bannerUrlArray: self.bannerUrl,imgHeight: 160)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section1A") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section1A")
            }
    
//            let line = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 0.5))
//            line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
//            cell?.addSubview(line)
            cell?.fillData(line1,imgData: img1)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        if indexPath.section == 0 && indexPath.row == 2{
            var cell = tableView.dequeueReusableCellWithIdentifier("section1Last")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "section1ScrollViewCell")
            }
            let line = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 0.5))
            let line2 = UILabel(frame: CGRect(x: 0, y: 49, width: UIScreen.mainScreen().bounds.width, height: 0.5))
            line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)

            line2.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            let leftimg = UIImageView(frame: CGRect(x: 15, y: 15, width: 25, height: 25))
            
            
            
            leftimg.image = UIImage(named: "class_news")
            let text = UILabel(frame: CGRect(x: CGRectGetMaxX(leftimg.frame)+15, y:0, width: 250, height: 49))
            text.text = self.message[1] as? String
            text.font = UIFont.systemFontOfSize(15)
            
            text.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
            text.textAlignment = NSTextAlignment.Center
            
            cell?.addSubview(line)
            cell?.addSubview(line2)
            cell?.addSubview(leftimg)
            cell?.addSubview(text)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 1 && indexPath.row == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier("section2top") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "section2top")
            }
            cell?.leftText.text = "推荐老师"
            cell?.rightText.setTitle("全部老师", forState: .Normal)
            cell?.rightText.titleLabel?.font = UIFont(name: "ArialMT", size: 14)
            cell?.arrow?.image = UIImage(named: "arrow")
            cell?.rightText.addTarget(self, action: "allTeacher:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 1 && indexPath.row == 1{
            var cell = tableView.dequeueReusableCellWithIdentifier("section1A") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section1A")
                cell?.text1.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text2.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text3.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text4.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                
                cell?.text1.center.y = (cell?.text1.center.y)! - 5
                cell?.text2.center.y = (cell?.text2.center.y)! - 5
                cell?.text3.center.y = (cell?.text3.center.y)! - 5
                cell?.text4.center.y = (cell?.text4.center.y)! - 5
                
                
                
                
                let downText1 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text1.frame)!), y: 0, width: (cell?.text1.bounds.width)!, height: 18))
                let downText2 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text2.frame)!), y: 0, width: (cell?.text2.bounds.width)!, height: 18))
                let downText3 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text3.frame)!), y: 0, width: (cell?.text3.bounds.width)!, height: 18))
                let downText4 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text4.frame)!), y: 0, width: (cell?.text4.bounds.width)!, height: 18))
                
                downText1.center.y = (cell?.text1.center.y)! + 20
                downText2.center.y = (cell?.text2.center.y)! + 20
                downText3.center.y = (cell?.text3.center.y)! + 20
                downText4.center.y = (cell?.text4.center.y)! + 20
                
                downText1.font = UIFont(name: "ArialMT", size: 10)
                downText2.font = UIFont(name: "ArialMT", size: 10)
                downText3.font = UIFont(name: "ArialMT", size: 10)
                downText4.font = UIFont(name: "ArialMT", size: 10)
                
                downText1.layer.cornerRadius = 4
                downText2.layer.cornerRadius = 4
                downText3.layer.cornerRadius = 4
                downText4.layer.cornerRadius = 4
                
                downText1.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText2.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText3.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText4.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                
                downText1.layer.borderWidth = 1
                downText2.layer.borderWidth = 1
                downText3.layer.borderWidth = 1
                downText4.layer.borderWidth = 1
                
                downText1.text = "\(teachYears[0])年教龄"
                downText2.text = "\(teachYears[1])年教龄"
                downText3.text = "\(teachYears[2])年教龄"
                downText4.text = "\(teachYears[3])年教龄"
                
                downText1.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText2.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText3.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText4.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                
                
                downText1.textAlignment = NSTextAlignment.Center
                downText2.textAlignment = NSTextAlignment.Center
                downText3.textAlignment = NSTextAlignment.Center
                downText4.textAlignment = NSTextAlignment.Center
                
                
                
                cell?.text1.font = UIFont(name: "ArialMT", size: 14)
                cell?.text2.font = UIFont(name: "ArialMT", size: 14)
                cell?.text3.font = UIFont(name: "ArialMT", size: 14)
                cell?.text4.font = UIFont(name: "ArialMT", size: 14)
                
                
                cell?.fillOnlineData(self.teacherName1,imgData: self.teacherImg1)
                cell?.contentView.addSubview(downText1)
                cell?.contentView.addSubview(downText2)
                cell?.contentView.addSubview(downText3)
                cell?.contentView.addSubview(downText4)
                let buttomLine = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(downText1.frame)+8, width: UIScreen.mainScreen().bounds.width, height: 0.5))
                buttomLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
                cell?.addSubview(buttomLine)
               

            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
            
        if indexPath.section == 1 && indexPath.row == 2{
            var cell = tableView.dequeueReusableCellWithIdentifier("section1A") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section1A")
                cell?.text1.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text2.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text3.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                cell?.text4.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
                
                cell?.text1.center.y = (cell?.text1.center.y)! - 5
                cell?.text2.center.y = (cell?.text2.center.y)! - 5
                cell?.text3.center.y = (cell?.text3.center.y)! - 5
                cell?.text4.center.y = (cell?.text4.center.y)! - 5
                
                
                
                
                let downText1 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text1.frame)!), y: 0, width: (cell?.text1.bounds.width)!, height: 18))
                let downText2 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text2.frame)!), y: 0, width: (cell?.text2.bounds.width)!, height: 18))
                let downText3 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text3.frame)!), y: 0, width: (cell?.text3.bounds.width)!, height: 18))
                let downText4 = UILabel(frame: CGRect(x: CGRectGetMinX((cell?.text4.frame)!), y: 0, width: (cell?.text4.bounds.width)!, height: 18))
                
                downText1.center.y = (cell?.text1.center.y)! + 20
                downText2.center.y = (cell?.text2.center.y)! + 20
                downText3.center.y = (cell?.text3.center.y)! + 20
                downText4.center.y = (cell?.text4.center.y)! + 20
                
                downText1.font = UIFont(name: "ArialMT", size: 10)
                downText2.font = UIFont(name: "ArialMT", size: 10)
                downText3.font = UIFont(name: "ArialMT", size: 10)
                downText4.font = UIFont(name: "ArialMT", size: 10)
                
                downText1.layer.cornerRadius = 4
                downText2.layer.cornerRadius = 4
                downText3.layer.cornerRadius = 4
                downText4.layer.cornerRadius = 4
                
                downText1.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText2.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText3.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                downText4.layer.borderColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1).CGColor
                
                downText1.layer.borderWidth = 1
                downText2.layer.borderWidth = 1
                downText3.layer.borderWidth = 1
                downText4.layer.borderWidth = 1
                
                downText1.text = "\(teachYears[4])年教龄"
                downText2.text = "\(teachYears[5])年教龄"
                downText3.text = "\(teachYears[6])年教龄"
                downText4.text = "\(teachYears[7])年教龄"
                
                downText1.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText2.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText3.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                downText4.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
                
                
                downText1.textAlignment = NSTextAlignment.Center
                downText2.textAlignment = NSTextAlignment.Center
                downText3.textAlignment = NSTextAlignment.Center
                downText4.textAlignment = NSTextAlignment.Center
                
                
                
                cell?.text1.font = UIFont(name: "ArialMT", size: 14)
                cell?.text2.font = UIFont(name: "ArialMT", size: 14)
                cell?.text3.font = UIFont(name: "ArialMT", size: 14)
                cell?.text4.font = UIFont(name: "ArialMT", size: 14)
                
                
                cell?.fillOnlineData(self.teacherName2,imgData: self.teacherImg2)
                cell?.contentView.addSubview(downText1)
                cell?.contentView.addSubview(downText2)
                cell?.contentView.addSubview(downText3)
                cell?.contentView.addSubview(downText4)
                let buttomLine = UILabel(frame: CGRect(x: 0, y: 124.5, width: UIScreen.mainScreen().bounds.width, height: 0.5))
                buttomLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
                cell?.addSubview(buttomLine)

            }
            
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier("section2top") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "section2top")
            }
            cell?.leftText.text = "热门课程"
            cell?.rightText.setTitle("全部课程", forState: .Normal)
            cell?.rightText.titleLabel?.font = UIFont(name: "ArialMT", size: 14)
            cell?.arrow?.image = UIImage(named: "arrow")
            cell?.rightText.addTarget(self, action: "allClass:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 1{
            
            var cell = tableView.dequeueReusableCellWithIdentifier("section3Class") as? ClassTableViewCell
            if cell == nil {
                cell = ClassTableViewCell(style: .Default, reuseIdentifier: "section3Class")
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: "classViewClick:")
            tapGesture.numberOfTapsRequired = 1
            cell?.view1.addGestureRecognizer(tapGesture)
            
            
            
            
            cell?.fillOnlineData(course1)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            let buttomLine = UILabel(frame: CGRect(x: 0, y: 150, width: UIScreen.mainScreen().bounds.width, height: 0.5))
            buttomLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            
            cell?.addSubview(buttomLine)
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 2{
            var cell = tableView.dequeueReusableCellWithIdentifier("section3Class2") as? ClassTableViewCell
            if cell == nil {
                cell = ClassTableViewCell(style: .Default, reuseIdentifier: "section3Class2")
            }
            cell?.fillOnlineData(course2)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            let buttomLine = UILabel(frame: CGRect(x: 0, y: 149.5, width: UIScreen.mainScreen().bounds.width, height: 0.5))
            buttomLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            
            cell?.addSubview(buttomLine)
            return cell!
        }
        if indexPath.section == 3 && indexPath.row == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier("section3topp") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "section3topp")
            }
            cell?.leftText.text = "热门机构"
            cell?.rightText.setTitle("全部机构", forState: .Normal)
            cell?.rightText.titleLabel?.font = UIFont(name: "ArialMT", size: 14)
            cell?.arrow?.image = UIImage(named: "arrow")
            cell?.rightText.addTarget(self, action: "allOrg:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
            
        if indexPath.section == 3 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section3A") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section3A")
            }
            
            cell?.fillOnlineImg(orgImg1)
            cell?.text1.removeFromSuperview()
            cell?.text2.removeFromSuperview()
            cell?.text3.removeFromSuperview()
            cell?.text4.removeFromSuperview()
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 3 && indexPath.row == 2 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section3A2") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section3A2")
            }
            
            let line = UILabel(frame: CGRect(x: 0, y: 79.4, width: UIScreen.mainScreen().bounds.width, height: 0.5))
            line.backgroundColor =  UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            cell?.addSubview(line)
            cell?.fillOnlineImg(orgImg2)
            cell?.text1.removeFromSuperview()
            cell?.text2.removeFromSuperview()
            cell?.text3.removeFromSuperview()
            cell?.text4.removeFromSuperview()
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 4 && indexPath.row == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier("section4top") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "section4top")
            }
            cell?.leftText.text = "平台流程"
            cell?.rightText.removeFromSuperview()
            cell?.arrow.removeFromSuperview()
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 4 && indexPath.row == 1{
            var cell = tableView.dequeueReusableCellWithIdentifier("section4") as? ParallelTableViewCell
            if cell == nil {
                cell = ParallelTableViewCell(style: .Default, reuseIdentifier: "section4")
                
                cell?.label11.frame = CGRect(x: 20, y: 12, width:60 , height: 50)
                let distance:CGFloat = (UIScreen.mainScreen().bounds.width-40-4*(cell?.label11?.bounds.width)!)/3
                cell?.label12.frame = CGRect(x: CGRectGetMaxX((cell?.label11.frame)!)+distance, y: 12, width:60, height: 50)
                cell?.label13.frame = CGRect(x: CGRectGetMaxX((cell?.label12.frame)!)+distance, y:12, width:60, height: 50)

                cell?.label14.frame = CGRect(x: CGRectGetMaxX((cell?.label13.frame)!)+distance, y: 12, width:60, height: 50)
                
                let line = UILabel(frame: CGRect(x: 0, y: 72, width: UIScreen.mainScreen().bounds.width, height: 0.5))
                line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
                cell?.addSubview(line)

            }
            
            cell?.fillImg(imgLast)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!

        }


        else{
        return UITableViewCell()
        }
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return 160
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            return 110
        }
        if indexPath.section == 0 && indexPath.row == 2 {
            return 49.7
        }
            
        if indexPath.section == 1 && indexPath.row == 0 {
            return 38
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            return 125
        }
        if indexPath.section == 1 && indexPath.row == 2 {
            return 125
        }
        
        if indexPath.section == 2 && indexPath.row == 0 {
            return 38
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            return 150
        }
        if indexPath.section == 2 && indexPath.row == 2 {
            return 150
        }
            
        if indexPath.section == 3 && indexPath.row == 0 {
            return 38
        }
        if indexPath.section == 3 && indexPath.row == 1 {
            return 80
        }
        if indexPath.section == 3 && indexPath.row == 2 {
            return 80
        }
        if indexPath.section == 4 && indexPath.row == 0 {
            return 38
        }
        if indexPath.section == 4 && indexPath.row == 1 {
            return 72
        }
        else{
        return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(tableView.rectForRowAtIndexPath(indexPath))
    }


    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        switch section {
        case 0:return 0
        case 1:return 20
        case 2:return 20
        case 3:return 20
        case 4:return 20
        default:return 0
        }
    }
    
    
    
    func classViewClick(sender:UIGestureRecognizer){
        
        self.navigationController?.presentViewController(UINavigationController(rootViewController: curriculumDetailViewController), animated: true, completion: nil)
        
    }
    
    
    func allTeacher(sender:UIButton){
        
        
        self.navigationController?.presentViewController(UINavigationController(rootViewController: allTeacherViewController), animated: true, completion: nil)
        
    }
    func allClass(sender:UIButton){
        self.navigationController?.presentViewController(UINavigationController(rootViewController: allCurriculumViewController), animated: true, completion: nil)
        
        
    }
    func allOrg(sender:UIButton){
        
        self.navigationController?.presentViewController(UINavigationController(rootViewController: allOrgViewController), animated: true, completion: nil)

        
    }

    
}































































