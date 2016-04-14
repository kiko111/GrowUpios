//
//  ShareViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    private var projectName:PlaceholderTextfiled!
    private var dateView:ImTeacherInputView!
    private var projectDesc:PlaceholderTextfiled!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView:UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width:40,height: 30))
        rightButton.setTitle("保存", forState: .Normal)
        rightButton.setTitleColor(BlueColor_0192F2, forState: .Normal)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(14.5)
        
        rightButton.addTarget(self, action: "save:", forControlEvents: UIControlEvents.TouchUpInside)
        let rightbtn = UIBarButtonItem.init(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightbtn
        
        
        self.view.backgroundColor = GrayColor_F1F2F7
        self.navigationItem.title = "成果分享"
        
        let height:CGFloat = 15
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        projectName = PlaceholderTextfiled.init(frame: CGRect(x: sideWidth_imTeacher, y: 10, width: ScreenWidth-2*sideWidth_imTeacher, height: 80), topString: "成果名称:")
        
        dateView = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y:CGRectGetMaxY(projectName.frame)+height, width: ScreenWidth-sideWidth_imTeacher*2, height: 40),text1: "日期:")
        dateView.TextFiled?.placeholder = "2016-10"

        
        
        
        projectDesc = PlaceholderTextfiled.init(frame: CGRect(x: sideWidth_imTeacher, y:CGRectGetMaxY(dateView.frame)+height, width: ScreenWidth-sideWidth_imTeacher*2, height: 150), topString: "", textfieldString: "描述你的成果")
        let tips = UILabel(frame: CGRect(x: sideWidth_imTeacher, y:CGRectGetMaxY(projectDesc.frame)+6, width: ScreenWidth-sideWidth_imTeacher*2, height: 40))
        print(CGRectGetMaxY(projectDesc.frame))
        tips.text = "详细的成果描述有助于学生更加了解您，提高约课率。"
        tips.textColor = UIColor.grayColor()
        tips.font = UIFont.systemFontOfSize(11)
        
        scrollView.addSubview(projectName)
        scrollView.addSubview(dateView)
        scrollView.addSubview(projectDesc)
        scrollView.addSubview(tips)
        self.view.addSubview(scrollView)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         
    }
    
    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    



}
