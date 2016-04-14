//
//  AllclassTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/11.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllclassTableViewCell: UITableViewCell {

    var leftimg:UIImageView!
    var title:UILabel!
    var text1:UILabel!
    var text2:UILabel!
    var text3:UILabel!
    
    var rightText:UILabel!
    var price:UILabel!
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        leftimg = UIImageView(frame: CGRect(x: 10, y: 15, width: 90, height: 65))
        title = UILabel(frame: CGRect(x: CGRectGetMaxX(leftimg.frame)+12, y: 15, width: 180, height: 15))
        text1 = UILabel(frame: CGRect(x: CGRectGetMinX(title.frame), y: CGRectGetMaxY(title.frame)+7.5, width: UIScreen.mainScreen().bounds.width/1.5, height: 14))
        text2 = UILabel(frame: CGRect(x: CGRectGetMinX(title.frame), y: CGRectGetMaxY(text1.frame)+4.5, width: UIScreen.mainScreen().bounds.width/1.4, height: 14))
        text3 = UILabel(frame: CGRect(x: CGRectGetMinX(title.frame), y: CGRectGetMaxY(text2.frame)+4.5, width: UIScreen.mainScreen().bounds.width/2, height: 14))
        rightText = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width-60, y: 12, width: 50, height: 20))
        price = UILabel(frame: CGRect(x:CGRectGetMinX(rightText.frame), y: CGRectGetMaxY((text3.frame)), width: 100, height: 18))
        
        
        title.font = UIFont(name: "ArialMT", size: 14)
        text1.font = UIFont(name: "ArialMT", size: 13)
        text2.font = UIFont(name: "ArialMT", size: 13)
        text3.font = UIFont(name: "ArialMT", size: 13)
        
        
        title.textColor = UIColor.blackColor()
        text1.textColor = UIColor.grayColor()
        text2.textColor = UIColor.grayColor()
        text3.textColor = UIColor.grayColor()
        
        
        
        self.addSubview(leftimg)
        self.addSubview(title)
        self.addSubview(text1)
        self.addSubview(text2)
        self.addSubview(text3)
        self.addSubview(rightText)
        self.addSubview(price)
        
        rightText.layer.borderWidth = 1
        rightText.layer.masksToBounds = true
        rightText.layer.cornerRadius = 3
        rightText.layer.borderColor = UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1).CGColor
        rightText.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)
        rightText.textColor = UIColor.whiteColor()
        rightText.textAlignment = NSTextAlignment.Center
        rightText.font = UIFont(name: "ArialMT", size: 12)
        
        price.font = UIFont(name: "ArialMT", size: 13)
        price.textColor = UIColor(red: 1/255, green: 146/255, blue: 242/255, alpha: 1)
        
        let line = UILabel(frame: CGRect(x: CGRectGetMinX(leftimg.frame), y: CGRectGetMaxY(price.frame)+4.6, width: UIScreen.mainScreen().bounds.width-CGRectGetMinX(leftimg.frame), height: 1))
        line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        
        self.addSubview(line)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func filldata(allCurriculumData:NSArray){
        leftimg.image = UIImage(named: allCurriculumData[0] as! String)
        switch allCurriculumData[5] as! String {
        case "1":
            rightText.text = "视频课"
            text1.text = "课程安排: "+(allCurriculumData[2] as! String)
            text2.text = "适合人群: "+(allCurriculumData[3] as! String)
            text3.text = "视频课节: "+(allCurriculumData[4] as! String)+"节课"
            
            break
        case "2":
            rightText.text = "1对1"
            text1.text = "课程安排: "+(allCurriculumData[2] as! String)
            text2.text = "上课地点: "+(allCurriculumData[3] as! String)
            text3.text = "适合人群: "+(allCurriculumData[4] as! String)
            break
        case "3":
            rightText.text = "班课"
            text1.text = "课程安排: "+(allCurriculumData[2] as! String)
            text2.text = "上课地点: "+(allCurriculumData[3] as! String)
            text3.text = "适合人群: "+(allCurriculumData[4] as! String)
            break
        case "4":
            rightText.text = "直播课"
            text1.text = "课程安排: "+(allCurriculumData[2] as! String)
            text2.text = "上课时长: "+(allCurriculumData[3] as! String)+"小时"
            text3.text = "班级人数: 已报"+(allCurriculumData[4] as! String)
            break
        default :
            break
        }
        title.text = allCurriculumData[1] as? String
        price.text = "¥"+"\(allCurriculumData[6])"
        
//        if text1.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)>50{
//            text1.frame = CGRect(x: CGRectGetMinX(title.frame), y: CGRectGetMaxY(title.frame)+8, width: UIScreen.mainScreen().bounds.width/1.5, height: 40)
//            
//        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
