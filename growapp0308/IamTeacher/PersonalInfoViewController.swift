//
//  PersonalInfoViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    private var baseInfoViewController = BaseInfoViewController()
    private var backgroundDataViewController = BackgroundDataViewController()
    private var pastExperienceViewController = PastExperienceViewController()
    private var shareViewController = ShareViewController()
    private var myPhotoViewController = MyphotoViewController()
    
    
    
    let tableData = [["基本信息","背景资料"],["过往经历","成果分享","我的照片"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GrayColor_F1F2F7
        self.navigationItem.title = "个人资料"
        
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
      
        let personalDataTable:UITableView!
        personalDataTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        personalDataTable.delegate = self
        personalDataTable.dataSource = self
        personalDataTable.separatorStyle = UITableViewCellSeparatorStyle.None
        personalDataTable.backgroundColor = UIColor.clearColor()
        self.view.addSubview(personalDataTable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("personalDataCell")
        if cell == nil{
            
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "AllclassTableViewCell")
        
        
        }
        cell?.textLabel?.text = tableData[indexPath.section][indexPath.row]
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!

    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:return 2
        case 1:return 3
        default:return 0
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerVIew:UIView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 20))
        headerVIew.backgroundColor = GrayColor_F1F2F7
        return headerVIew
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.navigationController?.pushViewController(baseInfoViewController, animated: true)
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            self.navigationController?.pushViewController(backgroundDataViewController, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            self.navigationController?.pushViewController(pastExperienceViewController, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            self.navigationController?.pushViewController(shareViewController, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 2 {
            self.navigationController?.pushViewController(myPhotoViewController, animated: true)
        }
        
    }
    
    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
