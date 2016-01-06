//
//  DetailViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/27.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit
import SwiftyJSON


 /// 跳转过来的内容详细页



class DetailViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var Id:String?
    var data:[[String:String]]?
    var section = 0
    var referenceCell: DetailCell?
    var cellHeight:Dictionary<Int,CGFloat> = [1:1]

    @IBOutlet var tableView: UITableView!
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postTags: UILabel!
    @IBOutlet var postNum: UILabel!
    
    override func viewDidLoad() {
        self.showLoadingView()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 90;
        
        let myForum = forum()
        myForum.getDetailById(Id!, callback: {(result) in
            if result == true{
                self.postTitle.text = myForum.postInfo!["title"]
                self.postNum.text = myForum.postInfo!["commentsCount"]
                self.postTags.text = myForum.postInfo!["tag"]
                
                self.section = 1
                self.data = myForum.commentsInfo
                self.cellHeight.removeAll()
                self.tableView.reloadData()
            }
        })
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.section
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (data?.count)!
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailCell
        
        dispatch_async(dispatch_get_main_queue()) {
            cell.updateCell(self.data![indexPath.row])
        }
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(self.referenceCell == nil){
            self.referenceCell = tableView.dequeueReusableCellWithIdentifier("DetailCell") as? DetailCell
        }
        
        if(self.cellHeight.count != self.data?.count){
            self.referenceCell!.updateCell(data![indexPath.row])
            self.referenceCell?.setNeedsUpdateConstraints()
            self.referenceCell?.updateFocusIfNeeded()
            self.referenceCell?.setNeedsLayout()
            self.referenceCell?.layoutIfNeeded()
            let size = self.referenceCell?.content.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            self.saveCellHeight(indexPath.row, height: (size?.height)!+50)
            return ((size?.height)! + 50)
        }else{
            return self.cellHeight[indexPath.row]!
        }
    }
    
    func saveCellHeight(index:Int,height:CGFloat){
        self.cellHeight[index] = height
    }
    
    func showLoadingView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "这是默认带菊花的提示"
        //背景渐变效果
        hud.dimBackground = true
        
        //延迟隐藏
        hud.hide(true, afterDelay: 0.8)
    }
}
