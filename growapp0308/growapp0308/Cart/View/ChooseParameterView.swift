//
//  ChooseParameterView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/30.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ChooseParameterView: UIView {

    var cancelButton:UIButton!
//    var chooseButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(frame: CGRect,data:NSArray,isFirst:Bool,lineNum:Int,lineRows:Int,isBorderBlack:Bool) {
        super.init(frame: frame)
        let title = UILabel(frame: CGRect(x: 15, y: 10, width: 80, height: 30))
        title.textColor = textColor_333333
        title.font = UIFont.systemFontOfSize(15)
        title.text = data[0] as? String
        
        cancelButton = UIButton(frame: CGRect(x: ScreenWidth-35, y: 10, width: 15, height: 15))
        cancelButton.setImage(UIImage(named: "close"), forState: .Normal)
        
        for(var i=1;i<data.count;i++){
            
            let row:Int = (i-1)/lineNum
            let column:Int = (i-1)%lineNum
            
            let text = data[i] as? String
            let textNum = text?.characters.count
            let chooseButton:UIButton!
            
            if column == 0 {
                chooseButton = UIButton(frame: CGRect(x: CGFloat(20), y: 28+CGFloat(15+45*row), width: CGFloat(textNum!)*14.3, height:CGFloat(31)))

            }
            else {
                chooseButton = UIButton(frame: CGRect(x: self.viewWithTag(i-1)!.frame.maxX+10, y: 28+CGFloat(15+45*row), width: CGFloat(textNum!)*14.3, height: CGFloat(31)))

            }
            
            chooseButton.setTitle(text, forState:.Normal)
            chooseButton.setTitleColor(textColor_666666, forState: .Normal)
            chooseButton.titleLabel?.font = UIFont.systemFontOfSize(12)
            chooseButton.layer.cornerRadius = 4
            chooseButton.layer.borderColor =  GrayColor_E2E2E2.CGColor
            if isBorderBlack {
                chooseButton.layer.borderWidth = 1.1
            }
            else{
                chooseButton.layer.borderWidth = 0.7
            }
            
            chooseButton.tag = i
            self.addSubview(chooseButton)
        }
        var height:Int = 0
        switch lineRows{
        case 1: height = 85
        case 2: height = 130
        default : height = 0
        }
        
        self.addSubview(GrayLineView(frame: CGRect(x: 0, y: height, width: 1, height: 1)))
        
        
        if isFirst{
            self.addSubview(cancelButton)
        }
        

        self.addSubview(title)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
