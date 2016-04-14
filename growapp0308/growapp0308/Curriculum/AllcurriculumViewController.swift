//
//  AllcurriculumViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllcurriculumViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let allCurriculum = [["allCurriculum","让内向孩子变勇敢的秘诀","英语词汇大串讲的录制视频","6-7岁","5","1","100"],["allCurriculum","让内向孩子变勇敢的秘诀","01月12日 8:20开课 01月13日 17:30结课","北京市昌平区二波子新村北京人家","6-9岁","2","100"],["allCurriculum","让内向孩子变勇敢的秘诀","01月12日 8:20开课 01月13日 17:30结课","北京市昌平区二波子新村北京人家","6-9岁","3","100"],["allCurriculum","让内向孩子变勇敢的秘诀","01月12日 8:20开课 01月13日 17:30结课","24","0/20","4","100"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let img=UIImage(named: "backblue")
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
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1),NSFontAttributeName:UIFont.systemFontOfSize(16)]
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1),NSFontAttributeName:UIFont.fontNamesForFamilyName("ArialMT")]
        
        
        self.navigationItem.title = "全部课程"
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func backbutton(sender:UIButton){
        //        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("allCurriculumCell") as? AllclassTableViewCell
        
        if cell == nil{
            cell = AllclassTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "allCurriculumCell")
        }
        cell?.filldata(allCurriculum[indexPath.row])
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCurriculum.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    


}
