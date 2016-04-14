//
//  TopbarTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class TopbarTableViewCell: UITableViewCell {

    var leftText:UILabel!
    var rightText:UIButton!
    var arrow:UIImageView!
    var line:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        leftText = UILabel(frame: CGRect(x: 18, y: 5, width: 80, height: 30))
        rightText = UIButton(frame: CGRect(x: UIScreen.mainScreen().bounds.width-100, y:12, width: 70, height: 16))
        arrow = UIImageView(frame: CGRect(x: UIScreen.mainScreen().bounds.width-34, y: 13, width: 11, height: 13))
        
        line = UILabel(frame: CGRect(x: 18, y: 37, width: UIScreen.mainScreen().bounds.width-18, height: 0.5))
        line.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
 
        leftText.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        rightText.setTitleColor(UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
, forState: .Normal)
        
        let topline = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 0.5))
        topline.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        self.contentView.addSubview(topline)
        
        self.contentView.addSubview(leftText)
        self.contentView.addSubview(rightText)
        self.contentView.addSubview(arrow)
        self.contentView.addSubview(line)
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
