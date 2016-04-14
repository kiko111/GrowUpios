//
//  GoodsDetailTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/24.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class GoodsDetailTableViewCell: UITableViewCell {

    var label11:UILabel!
    var label12:UILabel!
    var label21:UILabel!
    var label22:UILabel!
    var label31:UILabel!
    var label32:UILabel!
    var label41:UILabel!
    var label42:UILabel!
    var label43:UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let leftinternal:CGFloat = 20
        let rightStartX:CGFloat = 2*ScreenWidth/3-20
        let leftlabelWidth = rightStartX-20-15
        let rightlabelWidth = ScreenWidth/3-15
        let height:CGFloat = 20
        label11 = UILabel(frame: CGRect(x: leftinternal, y: 20, width: leftlabelWidth, height: height))
        label12 = UILabel(frame: CGRect(x: rightStartX, y: 20, width: rightlabelWidth, height: height))
        label21 = UILabel(frame: CGRect(x: leftinternal, y: label11.frame.maxY+5, width: leftlabelWidth, height: height))
        label22 = UILabel(frame: CGRect(x: rightStartX, y: label11.frame.maxY+5, width: rightlabelWidth, height: height))
        label31 = UILabel(frame: CGRect(x: leftinternal, y: label21.frame.maxY+5, width: leftlabelWidth, height: height))
        label32 = UILabel(frame: CGRect(x: rightStartX, y: label21.frame.maxY+5, width: rightlabelWidth, height: height))
        label41 = UILabel(frame: CGRect(x: leftinternal, y: label31.frame.maxY+5, width: leftlabelWidth, height: height))
        label42 = UILabel(frame: CGRect(x: ScreenWidth/2-50, y: label31.frame.maxY+5, width: 90, height: height))
        label43 = UILabel(frame: CGRect(x: ScreenWidth/2+70, y: label31.frame.maxY+5, width: 110, height: height))
        
        label11.textColor = textColor_666666
        label12.textColor = textColor_666666
        label21.textColor = textColor_666666
        label22.textColor = textColor_666666
        label31.textColor = textColor_666666
        label32.textColor = textColor_666666
        label41.textColor = textColor_666666
        label42.textColor = textColor_666666
        label43.textColor = textColor_666666
        
        label11.font = UIFont.systemFontOfSize(13)
        label12.font = UIFont.systemFontOfSize(13)
        label21.font = UIFont.systemFontOfSize(13)
        label22.font = UIFont.systemFontOfSize(13)
        label31.font = UIFont.systemFontOfSize(13)
        label32.font = UIFont.systemFontOfSize(13)
        label41.font = UIFont.systemFontOfSize(13)
        label42.font = UIFont.systemFontOfSize(13)
        label43.font = UIFont.systemFontOfSize(13)

        let buttomLine = GrayLineView(frame: CGRect(x: 0, y: label41.frame.maxY+10, width: ScreenWidth, height: 0.7))
        
        self.addSubview(label11)
        self.addSubview(label12)
        self.addSubview(label21)
        self.addSubview(label22)
        self.addSubview(label31)
        self.addSubview(label32)
        self.addSubview(label41)
        self.addSubview(label42)
        self.addSubview(label43)
        self.addSubview(buttomLine)
        
    }
    
    func  filldata(detailData:NSArray){
        label11.text = detailData[0] as? String
        label12.text = detailData[1] as? String
        label21.text = detailData[2] as? String
        label22.text = detailData[3] as? String
        label31.text = detailData[4] as? String
        label32.text = detailData[5] as? String
        label41.text = detailData[6] as? String
        label42.text = detailData[7] as? String
        label43.text = detailData[8] as? String
        
        
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
