//
//  PlaceholderTextfiled.swift
//  growapp0308
//
//  Created by Arthur on 16/3/14.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class PlaceholderTextfiled: UIView {

    var topText:UILabel?
    var TextFiled:UITextField?
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    init(frame:CGRect, topString:String){
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        topText = UILabel(frame: CGRect(x: 10, y: 5, width: topString.characters.count*14, height: 30))
        topText?.textAlignment = NSTextAlignment.Left
        topText?.text = topString
        
        TextFiled = UITextField(frame: CGRect(x: sideWidth_imTeacher-4, y: 30, width: frame.width-30, height: 40))
        TextFiled?.font = UIFont.systemFontOfSize(14)
        
        
        topText?.font = UIFont.systemFontOfSize(13)
        topText?.textColor = UIColor.grayColor()
        
        
        self.layer.borderColor = GrayColor_E2E2E2.CGColor
        self.layer.borderWidth = 0.7
        self.layer.cornerRadius = 4
        
        self.addSubview(topText!)
        self.addSubview(TextFiled!)
    }
    
    init(frame:CGRect, topString:String,textfieldString:String){
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        
        TextFiled = UITextField(frame: CGRect(x: sideWidth_imTeacher, y:10, width: frame.width-30, height: 40))
        TextFiled?.font = UIFont.systemFontOfSize(14)
        
        TextFiled?.placeholder = textfieldString
        
        
        
        self.layer.borderColor = GrayColor_E2E2E2.CGColor
        self.layer.borderWidth = 0.7
        self.layer.cornerRadius = 4
        
        
        self.addSubview(TextFiled!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
