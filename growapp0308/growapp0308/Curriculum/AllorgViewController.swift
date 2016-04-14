//
//  AllorgViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllorgViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let orgData = [["allorg","喵喵教育","学习时一种能力，用心呵护宝宝的艺术学习的过程，以及编不下去了","10","北京市昌平区回龙观北京人家 A栋 302","喵喵教育","1","学校"],["allorg","喵喵教育","学习时一种能力，用心呵护宝宝的艺术学习的过程，以及编不下去了","10","北京市昌平区回龙观北京人家 A栋 302","喵喵教育","2","学校"],["allorg","喵喵教育","学习时一种能力，用心呵护宝宝的艺术学习的过程，以及编不下去了","10","北京市昌平区回龙观北京人家 A栋 302","喵喵教育","3","学校"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let allTeacherTable:UITableView!
        allTeacherTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        allTeacherTable.delegate = self
        allTeacherTable.dataSource = self
        allTeacherTable.separatorStyle = UITableViewCellSeparatorStyle.None
        allTeacherTable.backgroundColor = UIColor.clearColor()
        self.view.addSubview(allTeacherTable)
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1),NSFontAttributeName:UIFont.systemFontOfSize(16)]
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1),NSFontAttributeName:UIFont.fontNamesForFamilyName("ArialMT")]
        
        
        self.navigationItem.title = "全部机构"
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
        var cell = tableView.dequeueReusableCellWithIdentifier("allOrgCell") as? AllorgTableViewCell
        
        if cell == nil{
            cell = AllorgTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "allOrgCell")
        }
        cell?.filldata(orgData[indexPath.row])
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orgData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 135
    }


}
