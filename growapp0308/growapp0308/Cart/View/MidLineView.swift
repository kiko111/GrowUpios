//
//  MidLineView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/24.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class MidLineView: UIView {

    var title:UILabel!
    var content:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
//        let midLine:UILabel = UILabel(frame: CGRect(x: 0, y: frame.midY, width: frame.width, height: 1))
//        midLine.backgroundColor = GrayColor_E2E2E2
//        self.addSubview(midLine)
//        title = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
//        title.textAlignment = NSTextAlignment.Center
//        title.textColor = GrayColor_E2E2E2
////        title.text = "\(key)："
//        content = UILabel(frame: CGRect(x: title.frame.maxX+5, y: 0, width: 40, height: frame.height))
//        content.textAlignment = NSTextAlignment.Center
//        content.textColor = GrayColor_E2E2E2
////        content.text = "¥\(value)"
//        
//        self.addSubview(title)
//        self.addSubview(content)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,fontsize:CGFloat) {
        super.init(frame: frame)
        let midLine:UILabel = UILabel(frame: CGRect(x: 0, y: frame.height/2, width: frame.width, height: 1))
        midLine.backgroundColor = textColor_999999
        self.addSubview(midLine)
        title = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: frame.height))
        title.textAlignment = NSTextAlignment.Center
        title.textColor = textColor_999999

        content = UILabel(frame: CGRect(x: title.frame.maxX+1, y: 0, width: frame.width-title.frame.width, height: frame.height))
        content.textAlignment = NSTextAlignment.Center
        content.textColor = textColor_999999

        title.font = UIFont.systemFontOfSize(fontsize)
        content.font = UIFont.systemFontOfSize(fontsize)
        
        self.addSubview(title)
        self.addSubview(content)
        
    }
    func filldata(key:String,value:String){
        content.text = "¥\(value)"
        title.text = "\(key)："
    }
    

}
