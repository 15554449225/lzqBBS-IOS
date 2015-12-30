//
//  ViewController.swift
//  TableViewFun
//
//  Created by 郭晓天 on 15/12/20.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit
import SwiftyJSON

class AllViewController: UITableViewController {
    

    var SectionNum:Int = 0
    var seletedId:String?
    var data:[[String:String]]?
    var page:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.greenColor()   
        self.view.backgroundColor = UIColor(red: 235, green: 237, blue: 240, alpha: 0.9)
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 120;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "PostCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "PostCellXib")
        

        
        //上拉刷新
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: nextPage)
        
        
        self.tableView.mj_header.beginRefreshing()
        refreshHeader()
        
    }
    

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.SectionNum
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCellXib", forIndexPath: indexPath) as! PostCell;
        cell.Title.text = self.data![indexPath.row]["title"]
        cell.AuthorTime.text = self.data![indexPath.row]["startTime"]
        cell.Num.text = self.data![indexPath.row]["commentsCount"]
        return cell;
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data!.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.seletedId = self.data![indexPath.row]["id"]
        performSegueWithIdentifier("showDetailSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            let viewController = segue.destinationViewController as! DetailViewController
            viewController.Id = seletedId
        }
    }
    
    func refreshHeader(){
        let allData = forum()
        allData.getAllArr(0, callback: {(result) in
            self.SectionNum = 1
            self.data = result
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
            self.tableView.mj_header.endRefreshing()
        })
    }
    
    func nextPage(){
        self.page += 1
        self.tableView.mj_footer.endRefreshing()
        let allData = forum()
        allData.getAllArr(self.page, callback: {(result) in
            self.SectionNum = 1
            for(var i = 0 ; i<20 ; i++){
                self.data?.append(result[i])
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
            
//            self.tableView.reloadData()
            self.tableView.mj_footer.endRefreshing()
        })
    }
    

}

