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

class DetailViewController: UITableViewController {
    
    var Id:String?
    var data:[[String:String]]?
    var section = 0


    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postTags: UILabel!
    @IBOutlet var postNum: UILabel!
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.tableView = UITableView.re
        
        self.tableView.tableFooterView = UIView()
        
        let myForum = forum()
        myForum.getDetailById(Id!, callback: {(result) in
            if result == true{
                self.postTitle.text = myForum.postInfo!["title"]
                self.postNum.text = myForum.postInfo!["commentsCount"]
                self.postTags.text = myForum.postInfo!["tag"]
                
                self.section = 1
                self.data = myForum.commentsInfo
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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.section
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (data?.count)!
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailCell
    
        cell.username.text = data![indexPath.row]["username"]
        cell.time.text = data![indexPath.row]["time"]
        cell.content.text = data![indexPath.row]["contentHtml"]
        if(data![indexPath.row]["avator"] != "nil"){
            let avatorUrl = NSURL(string:data![indexPath.row]["avator"]!)
            let image = UIImage(data: NSData(contentsOfURL: avatorUrl!)!)
            cell.avator.image = image
        }
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
//    func setData(id:String){
//        let data = forum()
//        data.getById(id, callback: {(result) in
//            let JsonStr = JSON(result)
//            let HTMLStr = JsonStr["included"][0]["attributes"]["contentHtml"].string
//            
////            self.webview.loadHTMLString(HTMLStr!,baseURL:nil)
////            self.webview.loadRequest(NSURLRequest(URL: NSURL(string: "http://bbs.lzqstd.net/d/\(id)")!))
//        })
//        
//        data.getDetailById(id, callback: {(result) in
//            if result == true{
//                self.postTitle.numberOfLines = 0
//                self.postTitle.text = data.postInfo!["title"]
//                self.postTag.text = data.postInfo!["tag"]
//                self.postNum.text = data.postInfo!["commentsCount"]
//                self.authorName.text = data.postInfo!["userName"]
//                self.authorPostTime.text = data.postInfo!["startTime"]
//                
//                if(data.postInfo!["avatar"] != "nil"){
//                    let avatorUrl = NSURL(string:data.postInfo!["avatar"]!)
//                    let data = NSData(contentsOfURL: avatorUrl!)
//                    let image = UIImage(data: data!)
//                    self.authorAvator.image = image
//                    self.authorAvator.layer.cornerRadius = 15
//                }
//                
//                
//            }
//        })
//    }
}
