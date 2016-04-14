//
//  commentHeadVIew.swift
//  growapp0308
//
//  Created by Arthur on 16/3/29.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class commentHeadVIew: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    init(frame: CGRect,titleArray:NSArray) {
        super.init(frame: frame)
        let num = titleArray.count
        print(num)
        for(var i = 0;i<num;i++){
            let btn = UIButton(frame: CGRect(x: CGFloat(i)*ScreenWidth/CGFloat(num), y: 6.5, width: ScreenWidth/CGFloat(num), height: 30))
            btn.setTitle(titleArray[i] as? String, forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14.5)
            btn.setTitleColor(textColor_666666, forState: .Normal)
            self.addSubview(btn)
        }
        let downLine = GrayLineView(frame: CGRect(x: 0, y: 40, width: 1, height: 1))
        self.addSubview(downLine)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
