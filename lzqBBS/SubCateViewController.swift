//
//  SubCateViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/21.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

/// tab 界面
import UIKit

class SubCateViewController: UIViewController {
    
    var str:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textLabel = UILabel (frame:CGRectMake(self.view.frame.size.width/8,300,self.view.frame.size.width*3/4,300))
        textLabel.text = title
        textLabel.numberOfLines = 0
        self.view.addSubview(textLabel)
        
        let tt = UILabel (frame:CGRectMake(self.view.frame.size.width/8,400,self.view.frame.size.width*3/4,300))
        tt.text = str
        self.view.addSubview(tt)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
