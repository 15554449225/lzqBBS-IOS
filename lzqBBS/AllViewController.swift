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
    
//    var newArray = ["😄 Haha","🐱 猫咪","🐶 gougou","🎄 圣诞"];
//    var data:AnyObject?
    var newArray: Array<String> = []
    var IDArray: Array<String> = []

    var seletedId:String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let allData = forum();
        allData.getAll{result in
            let jsonStr = JSON(result)["data"]
            for (_,subJson):(String, JSON) in jsonStr {
                self.IDArray.append(subJson["id"].string!)
                self.newArray.append(subJson["attributes"]["title"].string!)
            }
            
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AllViewCell", forIndexPath: indexPath);
        let text = newArray[indexPath.row];
//        cell.detailTextLabel?.text = "1"
//        let titleLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 300, height: 50))
//        titleLabel.textColor = UIColor.blackColor()
//        titleLabel.text = text;
//        cell.addSubview(titleLabel)
//        let userLabel = UILabel(frame: CGRect(x: 20, y: 27, width: 300, height: 50))
//        userLabel.textColor = UIColor.grayColor()
//        userLabel.text = "xiaotian 发表于  5天前"
//        userLabel.numberOfLines = 0
//        cell.addSubview(userLabel)
//        cell.label.text = "ceshi"
        cell.textLabel?.text = text;
//        cell.detailTextLabel?.text = IDArray[indexPath.row]
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.seletedId = IDArray[indexPath.row]
        performSegueWithIdentifier("showDetailSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            let viewController = segue.destinationViewController as! DetailViewController
            viewController.Id = seletedId
        }
    }
}

