//
//  chooseNumView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/30.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class chooseNumView: UIView {

    
    var minusButton:UIButton!
    var addButton:UIButton!
    var showNum:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel(frame: CGRect(x: 10, y: 18, width: 80, height: 30))
        label.text = "购买数量"
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = textColor_333333
        
        minusButton = UIButton(frame: CGRect(x: ScreenWidth-170, y: 13, width: 32, height: 32))
        addButton = UIButton(frame: CGRect(x: ScreenWidth-60, y: 13, width: 32, height: 32))
        showNum = UILabel(frame: CGRect(x: ScreenWidth-138, y: 13, width: 78, height: 32))
        showNum.textAlignment = NSTextAlignment.Center
        showNum.text = "1"
        
        minusButton.setImage(UIImage(named: "down"), forState: .Normal)
        addButton.setImage(UIImage(named: "up"), forState: .Normal)
        label.textColor = textColor_333333
        label.font = UIFont.systemFontOfSize(14)
        
        minusButton.tag = 100
        addButton.tag = 101
        showNum.tag = 102
        
        
        self.addSubview(minusButton)
        self.addSubview(addButton)
        self.addSubview(label)
        self.addSubview(showNum)
        
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
