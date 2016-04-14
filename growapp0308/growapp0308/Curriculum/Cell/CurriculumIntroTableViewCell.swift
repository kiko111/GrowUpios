//
//  CurriculumIntroTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/15.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class CurriculumIntroTableViewCell: UITableViewCell {

    var title:UILabel!
    var arrangement:UILabel!
    var time:UILabel!
    var type:UILabel!
    var price:UILabel!
    var priceValue:UILabel!
    var buyButton:UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let sidewidth:CGFloat = 20
        title = UILabel(frame: CGRect(x: sidewidth, y: 2, width: 180, height: 40))
        arrangement = UILabel(frame: CGRect(x: sidewidth, y: CGRectGetMaxY(title.frame), width: ScreenWidth-2*sidewidth, height: 20))
        time = UILabel(frame: CGRect(x: sidewidth, y: CGRectGetMaxY(arrangement.frame)+4, width: 100, height: 20))
        type = UILabel(frame: CGRect(x: sidewidth, y: CGRectGetMaxY(time.frame)+4, width: 150, height: 20))
        price = UILabel(frame: CGRect(x: sidewidth, y: CGRectGetMaxY(type.frame)+4, width: 60, height: 20))
        priceValue = UILabel(frame: CGRect(x: CGRectGetMaxX(price.frame)+10, y: CGRectGetMinY(price.frame)-5, width: 150, height: 30))
        buyButton = UIButton(frame: CGRect(x: ScreenWidth-120, y: CGRectGetMinY(priceValue.frame)-12, width: 110, height: 40))
        
        title.font = UIFont.systemFontOfSize(15)
        arrangement.font = UIFont.systemFontOfSize(13)
        time.font = UIFont.systemFontOfSize(13)
        type.font = UIFont.systemFontOfSize(13)
        price.font = UIFont.systemFontOfSize(13)
        priceValue.font = UIFont.systemFontOfSize(15)
        
        
        title.textColor = textColor_333333
        arrangement.textColor = textColor_666666
        time.textColor = textColor_666666
        type.textColor = textColor_666666
        price.textColor = textColor_666666
        price.text = "价格课程: "
        priceValue.textColor = BlueColor_0192F2
        
        buyButton.backgroundColor = red_FB5131
        buyButton.setTitle("购买课程", forState: .Normal)
        buyButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        
        
        self.addSubview(title)
        self.addSubview(arrangement)
        self.addSubview(time)
        self.addSubview(type)
        self.addSubview(price)
        self.addSubview(priceValue)
        self.addSubview(buyButton)
        
        
    }

    func filldata(classData:NSArray){
        title.text = classData[0] as? String
        arrangement.text = "课程安排: "+"\(classData[1])"
        time.text = "课程时长: "+"\(classData[2])"
        type.text = "课程类型: "+"\(classData[3])"
        priceValue.text = "¥"+"\(classData[4])"
        
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

}
