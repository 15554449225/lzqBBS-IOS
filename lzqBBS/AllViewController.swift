//
//  ViewController.swift
//  TableViewFun
//
//  Created by 郭晓天 on 15/12/20.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit
import SwiftyJSON

/// 第一个界面 全部讨论

class AllViewController: UITableViewController {
    

    var SectionNum:Int = 0
    var seletedId:String?
    var data:[[String:String]]?
    var page:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置view 背景
        self.view.backgroundColor = UIColor(red: 235, green: 237, blue: 240, alpha: 0.9)
        
        //去掉每个cell的分割线
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        //去掉没有内容cell分割线  多余的分割线
        self.tableView.tableFooterView = UIView()
        
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 90;
        
        
        //加载nib cell元素
//        let nib = UINib(nibName: "PostCell", bundle: nil)
//        self.tableView.registerNib(nib, forCellReuseIdentifier: "PostCellXib")
        
        //上拉刷新&&下拉加载
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: nextPage)
        
        //开始刷新数据
        self.tableView.mj_header.beginRefreshing()
        //加载数据
        refreshHeader()
        
        //设置bar字体颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发表", style: .Plain, target: self, action: "postTopic")
    }
    
    

    func postTopic(){
        let userData = NSUserDefaults.standardUserDefaults()
        if(userData.objectForKey("identification") != nil){
            self.performSegueWithIdentifier("postSegue", sender: nil)
        }else{
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
        }
    }
    
    //返回每一行的高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //返回section数量
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.SectionNum
    }
    
    //cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PrototypeCells", forIndexPath: indexPath) as! PostCell;
        cell.Title.text = self.data![indexPath.row]["title"]
        cell.Time.text = self.data![indexPath.row]["startTime"]
        cell.Num.text = self.data![indexPath.row]["commentsCount"]
        return cell;
    }

    //返回cell数量
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data!.count
    }
    
    //点击事件
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.seletedId = self.data![indexPath.row]["id"]
        //跳转
        performSegueWithIdentifier("showDetailSegue", sender: nil)
    }
    
    //跳转函数，上方调用的
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            let viewController = segue.destinationViewController as! DetailViewController
            segue.destinationViewController.hidesBottomBarWhenPushed = true
            viewController.Id = seletedId
        }
    }
    
    //刷新数据的函数
    func refreshHeader(){
        let allData = forum()
        allData.getAllArr(0, callback: {(result) in
            self.SectionNum = 1
            self.data = result
            dispatch_async(dispatch_get_main_queue()) {
                //获取数据后，重新加载tableview 的data
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
//            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
//            }
            self.tableView.mj_footer.endRefreshing()
        })
    }
    

}

