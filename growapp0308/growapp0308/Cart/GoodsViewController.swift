//
//  GoodsViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/20.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class GoodsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    private var orderViewController = OrderViewController()
    var idString:String?
    
    let bannerUrl = ["http://10.104.4.222:8080/rest/img/goodsBanner1.png","http://10.104.4.222:8080/rest/img/goodsBanner1.png","http://10.104.4.222:8080/rest/img/goodsBanner1.png"]
    
    let goodsdata = ["快译通M9 学习机小学初中高中10.1英寸学生平板电脑同步教材点读机","家教机 简装标配＋键盘皮套 简装标配＋键盘皮套","298.00","105.00"]

    let commentsdata = ["head portrait_2","1536***5963","不错的早教机，质量很好，发音清晰，很漂亮，孩子很喜欢玩。外包装很结实，发货很及时物流也很快，态度很好很热情，有问必答，很有耐心满意啊","2015-10-15 09:35","颜色分类 :  黑色"]
    
    let goodsDetail = ["商品名称：快译通M9 学习机小学初中高中平板电脑","商品编号：1614113601","上架时间：2015-06-27 10:05:31","商品毛重：0.56Kg","附加功能：摄像头功能","屏幕尺寸：10英寸","适用人群：初中","内核：4核","容量：16G"]
    
    
    let part1Data = ["颜色分类","黑色","银色"]
    let part2Data = ["选择版本","简装标配＋8G内存","简装标配＋8G内存＋键盘皮套","简装标配＋8G内存＋键盘"]
    
    var pic:UIImageView!

    private var allCommentsViewController = AllCommentsViewController()
    
    private var cover:UIView!
    private var upview:UIView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cover = UIView(frame: CGRect(x: 0, y:0, width: UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height))
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 18, y: 30, width:12, height: 25))
        backbutton.setBackgroundImage(img, forState: .Normal)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        let downButton = UIButton(frame: CGRect(x: 0, y: ScreenHeight-60, width: ScreenWidth, height: 60))
        downButton.setTitle("加入购物车", forState: .Normal)
        downButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        downButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        downButton.backgroundColor = purple_9999FF
        
        self.view.addSubview(downButton)
        
        
        
        
        
        
        
        let goodsTable:UITableView!
        goodsTable = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, ScreenHeight-60))
        goodsTable.delegate = self
        goodsTable.dataSource = self
        goodsTable.separatorStyle = UITableViewCellSeparatorStyle.None
        goodsTable.backgroundColor = UIColor.clearColor()
//        self.view.insertSubview(goodsTable, belowSubview: backbutton)
        self.view.addSubview(goodsTable)
        self.view.addSubview(backbutton)
        
        
        

    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("topScrollViewCell") as? ScrollViewTableViewCell
            if cell == nil {
                cell = ScrollViewTableViewCell(style: .Default, reuseIdentifier: "topScrollViewCell",bannerUrlArray: self.bannerUrl,imgHeight: 185)
            }
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("topculumnCell") as? GoodsTopCulumnCell
            if cell == nil {
                cell = GoodsTopCulumnCell(style: .Default, reuseIdentifier: "topculumnCell")
            }
            cell?.filldata(goodsdata)
            cell?.buyButton.addTarget(self, action: "buy:", forControlEvents: UIControlEvents.TouchUpInside)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("sectionBCell")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "sectionBCell")
                let left = UILabel(frame: CGRect(x: 18, y: 9.2, width: 180, height: 20))
                left.text = "选择颜色分类  版本"
                left.font = UIFont.systemFontOfSize(15)
                left.textColor = textColor_333333
                
                let right = UIImageView(frame: CGRect(x: ScreenWidth-28, y: 12, width: 8, height: 15))
                right.image = UIImage(named: "arrow")
                
                cell?.contentView.addSubview(right)
                cell?.contentView.addSubview(left)
            }

            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
            
        if indexPath.section == 2 && indexPath.row == 0 {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("goodscomment") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "goodscomment")
            }
            cell?.leftText.text = "商品评价"
            cell?.leftText.font = UIFont.systemFontOfSize(14)
            cell?.rightText.setTitle("查看全部", forState: .Normal)
            cell?.rightText.titleLabel?.font = UIFont(name: "ArialMT", size: 13)
            cell?.arrow?.image = UIImage(named: "arrow")
            cell?.rightText.addTarget(self, action: "allComments:", forControlEvents: UIControlEvents.TouchUpInside)
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("breifcomments") as? CommentsTableViewCell
            if cell == nil {
                cell = CommentsTableViewCell(style: .Default, reuseIdentifier: "breifcomments")
            }
            cell?.filldata(commentsdata,downLineType: 0)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 3 && indexPath.row == 0 {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("goodscomment") as? TopbarTableViewCell
            if cell == nil {
                cell = TopbarTableViewCell(style: .Default, reuseIdentifier: "goodscomment")
                
                let line = GrayLineView(frame: CGRect(x: 0, y: 40, width: ScreenWidth, height: 0.7))
                cell?.addSubview(line)
                cell?.leftText.text = "商品详情"
                cell?.leftText.font = UIFont.systemFontOfSize(14)
                cell?.line.backgroundColor = UIColor.whiteColor()
            }

            
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 3 && indexPath.row == 1 {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("goodsdetail") as? GoodsDetailTableViewCell
            if cell == nil {
                cell = GoodsDetailTableViewCell(style: .Default, reuseIdentifier: "goodsdetail")
                
            }
            cell?.filldata(goodsDetail)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        if indexPath.section == 3 && indexPath.row == 2 {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("goodspic")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "goodspic")
                let image = UIImage(named: "goodsDetail")
                pic = UIImageView(frame: CGRect(x: 20, y: 10, width: ScreenWidth-40, height: (image?.size.height)! * (ScreenWidth-40)/(image?.size.width)!))
                pic.image = image

                pic.contentMode = UIViewContentMode.ScaleAspectFit
                cell?.contentView.addSubview(pic)

            }

            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
            
        else {
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return 2
            case 1: return 1
            case 2: return 2
            case 3: return 3
            default:return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 185
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            return 145
        }
        if indexPath.section == 1 && indexPath.row == 0 {
            return 40
        }
        if indexPath.section == 2 && indexPath.row == 0 {
            return 40
        }
        if indexPath.section == 2 && indexPath.row == 1 {
            return 130
        }
        if indexPath.section == 3 && indexPath.row == 0 {
            return 40
        }
        if indexPath.section == 3 && indexPath.row == 1 {
            return 120
        }
        if indexPath.section == 3 && indexPath.row == 2 {
            return 700
        }
        else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            return 10
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
        view.backgroundColor = GrayColor_F1F2F7
        view.layer.borderColor = GrayColor_E2E2E2.CGColor
        view.layer.borderWidth = 0.7
        return view
    }
    
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    

    func backbutton(sender:UIButton){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func allComments(sender:UIButton){
        self.navigationController?.pushViewController(allCommentsViewController, animated: false)
        
    }
    
    func buy (sender:UIButton){
        cover.backgroundColor = UIColor(red: 0, green:0, blue: 0, alpha: 0.4)
        self.view.addSubview(cover)
        upview = UIView(frame: CGRect(x: 0, y: ScreenHeight-350, width: ScreenWidth, height: 350))
        upview.backgroundColor = UIColor.whiteColor()
        let part1 = ChooseParameterView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 85), data: part1Data, isFirst: true, lineNum: 2, lineRows: 1,isBorderBlack:true)
        
        part1.cancelButton.addTarget(self, action: "cancelBuy:", forControlEvents: .TouchUpInside)
        
        let part2 = ChooseParameterView(frame: CGRect(x: 0, y: 81, width: ScreenWidth, height: 130), data: part2Data, isFirst: false, lineNum: 2, lineRows: 2,isBorderBlack:false)
//        
//        let part3 = chooseNumView(frame: CGRect(x: 0, y: 212, width: ScreenWidth, height: 90))
//        part3.tag = 333
//        part3.minusButton.addTarget(self, action: "changeNum:", forControlEvents: .TouchUpInside)
//        part3.addButton.addTarget(self, action: "changeNum:", forControlEvents: .TouchUpInside)
        let part3 = UILabel(frame: CGRect(x: 0, y: 212, width: 100, height: 40))
        part3.textAlignment = NSTextAlignment.Center
        part3.text = "购买数量"
        part3.textColor = textColor_333333
        let part5 = NBCountView.init(frame: CGRect(x: ScreenWidth-180, y: 220, width: 155, height: 30))
        
        
        let part4 = ClickButton(frame: CGRect(x: 0, y: 303, width: ScreenWidth, height: 50), backgroundColor: BlueColor_0192F2, text: "确定")
        
        part4.addTarget(self, action: "orderPage:", forControlEvents: .TouchUpInside)
        
        
        
        upview.addSubview(part1)
        upview.addSubview(part2)
        upview.addSubview(part3)
        upview.addSubview(part4)
        upview.addSubview(part5)
        self.view.addSubview(upview)
    }
    
    func changeNum(sender:UIButton){
//        switch sender.tag {
//        case 100:
//        case 101:
//        default: break
//        }
        
    }
    
    func cancelBuy(sender:UIButton){
        
        upview.removeFromSuperview()
        cover.removeFromSuperview()
        
    }
    func orderPage(sender:UIButton){
        self.navigationController?.pushViewController(orderViewController, animated: true)
    }
}
