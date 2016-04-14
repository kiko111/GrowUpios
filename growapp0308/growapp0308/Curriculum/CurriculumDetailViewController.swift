//
//  CurriculumDetailViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/15.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class CurriculumDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    let curriculumdata = ["让内向孩子变勇敢的秘诀","01月12日 8:20 开课 01月13日 17:30 节课","2小时","直播课","100"]
    let tabledata=["适合人群","4～15岁青少年儿童","教学目标","让孩子变的勇敢的秘诀","退课规则","开课前一小时","能否插班","随时可插班"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let img=UIImage(named: "backwhite")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        let allCurriculumTable:UITableView!
        allCurriculumTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        allCurriculumTable.delegate = self
        allCurriculumTable.dataSource = self
        allCurriculumTable.separatorStyle = UITableViewCellSeparatorStyle.None
        allCurriculumTable.backgroundColor = UIColor.clearColor()
        self.view.addSubview(allCurriculumTable)
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = BlueColor_0192F2
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(16)]
        
        
        self.navigationItem.title = "课程详情"
        self.view.backgroundColor = UIColor.whiteColor()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("topCoverCell")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "topCoverCell")
                let topimg = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 120))
                topimg.image = UIImage(named: "CD_cover")
                cell?.addSubview(topimg)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("curriculumtopDetail") as? CurriculumIntroTableViewCell
            if cell == nil {
                cell = CurriculumIntroTableViewCell(style: .Default, reuseIdentifier: "curriculumtopDetail")
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            cell?.filldata(curriculumdata)
            return cell!
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section2Bar")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "section2Bar")
                let text = UILabel(frame: CGRect(x: 20, y: 4, width: 120, height: 30))
                text.font = UIFont.systemFontOfSize(14)
                text.textColor = textColor_333333
                text.text = "老师介绍"
                let line = UILabel(frame: CGRect(x: 15, y: CGRectGetMaxY(text.frame)+4, width: UIScreen.mainScreen().bounds.width-15, height: 0.5))
                line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
                cell?.addSubview(text)
                cell?.addSubview(line)
            }
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        if indexPath.section == 2 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section3Bar")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "section3Bar")
                let text = UILabel(frame: CGRect(x: 20, y: 4, width: 120, height: 30))
                text.font = UIFont.systemFontOfSize(14)
                text.textColor = textColor_333333
                text.text = "课程简介"
                let line = UILabel(frame: CGRect(x: 15, y: CGRectGetMaxY(text.frame)+4, width: UIScreen.mainScreen().bounds.width-15, height: 0.5))
                line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
                cell?.addSubview(text)
                cell?.addSubview(line)
            }
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section3TableCell")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "section3TableCell")
                let table = CurriculumIntroView(frame: CGRect(x: 15, y: 15, width: ScreenWidth-30, height: 150), tabledata: tabledata)
                cell?.addSubview(table)
            }
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        if indexPath.section == 3 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("section4Bar")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "section4Bar")
                let text = UILabel(frame: CGRect(x: 20, y: 4, width: 120, height: 30))
                text.font = UIFont.systemFontOfSize(14)
                text.textColor = textColor_333333
                text.text = "课程大纲"
                cell?.addSubview(text)
                
            }
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        
        
        
        return UITableViewCell()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 1
        case 2: return 2
        case 3: return 1
        default:return 0
        }
      
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 120
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            return 148
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            return 40
        }
        if indexPath.section == 2 && indexPath.row == 0 {
            return 40
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            return 175
        }
        if indexPath.section == 3 && indexPath.row == 0 {
            return 40
        }
        return 0
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0:return 0
        case 1:return 10
        case 2:return 10
        case 3:return 10
        default:return 0
        }
        
    }
    
    func backbutton(sender:UIButton){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   
}
