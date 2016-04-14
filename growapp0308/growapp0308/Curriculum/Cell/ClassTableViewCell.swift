//
//  ClassTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/10.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    var img1:UIImageView!
    var img2:UIImageView!
    var img3:UIImageView!
    var text1:UILabel!
    var text21:UILabel!
    var text22:UILabel!
    var text3:UILabel!
    
    var view1:ClassView!
    var view2:ClassView!
    var view3:ClassView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let width = (UIScreen.mainScreen().bounds.width - 15*4)/3
        view1 = ClassView(frame: CGRect(x: 15, y: 17, width: width, height: 180))
        view2 = ClassView(frame: CGRect(x: CGRectGetMaxX(view1.frame)+15, y: 17, width: width, height: 180))
        view3 = ClassView(frame: CGRect(x: CGRectGetMaxX(view2.frame)+15, y: 17, width: width, height: 180))
        
        
        self.addSubview(view1)
        self.addSubview(view2)
        self.addSubview(view3)
    
    }
    func fillData(classData:NSArray){
        view1.fillData((classData[0] as? NSArray)!)
        view2.fillData((classData[1] as? NSArray)!)
        view3.fillData((classData[2] as? NSArray)!)
    }
    func fillOnlineData(classData:NSArray){
    
        view1.fillOnlineData((classData[0] as? NSArray)!)
        view2.fillOnlineData((classData[1] as? NSArray)!)
        view3.fillOnlineData((classData[2] as? NSArray)!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
