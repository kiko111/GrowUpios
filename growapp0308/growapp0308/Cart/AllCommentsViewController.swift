//
//  AllCommentsViewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/25.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class AllCommentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let head = ["全部(3)","好评(2)","中评(1)","差评(0)"]
    let allcommentData = [["head portrait_2","1536***5963","不错的早教机，质量很好，发音清晰，很漂亮，孩子很喜欢玩。外包装很结实，发货很及时物流也很快，态度很好很热情，有问必答，很有耐心满意啊","2015-10-15 09:35","颜色分类 :  黑色",""],["head portrait_2","1536***5963","不错的早教机，质量很好，发音清晰，很漂亮，孩子很喜欢玩。外包装很结实，发货很及时物流也很快，态度很好很热情，有问必答，很有耐心满意啊","2015-10-15 09:35","颜色分类 :  黑色",["commentsPic","commentsPic","commentsPic"]],["head portrait_2","1536***5963","不错的早教机，质量很好，发音清晰，很漂亮，孩子很喜欢玩。外包装很结实，发货很及时物流也很快，态度很好很热情，有问必答，很有耐心满意啊","2015-10-15 09:35","颜色分类 :  黑色",""],["head portrait_2","1536***5963","不错的早教机，质量很好，发音清晰，很漂亮，孩子很喜欢玩。外包装很结实，发货很及时物流也很快，态度很好很热情，有问必答，很有耐心满意啊","2015-10-15 09:35","颜色分类 :  黑色",["commentsPic","commentsPic","commentsPic"]]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "评价"
        
        
        
        let img=UIImage(named: "backblue")
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width:9, height: 18))
        backbutton.setBackgroundImage(img, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        backbutton.addTarget(self, action: "backbutton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        addtitle(CGRect(x: 0, y: 65, width: 0, height: 0))
        let line = GrayLineView(frame: CGRect(x: 0, y: 95, width: 0, height: 0))
        self.view.addSubview(line)
        
        
        let commentsTable:UITableView!
        commentsTable = UITableView(frame: CGRectMake(0, 96,UIScreen.mainScreen().bounds.width, ScreenHeight-90))
        commentsTable.delegate = self
        commentsTable.dataSource = self
        commentsTable.separatorStyle = UITableViewCellSeparatorStyle.None
        commentsTable.backgroundColor = UIColor.clearColor()
        self.view.insertSubview(commentsTable, belowSubview: backbutton)
        
        self.view.addSubview(backbutton)

        
        
    }
    
    func addtitle(frame:CGRect){
        let  num = head.count
        for(var i = 0;i<num;i++){
            let btn = UIButton(frame: CGRect(x: CGFloat(i)*ScreenWidth/CGFloat(num), y: frame.minY, width: ScreenWidth/CGFloat(num), height: 30))
            btn.setTitle(head[i], forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14.5)
            btn.setTitleColor(textColor_666666, forState: .Normal)
            btn.addTarget(self, action: "chooseTitle:", forControlEvents: .TouchUpInside)
            self.view.addSubview(btn)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allcommentData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("allcomments") as? CommentsTableViewCell
        if cell == nil {
            cell = CommentsTableViewCell(style: .Default, reuseIdentifier: "allcomments")
            
        }
        cell?.filldata(allcommentData[indexPath.row],downLineType: 1)
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if allcommentData[indexPath.row][5] != ""{
            return 200
        }
        else {
            return 110
        }
    }
    
    func backbutton(sender:UIButton){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewControllerAnimated(true)
        
    }


}
