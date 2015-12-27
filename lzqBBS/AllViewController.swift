//
//  ViewController.swift
//  TableViewFun
//
//  Created by 郭晓天 on 15/12/20.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit

class AllViewController: UITableViewController {
    


    
    var data = ["😄 Haha","🐱 猫咪","🐶 gougou","🎄 圣诞"];

    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
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
        let text = data[indexPath.row];
        cell.textLabel?.text = text;
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
}

//extension AllViewController:UITableViewDataSource,UITableViewDelegate{
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("AllViewCell", forIndexPath: indexPath);
//        let text = data[indexPath.row];
//        cell.textLabel?.text = text;
//        return cell;
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        normalText = cell?.textLabel?.text
//        performSegueWithIdentifier("showNormalViewController", sender: nil);
//    }
    
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showNormalViewController" {
//            let viewController = segue.destinationViewController as! NormalViewController;
//            
//            viewController.normalText = normalText;
//            
//        }
//    }
    
    
//}

