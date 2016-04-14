//
//  orderDetailTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/4/1.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class orderDetailTableViewCell: UITableViewCell {

    var img:UIImageView!

    var title:UILabel!
    var colorType:UILabel!
    var versionType:UILabel!
    var amount:UILabel!
    var totalPrice:UILabel!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        img = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))

        
        title = UILabel(frame: CGRect(x: img.frame.maxX+10, y: 12, width: ScreenWidth-50-img.frame.width, height:35))
        title.font = UIFont.systemFontOfSize(12)
        title.textColor = textColor_666666
        title.numberOfLines = 0
        
        colorType = UILabel(frame: CGRect(x: title.frame.minX, y: title.frame.maxY+10, width: 90, height: 20))
        colorType.textColor = textColor_999999
        colorType.font = UIFont.systemFontOfSize(12)
        
        versionType = UILabel(frame: CGRect(x: colorType.frame.maxX+8, y: title.frame.maxY+10, width: title.frame.width-colorType.frame.width-15, height: 20))
        versionType.textColor = textColor_999999
        versionType.font = UIFont.systemFontOfSize(12)
        

        amount = UILabel(frame: CGRect(x: title.frame.maxX, y: versionType.frame.minY, width: 20, height: 20))
        amount.textColor = textColor_333333
        amount.font = UIFont.systemFontOfSize(15)
        
        totalPrice = UILabel(frame: CGRect(x: ScreenWidth-80, y: versionType.frame.maxY+4, width: 60, height: 25))
        totalPrice.textColor = BlueColor_0192F2
        totalPrice.font = UIFont.systemFontOfSize(15)
        
        
        self.addSubview(img)

        self.addSubview(title)
        self.addSubview(colorType)
        self.addSubview(versionType)
        self.addSubview(amount)
        self.addSubview(totalPrice)
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func filldata(orderData:NSArray){
        img.image = UIImage(named: (orderData[0] as? String)!)
        title.text = orderData[1] as? String
        colorType.text = orderData[2] as? String
        versionType.text = orderData[3] as? String
        amount.text = "x\(orderData[4])"
        totalPrice.text = orderData[5] as? String
    }
    

}
