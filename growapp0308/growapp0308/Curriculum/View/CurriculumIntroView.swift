//
//  CurriculumIntroView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/15.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class CurriculumIntroView: UIView {

    var text11:UILabel!
    var text12:UILabel!
    var text21:UILabel!
    var text22:UILabel!
    var text31:UILabel!
    var text32:UILabel!
    var text41:UILabel!
    var text42:UILabel!
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    init(frame:CGRect,tabledata:NSArray ){
        super.init(frame: frame)
        self.backgroundColor = bg_F9F7F7
        let verticlepoint:CGFloat = frame.width/3
        let orientalpoint:CGFloat = frame.height/4
        let verticleLine = UILabel(frame: CGRect(x: verticlepoint, y: 0, width: 0.5, height: frame.height))
        let orientalLine1 = UILabel(frame: CGRect(x: 0, y: orientalpoint, width: frame.width, height: 0.5))
        let orientalLine2 = UILabel(frame: CGRect(x: 0, y: 2*orientalpoint, width: frame.width, height: 0.5))
        let orientalLine3 = UILabel(frame: CGRect(x: 0, y: 3*orientalpoint, width: frame.width, height: 0.5))
        orientalLine1.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        orientalLine2.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        orientalLine3.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        verticleLine.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        text11 = UILabel(frame: CGRect(x: 0, y: 0, width: verticlepoint, height: orientalpoint))
        text12 = UILabel(frame: CGRect(x: verticlepoint+15, y: 0, width: 1.5*verticlepoint, height: orientalpoint))
        text21 = UILabel(frame: CGRect(x: 0, y: orientalpoint, width: verticlepoint, height: orientalpoint))
        text22 = UILabel(frame: CGRect(x: verticlepoint+15, y: orientalpoint, width: 1.5*verticlepoint, height: orientalpoint))
        text31 = UILabel(frame: CGRect(x: 0, y: 2*orientalpoint, width: verticlepoint, height: orientalpoint))
        text32 = UILabel(frame: CGRect(x: verticlepoint+15, y: 2*orientalpoint, width: 1.5*verticlepoint, height: orientalpoint))
        text41 = UILabel(frame: CGRect(x: 0, y: 3*orientalpoint, width: verticlepoint, height: orientalpoint))
        text42 = UILabel(frame: CGRect(x: verticlepoint+15, y:3*orientalpoint, width: 1.5*verticlepoint, height: orientalpoint))
        
        text11.textColor = textColor_666666
        text12.textColor = textColor_666666
        text21.textColor = textColor_666666
        text22.textColor = textColor_666666
        text31.textColor = textColor_666666
        text32.textColor = textColor_666666
        text41.textColor = textColor_666666
        text42.textColor = textColor_666666
        
        text11.font = UIFont.systemFontOfSize(15)
        text12.font = UIFont.systemFontOfSize(15)
        text21.font = UIFont.systemFontOfSize(15)
        text22.font = UIFont.systemFontOfSize(15)
        text31.font = UIFont.systemFontOfSize(15)
        text32.font = UIFont.systemFontOfSize(15)
        text41.font = UIFont.systemFontOfSize(15)
        text42.font = UIFont.systemFontOfSize(15)
        
        text11.textAlignment = NSTextAlignment.Center
        text12.textAlignment = NSTextAlignment.Left
        text21.textAlignment = NSTextAlignment.Center
        text22.textAlignment = NSTextAlignment.Left
        text31.textAlignment = NSTextAlignment.Center
        text32.textAlignment = NSTextAlignment.Left
        text41.textAlignment = NSTextAlignment.Center
        text42.textAlignment = NSTextAlignment.Left
        
        
        text11.text = tabledata[0] as? String
        text12.text = tabledata[1] as? String
        text21.text = tabledata[2] as? String
        text22.text = tabledata[3] as? String
        text31.text = tabledata[4] as? String
        text32.text = tabledata[5] as? String
        text41.text = tabledata[6] as? String
        text42.text = tabledata[7] as? String
        
        text11.backgroundColor = UIColor.clearColor()
        text12.backgroundColor = UIColor.clearColor()
        text21.backgroundColor = UIColor.clearColor()
        text22.backgroundColor = UIColor.clearColor()
        text31.backgroundColor = UIColor.clearColor()
        text32.backgroundColor = UIColor.clearColor()
        text41.backgroundColor = UIColor.clearColor()
        text42.backgroundColor = UIColor.clearColor()
        
        self.addSubview(text11)
        self.addSubview(text12)
        self.addSubview(text21)
        self.addSubview(text22)
        self.addSubview(text31)
        self.addSubview(text32)
        self.addSubview(text41)
        self.addSubview(text42)
        self.addSubview(orientalLine1)
        self.addSubview(orientalLine2)
        self.addSubview(orientalLine3)
        self.addSubview(verticleLine)
        
        self.layer.borderColor = GrayColor_E2E2E2.CGColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 4
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
