//
//  GoodsTopCulumnCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/24.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class GoodsTopCulumnCell: UITableViewCell {
    var title:UILabel!
    var tags:UILabel!
    var price:MidLineView!
    var cutoffPrice:UILabel!
    var buyButton:ClickButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let width:CGFloat = 15
        title = UILabel(frame: CGRect(x: width, y: 10, width: ScreenWidth-2*width, height: 20))
        tags = UILabel(frame: CGRect(x: width, y: title.frame.maxY+5, width: title.frame.width, height: 20))
        price = MidLineView(frame: CGRect(x: width, y: tags.frame.maxY+22, width: 100, height: 20), fontsize: 12)
        let cutpriceTitle = UILabel(frame: CGRect(x: width, y: price.frame.maxY+8, width:55, height: 20))
        cutpriceTitle.text = "促销价:"
        
        cutoffPrice = UILabel(frame: CGRect(x: cutpriceTitle.frame.maxX, y: cutpriceTitle.frame.minY-3, width: 80, height: 28))
        buyButton = ClickButton.init(frame: CGRect(x: ScreenWidth-120, y: cutpriceTitle.frame.minY, width: 100, height: 30), backgroundColor: BlueColor_0192F2, text: "立即购买")
        buyButton.titleLabel!.font = UIFont.systemFontOfSize(15)
        
        title.font = UIFont.systemFontOfSize(12)
        title.textColor = textColor_333333
        tags.font = UIFont.systemFontOfSize(12)
        cutpriceTitle.font = UIFont.systemFontOfSize(12)
        cutpriceTitle.textColor = textColor_999999
        
        cutoffPrice.font = UIFont.systemFontOfSize(15)
        cutoffPrice.textColor = BlueColor_0192F2
        self.addSubview(title)
        self.addSubview(tags)
        self.addSubview(price)
        self.addSubview(cutpriceTitle)
        self.addSubview(cutoffPrice)
        self.addSubview(buyButton)
        
    }

    func filldata(goodsdata:NSArray){
        title.text = goodsdata[0] as? String
        tags.text = goodsdata[1] as? String
        self.price.filldata("价格", value: (goodsdata[2] as? String)!)
        cutoffPrice.text = "¥\(goodsdata[3])"
        
        
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
