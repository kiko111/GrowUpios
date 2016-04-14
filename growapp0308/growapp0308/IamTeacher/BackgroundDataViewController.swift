//
//  BackgroundDataViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class BackgroundDataViewController: UIViewController {

    private var teachYear:ImTeacherInputView!
//    private var belong:ImTeacherInputView!
    private var belong:UITextField!
    private var tag:ImTeacherInputView!
    
    
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
        self.navigationItem.title = "背景资料"
        
        let height:CGFloat = 15
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        teachYear = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: 10, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "教龄:")
        
//        belong = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(teachYear.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "毕业院校:")
        belong = UITextField(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(teachYear.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40))
        belong.layer.borderColor = GrayColor_E2E2E2.CGColor
        belong.layer.borderWidth = 0.7
        belong.layer.cornerRadius = 4
        belong.backgroundColor = UIColor.whiteColor()
        belong.font = UIFont.systemFontOfSize(14)
        belong.placeholder = "单位/机构/学校"
        
//        tag = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(belong.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 150), text1: "个人标签:")
//        tag.leftText = UILabel(frame: CGRect(x: 10, y: 5, width: ScreenWidth-100, height: 30))
//        tag.TextFiled = UITextField(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY((tag.leftText?.frame)!)+10, width: ScreenWidth-2*sideWidth_imTeacher, height: 110))
//        tag.TextFiled?.layer.borderColor = UIColor.redColor().CGColor
//        tag.TextFiled?.layer.borderWidth = 1
        
        
        let tagView:UIView = UIView(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(belong.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 150))
        let leftText = UILabel(frame: CGRect(x: 10, y: 5, width: ScreenWidth-100, height: 30))
        let TextFiled = UITextField(frame: CGRect(x: sideWidth_imTeacher-4, y: 30, width: ScreenWidth-4*sideWidth_imTeacher, height:30))
        tagView.layer.borderColor = GrayColor_E2E2E2.CGColor
        tagView.backgroundColor = UIColor.whiteColor()
        tagView.layer.borderWidth = 0.7
        tagView.layer.cornerRadius = 4
        leftText.text = "个人标签："
        leftText.font = UIFont.systemFontOfSize(13)
        leftText.textColor = UIColor.grayColor()
        TextFiled.font = UIFont.systemFontOfSize(13)
        tagView.addSubview(leftText)
        tagView.addSubview(TextFiled)
        

        let tipsLabel:UILabel = UILabel(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(tagView.frame)+10, width: ScreenWidth-2*sideWidth_imTeacher, height: 45))
        tipsLabel.font = UIFont.systemFontOfSize(11.2)
        tipsLabel.textColor = UIColor.grayColor()
        tipsLabel.numberOfLines = 0
        let tipsword = "标签的准确性比数量更重要，请将单个标签控制在7字以内（标签仅限使用字母、数字、汉字，且最多输入20个），空格隔开；"
        let tipText = NSMutableAttributedString.init(string: tipsword)
//        tipText.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSMakeRange(0, 22))
//        tipText.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(22, 23))
        tipsLabel.attributedText = tipText
        
        scrollView.contentSize = CGSize(width: ScreenWidth, height: CGRectGetMaxY(tipsLabel.frame)+20)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(teachYear)
        scrollView.addSubview(belong)
        scrollView.addSubview(tagView)
        scrollView.addSubview(tipsLabel)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }

   
}
