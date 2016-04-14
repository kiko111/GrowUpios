//
//  AllorgTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllorgTableViewCell: UITableViewCell {

    private var img:UIImageView!
    private var orgName:UILabel!
    private var introduction:UILabel!
    private var teacherNum:UILabel!
    private var address:UILabel!
    private var lastText:UILabel!
    private var rightImg:UIImageView!
    private var rightText:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    //cell 75
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        img = UIImageView(frame: CGRect(x: 12, y: 20, width: 50, height: 50))
        orgName = UILabel(frame: CGRect(x: CGRectGetMaxX(img.frame)+12, y: CGRectGetMinY(img.frame)-3, width:100 , height: 15))
        introduction = UILabel(frame: CGRect(x: CGRectGetMinX(orgName.frame), y:CGRectGetMaxY(orgName.frame)+6, width: UIScreen.mainScreen().bounds.width/1.5, height: 15))
        teacherNum = UILabel(frame: CGRect(x: CGRectGetMinX(orgName.frame), y:CGRectGetMaxY(introduction.frame)+6, width: 150, height: 15))
        address = UILabel(frame: CGRect(x: CGRectGetMinX(orgName.frame), y:CGRectGetMaxY(teacherNum.frame)+6, width: UIScreen.mainScreen().bounds.width/1.3, height: 15))
        lastText = UILabel(frame: CGRect(x: CGRectGetMinX(address.frame), y:CGRectGetMaxY(address.frame)+6, width: 150, height: 15))
        rightImg = UIImageView(frame: CGRect(x: UIScreen.mainScreen().bounds.width-70, y:8, width: 15, height: 15))
        rightText = UILabel(frame: CGRect(x: CGRectGetMaxX(rightImg.frame)+8, y: 8, width: 30, height: 15))

        
        
        orgName.font = UIFont(name: "ArialMT", size: 14)
        introduction.font = UIFont(name: "ArialMT", size: 13)
        teacherNum.font = UIFont(name: "ArialMT", size: 13)
        address.font = UIFont(name: "ArialMT", size: 13)
        lastText.font = UIFont(name: "ArialMT", size: 13)
        rightText.font = UIFont(name: "ArialMT", size: 13)
        
        orgName.textColor = UIColor.blackColor()
        introduction.textColor = UIColor.grayColor()
        teacherNum.textColor = UIColor.grayColor()
        lastText.textColor = UIColor.grayColor()
        teacherNum.textColor = UIColor.grayColor()
        address.textColor = UIColor.grayColor()
        
        
        rightImg.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.addSubview(img)
        self.addSubview(orgName)
        self.addSubview(introduction)
        self.addSubview(address)
        self.addSubview(lastText)
        self.addSubview(rightImg)
        self.addSubview(rightText)
        self.addSubview(teacherNum)
        
        let line = UILabel(frame: CGRect(x: CGRectGetMinX(img.frame), y: CGRectGetMaxY(lastText.frame)+8, width: UIScreen.mainScreen().bounds.width-CGRectGetMinX(img.frame), height: 1))
        line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        
        self.addSubview(line)
        
    }
    
    
    func filldata(orgData:NSArray){
        img.image = UIImage(named: orgData[0] as! String)
        orgName.text = orgData[1] as? String
        introduction.text = orgData[2] as? String
        teacherNum.text = "已入驻老师: "+"\(orgData[3])"+"位老师；"
        address.text = "校区地址："+"\(orgData[4])"
        lastText.text = orgData[5] as? String
        rightImg.image = UIImage(named: "school"+"\(orgData[6])")
        rightText.text = orgData[7] as? String

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
