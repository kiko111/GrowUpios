//
//  BaseInfoViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class BaseInfoViewController: UIViewController,UITextFieldDelegate {
    
    private var changeHeadView:UIView!
    private var realNameView:ImTeacherInputView!
    private var birthView:ImTeacherInputView!
    private var breifIntroduction:UITextField!
    private var education:ImTeacherInputView!
    private var school:ImTeacherInputView!
    private var mayor:ImTeacherInputView!
    
    
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
        self.navigationItem.title = "基本信息"
        
        let height:CGFloat = 15
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        changeHeadView = UIView(frame: CGRect(x: sideWidth_imTeacher, y: 10, width: ScreenWidth-sideWidth_imTeacher*2, height: 70))
        let headImg:UIImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 60, height: 60))
        headImg.image = UIImage(named: "headImg")
        changeHeadView.addSubview(headImg)
        let changeHeadButton:UIButton = UIButton(frame: CGRect(x: CGRectGetMaxX(headImg.frame)+height, y: 15, width: 100, height: 40))
        changeHeadButton.setTitle("更改头像", forState: .Normal)
        changeHeadButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        changeHeadView.backgroundColor = UIColor.whiteColor()
        changeHeadView.addSubview(changeHeadButton)
        
        realNameView = ImTeacherInputView(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(changeHeadView.frame)+height, width: ScreenWidth-sideWidth_imTeacher*2, height: 40), text1: "真实姓名:")
        
        let sex:UILabel = UILabel(frame: CGRect(x: sideWidth_imTeacher+8, y: CGRectGetMaxY(realNameView.frame)+10, width: 40, height: 40))
        sex.textAlignment = NSTextAlignment.Center
        sex.font = UIFont.systemFontOfSize(14)
        sex.textColor = UIColor.grayColor()
        sex.textAlignment = NSTextAlignment.Center
        sex.text = "性别:"
        
        birthView = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y:CGRectGetMaxY(sex.frame)+height, width: ScreenWidth-sideWidth_imTeacher*2, height: 40),text1: "出生年月:")
        birthView.TextFiled?.placeholder = "1990-09-26"
        
        breifIntroduction = UITextField(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(birthView.frame)+height, width:ScreenWidth-2*sideWidth_imTeacher , height: 180))
        breifIntroduction.backgroundColor = UIColor.whiteColor()
        breifIntroduction.placeholder = "一句话简介"
        breifIntroduction.delegate = self
        
        let myIdentity:UILabel = UILabel(frame: CGRect(x: sideWidth_imTeacher+8, y: CGRectGetMaxY(breifIntroduction.frame)+height, width: 70, height: 40))
        myIdentity.textAlignment = NSTextAlignment.Center
        myIdentity.font = UIFont.systemFontOfSize(14)
        myIdentity.textColor = UIColor.grayColor()
        myIdentity.textAlignment = NSTextAlignment.Center
        myIdentity.text = "我的身份:"
        
        education = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(myIdentity.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "学历:")
        
        school = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(education.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "毕业院校:")
        
        mayor = ImTeacherInputView.init(frame: CGRect(x: sideWidth_imTeacher, y: CGRectGetMaxY(school.frame)+height, width: ScreenWidth-2*sideWidth_imTeacher, height: 40), text1: "所学专业:")
       
        scrollView.contentSize = CGSize(width: ScreenWidth, height: CGRectGetMaxY(mayor.frame)+18)
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(changeHeadView)
        scrollView.addSubview(realNameView)
        scrollView.addSubview(sex)
        scrollView.addSubview(birthView)
        scrollView.addSubview(breifIntroduction)
        scrollView.addSubview(myIdentity)
        scrollView.addSubview(education)
        scrollView.addSubview(school)
        scrollView.addSubview(mayor)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    


   
}
