//
//  PostViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/7.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {


    @IBOutlet var postTitle: UITextField!
    @IBOutlet var postContent: UITextView!
    
    
    @IBOutlet var genCat: UIButton!
    @IBAction func genCat(sender: AnyObject) {
        self.disCatBtn()
    }
    
    @IBOutlet var lzqCat: UIButton!
    @IBAction func lzqCat(sender: AnyObject) {
        self.disCatBtn()
    }
    
    @IBOutlet var appCat: UIButton!
    @IBAction func appCat(sender: AnyObject) {
        self.disCatBtn()
    }

    
    @IBOutlet var wCat: UIButton!
    @IBAction func wCat(sender: AnyObject) {
        self.disCatBtn()
    }

    @IBOutlet var fronCat: UIButton!
    @IBAction func fronCat(sender: AnyObject) {
        self.disCatBtn()
    }
    
    @IBOutlet var backCat: UIButton!
    @IBAction func backCat(sender: AnyObject) {
        self.disCatBtn()
    }
    
    @IBOutlet var sysCat: UIButton!
    @IBAction func sysCat(sender: AnyObject) {
        self.disCatBtn()
    }
    
    @IBOutlet var jinLab: UIButton!
    @IBAction func jinLab(sender: AnyObject) {
        self.disLabBtn()
    }
    
    @IBOutlet var testLab: UIButton!
    @IBAction func testLab(sender: AnyObject) {
        self.disLabBtn()
    }
    
    @IBOutlet var needLab: UIButton!
    @IBAction func needLab(sender: AnyObject) {
        self.disLabBtn()
    }
    
    @IBOutlet var helpab: UIButton!
    @IBAction func helpLab(sender: AnyObject) {
        self.disLabBtn()
    }
    
    @IBOutlet var hasLab: UIButton!
    @IBAction func hasLab(sender: AnyObject) {
        self.disLabBtn()
    }
    
    @IBAction func clearBtn(sender: AnyObject) {
        self.enableAllBtn()
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "发表"
        self.postContent.layer.borderWidth = 1
        self.postContent.layer.borderColor = UIColor(red: 193/255, green: 193/255, blue: 192/255, alpha: 0.9).CGColor
        self.postContent.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func enableAllBtn(){
        self.genCat.enabled = true
        self.lzqCat.enabled = true
        self.appCat.enabled = true
        self.wCat.enabled = true
        self.fronCat.enabled = true
        self.backCat.enabled = true
        self.sysCat.enabled = true
        
        self.jinLab.enabled = true
        self.testLab.enabled = true
        self.needLab.enabled = true
        self.helpab.enabled = true
        self.hasLab.enabled = true
    }
    
    func disCatBtn(){
        self.genCat.enabled = false
        self.lzqCat.enabled = false
        self.appCat.enabled = false
        self.wCat.enabled = false
        self.fronCat.enabled = false
        self.backCat.enabled = false
        self.sysCat.enabled = false
    }
    func disLabBtn(){
        self.jinLab.enabled = false
        self.testLab.enabled = false
        self.needLab.enabled = false
        self.helpab.enabled = false
        self.hasLab.enabled = false
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
