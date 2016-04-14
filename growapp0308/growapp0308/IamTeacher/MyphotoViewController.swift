//
//  MyphotoViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/13.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit


class MyphotoViewController: UIViewController {

    var collectionView:UICollectionView!
    let imgUrl = ["MyPhoto1","MyPhoto1","MyPhoto1","MyPhoto1","MyPhoto1","MyPhoto1","MyPhoto1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GrayColor_F1F2F7
        self.navigationItem.title = "我的照片"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
       
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let swidth:CGFloat = 15
        let sheight:CGFloat = 20
        let pictureWidth:CGFloat = (ScreenWidth - 4*swidth)/3
        let pictureHeight:CGFloat = pictureWidth/1.57
        let crossButton = UIButton(frame: CGRect(x: swidth, y: sheight+58, width: pictureWidth, height: pictureHeight))
        crossButton.setImage(UIImage(named: "crossImg"), forState: .Normal)

        for i in 0..<imgUrl.count{
            let row:Int = (i+1)/3
            let line:Int = (i+1)%3
            let rows:CGFloat = CGFloat(row)
            let lines:CGFloat = CGFloat(line)
//            print("rows:\(rows)     lines:\(lines)")
            let myphotoImg:UIImageView!
            
            if rows == 0 {
               myphotoImg = UIImageView(frame: CGRect(x: swidth*(lines+1)+pictureWidth*(lines), y: 58+sheight, width: pictureWidth, height: pictureHeight))
                
               myphotoImg.image = UIImage(named: "Myphoto1")
                
            }
            else {
                myphotoImg = UIImageView(frame: CGRect(x: swidth*(lines+1)+pictureWidth*lines, y: 58+sheight*(rows+1)+pictureHeight*rows, width: pictureWidth, height: pictureHeight))
                
                myphotoImg.image = UIImage(named: "Myphoto1")
            }
            
            
            self.view.addSubview(myphotoImg)
            
        }
        
        
        self.view.addSubview(crossButton)
        
        
        
        
    }
    
    
    
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func backbutton(sender:UIButton)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    




}
