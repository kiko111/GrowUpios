//
//  AllTeacherViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllTeacherViewCell: UITableViewCell {

    private var img:UIImageView!
    private var name:UILabel!
    private var teaching:UILabel!
    private var introduction:UILabel!
    private var place:UILabel!
    private var org:UILabel!
    private var studyNum:UILabel!
    private var commentNum:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        img = UIImageView(frame: CGRect(x: 12, y: 18, width: 50, height: 50))
        name = UILabel(frame: CGRect(x: CGRectGetMaxX(img.frame)+8, y: 18, width: 35, height: 10))
        teaching = UILabel(frame: CGRect(x: CGRectGetMinX(name.frame), y: CGRectGetMaxY(name.frame)+10, width: 120, height: 10))
        introduction = UILabel(frame: CGRect(x: CGRectGetMinX(name.frame), y: CGRectGetMaxY(teaching.frame)+10, width: 120, height: 10))
        let downimg = UIImageView(frame: CGRect(x: 12, y: CGRectGetMaxY(img.frame)+8, width: 9, height: 15))
        downimg.image = UIImage(named: "book")
        place = UILabel(frame: CGRect(x: CGRectGetMaxX(downimg.frame)+7, y:CGRectGetMaxY(downimg.frame)-8, width: 100, height: 8))
        
        org = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width-100, y: 15, width: 90, height: 18))
        studyNum = UILabel(frame: CGRect(x:UIScreen.mainScreen().bounds.width-60, y: CGRectGetMaxY(introduction.frame)-4, width: 60, height: 10))
        commentNum = UILabel(frame: CGRect(x:UIScreen.mainScreen().bounds.width-60, y: CGRectGetMaxY(studyNum.frame)+5, width: 60, height: 10))
        
        teaching.textColor = UIColor.grayColor()
        introduction.textColor = UIColor.grayColor()
        place.textColor = UIColor.grayColor()
        
        org.layer.cornerRadius = 4
        org.textColor = UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)
        org.layer.borderColor=UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1).CGColor
        org.layer.borderWidth = 1
        
        commentNum.textColor = UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)
        studyNum.textColor = UIColor.grayColor()
        

        
        name.font = UIFont(name: "ArialMT", size: 14)
        teaching.font = UIFont(name: "ArialMT", size: 14)
        introduction.font = UIFont(name: "ArialMT", size: 14)
        place.font = UIFont(name: "ArialMT", size: 12)
        
        org.font = UIFont(name: "ArialMT", size: 12)
        org.textAlignment = NSTextAlignment.Center
        studyNum.font = UIFont(name: "ArialMT", size: 12)
        commentNum.font = UIFont(name: "ArialMT", size: 12)
        
        self.addSubview(downimg)
        
        self.addSubview(img)
        self.addSubview(name)
        self.addSubview(teaching)
        self.addSubview(introduction)
        self.addSubview(place)
        self.addSubview(org)
        self.addSubview(studyNum)
        self.addSubview(commentNum)
        
        
        let line = UILabel(frame: CGRect(x: CGRectGetMinX(img.frame), y: CGRectGetMaxY(place.frame)+6, width: UIScreen.mainScreen().bounds.width-CGRectGetMinX(img.frame), height: 1))
        line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        
        self.addSubview(line)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func filldata(teacherData:NSArray){
        img.image = UIImage(named: (teacherData[0] as? String)!)
        name.text = teacherData[1] as? String
        teaching.text = teacherData[2] as? String
        introduction.text = teacherData[3] as? String
        place.text = teacherData[4] as? String
        if(((teacherData[5] as? String)!.isEmpty) != true){
            org.text = teacherData[5] as? String
        }
        else{
            org.removeFromSuperview()
        }
        studyNum.text = "\(teacherData[6])"+"人学习"
        commentNum.text = "\(teacherData[7])"+"人评价"
        
    }
    
   

}
