//
//  OrderViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/31.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    let orderData = ["orderPic","快译通M9 学习机小学初中高中10.1英寸学生平板电脑同步教材点读机 简装标配+键盘皮套","颜色分类：银色","版本：简装标配+8G内存卡","1","¥105.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "确认订单"
        self.view.backgroundColor = GrayColor_F1F2F7
        
        
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let downView = orderDownButton(frame: CGRect(x: 0, y: ScreenHeight-60, width: ScreenWidth, height: 60),data: "100.00")
        
        
       
        
        let orderTable:UITableView!
        orderTable = UITableView(frame: CGRectMake(0, 0,UIScreen.mainScreen().bounds.width, ScreenHeight-60))
        orderTable.delegate = self
        orderTable.dataSource = self
        orderTable.separatorStyle = UITableViewCellSeparatorStyle.None
        orderTable.backgroundColor = UIColor.clearColor()
        self.view.insertSubview(orderTable, belowSubview: backbutton)
        
        self.view.addSubview(backbutton)
        self.view.addSubview(downView)

    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 1
        case 1: return 1
        case 2: return 4
        default: return 0
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else{
            return 10
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return 55
        }
        if indexPath.section == 1 && indexPath.row == 0{
            return 115
        }
        else{
            return 50
        }

    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            let headerview = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 10))
            headerview.backgroundColor = GrayColor_F1F2F7
            headerview.layer.borderColor = GrayColor_E2E2E2.CGColor
            headerview.layer.borderWidth = 0.7
            return headerview
        }
        else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("addAddress")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "addAddress")
            }
            let btn = UIButton(frame:CGRect(x: ScreenWidth/2-35, y: 15, width: 70, height: 25))
            btn.setTitle("添加地址", forState: .Normal)
            btn.setTitleColor(purple_9999FF, forState: .Normal)
            btn.layer.cornerRadius = 4
            btn.layer.borderWidth = 1
            btn.layer.borderColor = purple_9999FF.CGColor
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            cell?.addSubview(btn)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
        if indexPath.section == 1 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("addAddress") as? orderDetailTableViewCell
            if cell == nil {
                cell = orderDetailTableViewCell(style: .Default, reuseIdentifier: "addAddress")
            }
            cell?.filldata(orderData)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            return cell!
        }
        
       
        if indexPath.section == 2 && indexPath.row == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier("payType")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "payType")
                let type = UILabel(frame: CGRect(x: 10, y: 15, width: 100, height: 20))
                type.text = "支付方式"
                type.font = UIFont.systemFontOfSize(15)
                type.textColor = textColor_333333
                
                let chooseButton = UIImageView(frame: CGRect(x: ScreenWidth-120, y: 15, width: 20, height: 20))
                let choosePic = UIImageView(frame: CGRect(x: chooseButton.frame.maxX+10, y: 10, width: 80, height: 30))
                chooseButton.image = UIImage(named: "single selection")
                choosePic.image = UIImage(named: "zhifubao")
                choosePic.contentMode = .ScaleAspectFit
                
                let downLine = GrayLineView(frame: CGRect(x: 0, y: 50, width: 1, height: 1))
                
                cell?.contentView.addSubview(downLine)
                cell?.contentView.addSubview(type)
                cell?.contentView.addSubview(chooseButton)
                cell?.contentView.addSubview(choosePic)
                
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            }
            return cell!
        }
        
        if indexPath.section == 2 && indexPath.row == 1{
            var cell = tableView.dequeueReusableCellWithIdentifier("buyAmount")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "buyAmount")
                let type = UILabel(frame: CGRect(x: 10, y: 15, width: 100, height: 20))
                type.text = "购买数量"
                type.font = UIFont.systemFontOfSize(15)
                type.textColor = textColor_333333
                
                let amount = NBCountView(frame: CGRect(x: ScreenWidth-120, y: 15, width: 100, height: 20))
                
                let downLine = GrayLineView(frame: CGRect(x: 0, y: 50, width: 1, height: 1))
                
                cell?.contentView.addSubview(downLine)
                cell?.contentView.addSubview(type)
                cell?.contentView.addSubview(amount)
                
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            }
            return cell!
        }
        
        if indexPath.section == 2 && indexPath.row == 2{
            var cell = tableView.dequeueReusableCellWithIdentifier("ticket")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "ticket")
                
                let boxImage = UIImageView(frame: CGRect(x: ScreenWidth-120, y: 15, width: 20, height: 20))
                boxImage.contentMode = .ScaleAspectFit
                boxImage.image = UIImage(named: "cart_checkbox-selected")
                
                let label = UILabel(frame: CGRect(x: boxImage.frame.maxX+10, y: 15, width: 80, height: 20))
                label.textColor = textColor_333333
                label.font = UIFont.systemFontOfSize(14)
                label.text = "使用优惠券"
             
                
                let downLine = GrayLineView(frame: CGRect(x: 0, y: 50, width: 1, height: 1))
                
                cell?.contentView.addSubview(downLine)
                cell?.contentView.addSubview(boxImage)
                cell?.contentView.addSubview(label)

                
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            }
            return cell!
        }
        if indexPath.section == 2 && indexPath.row == 3{
            var cell = tableView.dequeueReusableCellWithIdentifier("total")
            if cell == nil {
                cell = UITableViewCell(style: .Default, reuseIdentifier: "total")
                
                let cartNum = UILabel(frame: CGRect(x: ScreenWidth-200, y: 15, width: 60, height: 20))
                cartNum.textColor = textColor_666666
                cartNum.font = UIFont.systemFontOfSize(13)
                cartNum.text = "共1件商品"
                
                let cartMoney = UILabel(frame: CGRect(x: cartNum.frame.maxX+15, y: 15, width: 100, height: 20))
                cartMoney.textColor = textColor_666666
                cartMoney.font = UIFont.systemFontOfSize(13)
                cartMoney.text = "总计：¥ 105.00"
                
                
                let downLine = GrayLineView(frame: CGRect(x: 0, y: 50, width: 1, height: 1))
                
                cell?.contentView.addSubview(downLine)
                cell?.contentView.addSubview(cartNum)
                cell?.contentView.addSubview(cartMoney)
                
                
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            }
            return cell!
        }
        
        return UITableViewCell()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func backbutton(sender:UIButton){
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    


}
