//
//  IamStudentViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/4/12.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class IamStudentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GrayColor_F1F2F7
        self.navigationItem.title = "我是学生"

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
    

}
