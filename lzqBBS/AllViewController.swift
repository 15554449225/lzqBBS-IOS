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
    var Section:Int = 0
    var seletedId:String?
    var data:[[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.greenColor()   
        self.view.backgroundColor = UIColor(red: 235, green: 237, blue: 240, alpha: 0.9)
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.estimatedRowHeight = 120;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "PostCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "PostCellXib")
        
        let allData = forum();
        allData.getAll{result in
            let jsonStr = JSON(result)["data"]
            for (_,subJson):(String, JSON) in jsonStr {
                self.IDArray.append(subJson["id"].string!)
                self.newArray.append(subJson["attributes"]["title"].string!)
            }
            self.Section = 1
            self.tableView.reloadData()
        }
        
        allData.getAllArr()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.Section
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCellXib", forIndexPath: indexPath) as! PostCell;
        let text = newArray[indexPath.row]
        let id = IDArray[indexPath.row]
        cell.Title.text = text
        cell.Num.text = id
        
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

