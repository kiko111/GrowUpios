//
//  ClickButton.swift
//  growapp0308
//
//  Created by Arthur on 16/3/24.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ClickButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,backgroundColor:UIColor,text:String) {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
        self.setTitle(text, forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.layer.cornerRadius = 4
        
        
        
    }

}
