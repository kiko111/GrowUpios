//
//  ParallelTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ParallelTableViewCell: UITableViewCell {

    var label11:UIImageView!
    var label12:UIImageView!
    var label13:UIImageView!
    var label14:UIImageView!
    
    var text1:UILabel!
    var text2:UILabel!
    var text3:UILabel!
    var text4:UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label11 = UIImageView(frame: CGRect(x: 20, y: 16, width:55 , height: 55))
        let distance:CGFloat = (UIScreen.mainScreen().bounds.width-40-4*(label11?.bounds.height)!)/3
        label12 = UIImageView(frame: CGRect(x: CGRectGetMaxX(label11.frame)+distance, y: 16, width:55, height: 55))
        label13 = UIImageView(frame: CGRect(x: CGRectGetMaxX(label12.frame)+distance, y: 16, width:55, height: 55))
        label14 = UIImageView(frame: CGRect(x: CGRectGetMaxX(label13.frame)+distance, y: 16, width:55, height: 55))
        label11.contentMode = UIViewContentMode.ScaleAspectFit
        label12.contentMode = UIViewContentMode.ScaleAspectFit
        label13.contentMode = UIViewContentMode.ScaleAspectFit
        label14.contentMode = UIViewContentMode.ScaleAspectFit
        
        text1 = UILabel(frame: CGRect(x: CGRectGetMinX(label11.frame), y: CGRectGetMaxY(label11.frame)+8, width: label11.bounds.width, height: 25))
        text2 = UILabel(frame: CGRect(x: CGRectGetMinX(label12.frame), y: CGRectGetMaxY(label12.frame)+8, width: label12.bounds.width, height: 25))
        text3 = UILabel(frame: CGRect(x: CGRectGetMinX(label13.frame), y: CGRectGetMaxY(label13.frame)+8, width: label13.bounds.width, height: 25))
        text4 = UILabel(frame: CGRect(x: CGRectGetMinX(label14.frame), y: CGRectGetMaxY(label14.frame)+8, width: label14.bounds.width, height: 25))
        
//        text1.center.x = label11.center.x
//        text2.center.x = label12.center.x
//        text3.center.x = label13.center.x
//        text4.center.x = label14.center.x
        
        text1.textAlignment = NSTextAlignment.Center
        text2.textAlignment = NSTextAlignment.Center
        text3.textAlignment = NSTextAlignment.Center
        text4.textAlignment = NSTextAlignment.Center
        
        
        
        
//        self.addSubview(label11!)
//        self.addSubview(label12!)
//        self.addSubview(label13!)
//        self.addSubview(label14!)
//        
//        self.addSubview(text1!)
//        self.addSubview(text2!)
//        self.addSubview(text3!)
//        self.addSubview(text4!)
        
        self.contentView.addSubview(label11!)
        self.contentView.addSubview(label12!)
        self.contentView.addSubview(label13!)
        self.contentView.addSubview(label14!)
        
        self.contentView.addSubview(text1!)
        self.contentView.addSubview(text2!)
        self.contentView.addSubview(text3!)
        self.contentView.addSubview(text4!)
        
        

        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fillData(textData:NSArray,imgData:NSArray){
        text1.text = textData[0] as? String
        text2.text = textData[1] as? String
        text3.text = textData[2] as? String
        text4.text = textData[3] as? String
        //text1.font = UIFont(name: "ArialMT", size: 15)
        
        label11.image = UIImage(named: "\(imgData[0])")
        label12.image = UIImage(named: "\(imgData[1])")
        label13.image = UIImage(named: "\(imgData[2])")
        label14.image = UIImage(named: "\(imgData[3])")


    }
    func fillImg(imgNsArray:NSArray){
        label11.image = UIImage(named: "\(imgNsArray[0])")
        label12.image = UIImage(named: "\(imgNsArray[1])")
        label13.image = UIImage(named: "\(imgNsArray[2])")
        label14.image = UIImage(named: "\(imgNsArray[3])")
    }
    
    
    //-----online Data---
    func fillOnlineData(textData:NSArray,imgData:NSArray){
        text1.text = textData[0] as? String
        text2.text = textData[1] as? String
        text3.text = textData[2] as? String
        text4.text = textData[3] as? String
        
        label11.image = geturlImg(imgData[0] as! String)
        label12.image = geturlImg(imgData[1] as! String)
        label13.image = geturlImg(imgData[2] as! String)
        label14.image = geturlImg(imgData[3] as! String)
    }
    
    func fillOnlineImg(imgNsArray:NSArray){
        label11.image = geturlImg(imgNsArray[0] as! String)
        label12.image = geturlImg(imgNsArray[1] as! String)
        label13.image = geturlImg(imgNsArray[2] as! String)
        label14.image = geturlImg(imgNsArray[3] as! String)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
