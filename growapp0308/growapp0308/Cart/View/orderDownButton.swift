//
//  orderDownButton.swift
//  growapp0308
//
//  Created by Arthur on 16/4/1.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class orderDownButton: UIView {

    var rightButton:ClickButton!
    var leftprice:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(frame:CGRect,data:String){
        super.init(frame: frame)
        let leftView = UIView(frame:CGRect(x: 0, y: 0, width: 2*frame.width/3, height: frame.height))
        rightButton  = ClickButton(frame: CGRect(x: 2*frame.width/3, y: 0, width: frame.width/3, height: frame.height),backgroundColor:BlueColor_0192F2,text:"提交订单")
        rightButton.layer.cornerRadius = 0
    
        
        leftView.backgroundColor = UIColor.whiteColor()
        leftView.layer.borderColor = GrayColor_E2E2E2.CGColor
        leftView.layer.borderWidth = 0.7
        
        let leftlabel = UILabel(frame: CGRect	(x: 80, y: 19, width: 60, height: 20))
        leftlabel.text = "总计:"
        leftlabel.textColor = textColor_333333
        leftlabel.font = UIFont.systemFontOfSize(18)

        
        leftprice = UILabel(frame: CGRect(x: leftlabel.frame.maxX, y: 19, width: 60, height: 20))
        leftprice.textColor = BlueColor_0192F2
        leftprice.text = data
        leftprice.font = UIFont.systemFontOfSize(18)
        
        leftView.addSubview(leftlabel)
        
        
        self.addSubview(leftView)
        self.addSubview(rightButton)
        self.addSubview(leftprice)
    
    
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
