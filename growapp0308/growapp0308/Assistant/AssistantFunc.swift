//
//  AssistantFunc.swift
//  growapp0308
//
//  Created by Arthur on 16/3/16.
//  Copyright © 2016年 kiko. All rights reserved.
//

import Foundation
import UIKit

func geturlImg(imgurl:String) -> UIImage{
    
   
    let url = NSURL.init(string: imgurl)
    let data = NSData.init(contentsOfURL: url!)
    let img = UIImage(data: data!)
    return img!
    
    
}