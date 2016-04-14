//
//  testviewController.swift
//  growapp0308
//
//  Created by Arthur on 16/3/14.
//  Copyright © 2016年 kiko. All rights reserved.
//

import UIKit

class testviewController: UIViewController, NSURLSessionDataDelegate {

    var config:NSURLSessionConfiguration!
    var session:NSURLSession!
    var task:NSURLSessionDataTask!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config = NSURLSessionConfiguration.init()
        session = NSURLSession.init(configuration: config, delegate: self, delegateQueue: nil)
        
        task = NSURLSessionDataTask.init()
        let str:String = "http://localhost:8080/LabLibManageSystem/account/testdemo"
        let url:NSURL = NSURL.init(string: str)!
        let request:NSURLRequest = NSURLRequest.init(URL: url)

        
        session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
        
//            let mydate:NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.init(rawValue: 0)) as! NSDictionary
            print(data!)
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    

}
