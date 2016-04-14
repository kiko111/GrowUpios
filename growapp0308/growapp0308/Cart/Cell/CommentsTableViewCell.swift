//
//  CommentsTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/24.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    
    var img:UIImageView!
    var tel:UILabel!
    var commentsText:UILabel!
    var time:UILabel!
    var tags:UILabel!
    var pic1:UIImageView?
    var pic2:UIImageView?
    var pic3:UIImageView?
    var downline1:GrayLineView!
    var downline2:GrayLineView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        img = UIImageView(frame: CGRect(x: 20, y: 15, width: 65, height: 65))
        tel = UILabel(frame: CGRect(x: 15, y: img.frame.maxY+5, width: 74, height: 15))
        tel.textColor = textColor_333333
        tel.font = UIFont.systemFontOfSize(11)
        
        commentsText = UILabel(frame: CGRect(x: img.frame.maxX+10, y: 19, width: ScreenWidth-50-img.frame.width, height:50))
        commentsText.font = UIFont.systemFontOfSize(13)
        commentsText.textColor = textColor_666666
        commentsText.numberOfLines = 0
        
        time = UILabel(frame: CGRect(x: commentsText.frame.minX, y: commentsText.frame.maxY+15, width: 110, height: 20))
        time.textColor = textColor_999999
        time.font = UIFont.systemFontOfSize(13)
        
        tags = UILabel(frame: CGRect(x: time.frame.maxX+8, y: commentsText.frame.maxY+15, width: commentsText.frame.width-time.frame.width, height: 20))
        tags.textColor = textColor_999999
        tags.font = UIFont.systemFontOfSize(13)
        
        let picwidth = commentsText.frame.width/3-8
        pic1 = UIImageView(frame: CGRect(x: time.frame.minX , y: time.frame.maxY+10, width: picwidth, height: picwidth))
        pic2 = UIImageView(frame: CGRect(x: time.frame.minX+8+picwidth , y: time.frame.maxY+10, width: picwidth, height: picwidth))
        pic3 = UIImageView(frame: CGRect(x: time.frame.minX+16+2*picwidth , y: time.frame.maxY+10, width: picwidth, height: picwidth))
//        pic1!.contentMode = UIViewContentMode.ScaleAspectFit
//        pic2!.contentMode = UIViewContentMode.ScaleAspectFit
//        pic3!.contentMode = UIViewContentMode.ScaleAspectFit

//        var time:UILabel!
//        var tags:UILabel!
//        var pic1:UIImageView?
//        var pic2:UIImageView?
//        var pic3:UIImageView?
        
        downline1 = GrayLineView(frame: CGRect(x: 0, y: pic1!.frame.minY, width: 1, height: 1))
        downline2 = GrayLineView(frame: CGRect(x: 0, y: pic1!.frame.maxY+5, width: 1, height: 1))
        
        
        self.addSubview(img)
        self.addSubview(tel)
        self.addSubview(commentsText)
        self.addSubview(time)
        self.addSubview(tags)
        self.addSubview(pic1!)
        self.addSubview(pic2!)
        self.addSubview(pic3!)
        self.addSubview(downline1)
        self.addSubview(downline2)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func filldata(commentsdata:NSArray,downLineType:Int){
        if downLineType == 0 {
            downline1.backgroundColor = UIColor.clearColor()
            downline2.backgroundColor = UIColor.clearColor()
        }
        
        img.image = UIImage(named: commentsdata[0] as! String)
        tel.text = commentsdata[1] as? String
        commentsText.text = commentsdata[2] as? String
        time.text = commentsdata[3] as? String
        tags.text = commentsdata[4] as? String
        if(commentsdata.count>5 && (commentsdata[5] as? String != "")){
            let images:NSArray = commentsdata[5] as! NSArray
            pic1?.layer.borderColor = GrayColor_E2E2E2.CGColor
            pic2?.layer.borderColor = GrayColor_E2E2E2.CGColor
            pic3?.layer.borderColor = GrayColor_E2E2E2.CGColor
            pic1?.layer.borderWidth = 0.7
            pic2?.layer.borderWidth = 0.7
            pic3?.layer.borderWidth = 0.7
            for(var i = 0 ;i<commentsdata[5].count;i++){
                switch i {
                case 0:
                    self.pic1?.image = UIImage(named: images[0] as! String)
                    break
                case 1:
                    pic2?.image = UIImage(named: images[1] as! String)
                    break
                case 2:
                    pic3?.image = UIImage(named: images[2] as! String)
                    break
                default: break
                }
            }
        downline1.backgroundColor = UIColor.clearColor()
        }
        else{
            downline2.backgroundColor = UIColor.clearColor()
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
