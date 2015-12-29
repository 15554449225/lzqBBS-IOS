//
//  DetailViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/27.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController {
    
    @IBOutlet var webview: UIWebView!
    
    var Id:String?

    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        super.viewDidLoad()
        self.setData(Id!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(id:String){
        let data = forum()
        data.getById(id, callback: {(result) in
            let JsonStr = JSON(result)
            let HTMLStr = JsonStr["included"][0]["attributes"]["contentHtml"].string
            self.webview.loadHTMLString(HTMLStr!,baseURL:nil)
//            self.webview.loadRequest(NSURLRequest(URL: NSURL(string: "http://bbs.lzqstd.net/d/\(id)")!))
            
        })
    }
}
