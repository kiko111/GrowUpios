//
//  ScrollViewTableViewCell.swift
//  growapp0308
//
//  Created by Arthur on 16/3/9.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class ScrollViewTableViewCell: UITableViewCell,UIScrollViewDelegate {

    private var scrollView:UIScrollView!
    private var pageCtr:UIPageControl!
    
    
    var kimgCount:Int!
    let scrollY:CGFloat = 10
    let pageCtrlWidth:CGFloat = 100
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }

    init(style: UITableViewCellStyle, reuseIdentifier: String?,bannerUrlArray:NSArray,imgHeight:CGFloat){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        kimgCount = bannerUrlArray.count
        
        self.initScrollView(bannerUrlArray,imgHeight: imgHeight)
        self.initPageControl(imgHeight-20)
        let grayline = GrayLineView(frame: CGRect(x: 0, y: self.scrollView.frame.maxY, width: ScreenWidth, height: 1))
        self.insertSubview(grayline, aboveSubview: scrollView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func initScrollView(banerUrl:NSArray,imgHeight:CGFloat){
        self.scrollView = UIScrollView.init(frame:CGRectMake(0, 0 , UIScreen.mainScreen().bounds.width, imgHeight))
        self.scrollView.delegate = self
        for (var i=0;i<kimgCount;i++){
            let imgview = UIImageView(frame: CGRect(x: CGFloat(i) * UIScreen.mainScreen().bounds.width, y: 0, width: UIScreen.mainScreen().bounds.width, height: imgHeight))
            imgview.image = geturlImg(banerUrl[i] as! String)
//            imgview.contentMode = UIViewContentMode.ScaleAspectFit
            self.scrollView.addSubview(imgview)
        }
        self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width * CGFloat(kimgCount), imgHeight)
        self.scrollView.pagingEnabled = true
        self.addSubview(self.scrollView)
    }
    
    func initPageControl(setoffY:CGFloat){
        self.pageCtr = UIPageControl(frame:CGRect(x: (ScreenWidth-pageCtrlWidth)/2-30, y: setoffY, width: pageCtrlWidth, height: 10))
     
        
//        self.pageCtr.center.x = UIScreen.mainScreen().bounds.width/2
        self.pageCtr.numberOfPages = kimgCount
        self.pageCtr.pageIndicatorTintColor = UIColor.blackColor()
        self.pageCtr.currentPageIndicatorTintColor = UIColor.grayColor()
        

        self.insertSubview(self.pageCtr, aboveSubview: self.scrollView)
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib() 
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            }

}
