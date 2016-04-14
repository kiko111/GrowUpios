//
//  PastExperienceViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class PastExperienceViewController: UIViewController {

    private var startTime:ImTeacherInputView!
    private var endTime:ImTeacherInputView!
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
        self.navigationItem.title = "过往经历"
        
        let height:CGFloat = 15
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        startTime = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: height-5, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "开始时间:")
        endTime = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(startTime.frame), width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "结束时间:")
        let textfield = UITextField(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(endTime.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 150))
        textfield.backgroundColor = UIColor.whiteColor()
        textfield.layer.borderColor = GrayColor_E2E2E2.CGColor
        textfield.layer.borderWidth = 0.7
        textfield.layer.cornerRadius = 4
        textfield.placeholder = "描述过往经历"
       
        let tips = UILabel(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(textfield.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40))
        tips.textColor = UIColor.grayColor()
        tips.font = UIFont.systemFontOfSize(12)
        tips.text = "详细描述你的教学经历、学习经历、工作经历等，有助于学生更好的了解你！"
        tips.numberOfLines = 0
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(startTime)
        scrollView.addSubview(endTime)
        scrollView.addSubview(textfield)
        scrollView.addSubview(tips)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
 
}
