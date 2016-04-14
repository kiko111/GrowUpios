//
//  ClassView.swift
//  growapp0308
//
//  Created by Arthur on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ClassView: UIView {

    private var img:UIImageView!
    private var line1:UILabel!
    private var line21:UILabel!
    private var line22:UILabel!
    private var line3:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        img = UIImageView(frame: CGRect(x: 0 , y: 0, width: frame.width, height: frame.width/1.7))
        line1 = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(img.frame)+5, width: frame.width, height: 15))
        line21 = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(line1.frame)+5, width: 2*frame.width/3, height: 15))
        line22 = UILabel(frame: CGRect(x: 2*frame.width/3, y: CGRectGetMaxY(line1.frame)+5, width: frame.width/3, height: 15))
        line3 = UILabel(frame: CGRect(x: 2, y: CGRectGetMaxY(line21.frame)+6, width: 50, height: 15))
        
        
        line1.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        line21.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        line22.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        line3.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
      
        line1.font = UIFont(name: "ArialMT", size: 11)
        line21.font = UIFont(name: "ArialMT", size: 11)
        line22.font = UIFont(name: "ArialMT", size: 11)
        line3.font = UIFont(name: "ArialMT", size: 12)
        
        self.addSubview(img)
        self.addSubview(line1)
        self.addSubview(line21)
        self.addSubview(line22)
        self.addSubview(line3)
        
    }
    
    func fillData(classData:NSArray){
        img.image = UIImage(named:(classData[0] as? String)!)
        line1.text = classData[1] as? String
        line21.text = classData[2] as? String
        line22.text = classData[3] as? String
        line3.text = classData[4] as? String
    }
    
    func fillOnlineData(classData:NSArray){
        img.image = geturlImg(classData[0] as! String)
        line1.text = classData[1] as? String
        line21.text = classData[2] as? String
        line22.text = classData[3] as? String
        line3.text = classData[4] as? String
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func myinit(frame:CGRect,height1:CGFloat,height2:CGFloat){
        
        
    }

}
