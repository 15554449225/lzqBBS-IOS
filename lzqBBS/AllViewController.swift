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
        self.view.backgroundColor = UIColor(red: 235, green: 237, blue: 240, alpha: 0.9)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.estimatedRowHeight = 120;
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
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
        return 91
    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AllViewCell", forIndexPath: indexPath) as! PostCell;
        let text = newArray[indexPath.row];
//        cell.textLabel?.text = text;
        cell.Title.text = text
        cell.Time.text = "三分钟前"
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
    
    
//    var prototypeCell:PostCell?
//    
//    private func configureCell(cell:PostCell,indexPath: NSIndexPath,isForOffscreenUse:Bool){
//        
//        //        let item: AnyObject = self.data[indexPath.row]
//        //        cell.title.text = item.valueForKey("title") as? String
//        //        cell.channelName.text
//        cell.selectionStyle = .None;
//    }
//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        if prototypeCell == nil
//        {
//            self.prototypeCell = self.tableView.dequeueReusableCellWithIdentifier("AllViewCell") as? PostCell
//        }
//        
//        self.configureCell(prototypeCell!, indexPath: indexPath, isForOffscreenUse: false)
//        
//        self.prototypeCell?.setNeedsUpdateConstraints()
//        self.prototypeCell?.updateConstraintsIfNeeded()
//        self.prototypeCell?.setNeedsLayout()
//        self.prototypeCell?.layoutIfNeeded()
//        let size = self.prototypeCell!.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//        
//        return size.height;
//        
//    }
}

