//
//  ImTeacherInputView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ImTeacherInputView: UIView {
    
     var leftText:UILabel?
     var TextFiled:UITextField?
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    init(frame:CGRect,text1:String){
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        
        leftText = UILabel(frame: CGRect(x: 10, y: 5, width: text1.characters.count*14, height: 30))
        leftText?.textAlignment = NSTextAlignment.Left
        leftText?.text = text1
        TextFiled = UITextField(frame: CGRect(x: CGRectGetMaxX(leftText!.frame), y: 0, width: frame.width-CGRectGetMaxX(leftText!.frame)-30, height: frame.height))
        TextFiled?.font = UIFont.systemFontOfSize(14)
     
        
        leftText?.font = UIFont.systemFontOfSize(13)
//        leftText?.textColor = UIColor(red: 3/255, green: 3/255, blue: 3/255, alpha: 1)
        leftText?.textColor = UIColor.grayColor()
        
        
        self.layer.borderColor = GrayColor_E2E2E2.CGColor
        self.layer.borderWidth = 0.7
        self.layer.cornerRadius = 4
        
        self.addSubview(leftText!)
        self.addSubview(TextFiled!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
