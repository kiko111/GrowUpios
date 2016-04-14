//
//  AllteacherViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllteacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private var personalInfoViewController = PersonalInfoViewController()
    private var goodsViewController = GoodsViewController()
    
    let teacherInfoArray = [["allteacher","刘敏","心理辅导－心理学","面对脆弱,成长自我","北京市－海淀区","未来之星教育","12","10"],["allteacher","刘敏","心理辅导－心理学","面对脆弱,成长自我","北京市－海淀区","","12","10"],["allteacher","刘敏","心理辅导－心理学","面对脆弱,成长自我","北京市－海淀区","未来之星教育","12","10"],["allteacher","刘敏","心理辅导－心理学","面对脆弱,成长自我","北京市－海淀区","未来之星教育","12","10"]]
    
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
        
        
        self.navigationItem.title = "全部老师"
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
        var cell = tableView.dequeueReusableCellWithIdentifier("allTeacherCell") as? AllTeacherViewCell
        
        if cell == nil{
            cell = AllTeacherViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "allTeacherCell")
        }
        cell?.filldata(teacherInfoArray[indexPath.row])
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teacherInfoArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(personalInfoViewController, animated: true)
        }
        if indexPath.row == 1{
            self.navigationController?.pushViewController(goodsViewController, animated: true)
        }
        if indexPath.row == 2{
            self.navigationController?.pushViewController(goodsViewController, animated: true)
        }
    }
}
