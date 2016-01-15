//
//  SubCateViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/21.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

/// tab 界面
import UIKit

class SubCateViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var str:String?
    var tableView:UITableView?
    var newArray = ["😄 Haha","🐱 猫咪","🐶 gougou","🎄 圣诞"];

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.frame, style:UITableViewStyle.Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        let nib = UINib(nibName: "SubCatTableViewCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: "subCatTableViewCellXib")
        
        self.view.addSubview(self.tableView!)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCatTableViewCellXib", forIndexPath: indexPath) as! SubCatTableViewCell;
        cell.Num.text = "10"
        cell.Title.text = newArray[indexPath.row]
        cell.Time.text = newArray[indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
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
