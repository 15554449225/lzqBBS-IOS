//
//  SubCateViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/21.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

/// tab 界面
import UIKit
import SwiftyJSON

class SubCateViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tagNameEn:String?
    var tableView:UITableView?
    
    var SectionNum:Int = 0
    var seletedId:String?
    var data:[[String:String]]?
    var page:Int = 0
    var referenceCell: SubCatTableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 110, width:UIScreen.mainScreen().bounds.width , height: UIScreen.mainScreen().bounds.height-150)
        self.tableView = UITableView(frame: self.view.frame, style:UITableViewStyle.Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView()
        
        let nib = UINib(nibName: "SubCatTableViewCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: "subCatTableViewCellXib")
        
        self.view.addSubview(self.tableView!)
        self.tableView!.mj_header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView!.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: nextPage)
        
        //开始刷新数据
        self.tableView!.mj_header.beginRefreshing()
        //加载数据
        refreshHeader()
        
        //设置bar字体颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.SectionNum
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCatTableViewCellXib", forIndexPath: indexPath) as! SubCatTableViewCell;
        cell.updateCell(self.data![indexPath.row])
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data!.count
    }
    //点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.seletedId = self.data![indexPath.row]["id"]
        //跳转
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("DetailControllerStory") as! DetailViewController
        vc.Id = self.seletedId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //刷新数据的函数
    func refreshHeader(){
        let allData = forum()
        allData.getByTag(0,tag: self.tagNameEn!, callback: {(result) in
            self.SectionNum = 1
            self.data = result
            if(self.data?.count < 20){
                self.tableView?.mj_footer = nil
            }
            dispatch_async(dispatch_get_main_queue()) {
                //获取数据后，重新加载tableview 的data
                self.tableView!.reloadData()
            }
            self.tableView!.mj_header.endRefreshing()
        })
    }
    
    func nextPage(){
        self.page += 1
        self.tableView!.mj_footer.endRefreshing()
        let allData = forum()
        allData.getByTag(self.page,tag: self.tagNameEn!, callback: {(result) in
            print(result)
            for(var i = 0 ; i < result.count ; i++){
                self.data?.append(result[i])
            }
            // dispatch_async(dispatch_get_main_queue()) {
            self.tableView!.reloadData()
            //}
            self.tableView!.mj_footer.endRefreshing()
            if(self.data?.count < 40){
                self.tableView?.mj_footer = nil
            }
        })
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
