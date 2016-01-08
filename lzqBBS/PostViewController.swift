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
        self.tag1("1")
        self.disCatBtn()
    }
    
    @IBOutlet var lzqCat: UIButton!
    @IBAction func lzqCat(sender: AnyObject) {
        self.tag1("22")
        self.disCatBtn()
    }
    
    @IBOutlet var appCat: UIButton!
    @IBAction func appCat(sender: AnyObject) {
        self.tag1("19")
        self.disCatBtn()
    }

    
    @IBOutlet var wCat: UIButton!
    @IBAction func wCat(sender: AnyObject) {
        self.tag1("20")
        self.disCatBtn()
    }

    @IBOutlet var fronCat: UIButton!
    @IBAction func fronCat(sender: AnyObject) {
        self.tag1("3")
        self.disCatBtn()
    }
    
    @IBOutlet var backCat: UIButton!
    @IBAction func backCat(sender: AnyObject) {
        self.tag1("12")
        self.disCatBtn()
    }
    
    @IBOutlet var sysCat: UIButton!
    @IBAction func sysCat(sender: AnyObject) {
        self.tag1("13")
        self.disCatBtn()
    }
    
    @IBOutlet var jinLab: UIButton!
    @IBAction func jinLab(sender: AnyObject) {
        self.tag2("10")
        self.disLabBtn()
    }
    
    @IBOutlet var testLab: UIButton!
    @IBAction func testLab(sender: AnyObject) {
        self.tag2("11")
        self.disLabBtn()
    }
    
    @IBOutlet var needLab: UIButton!
    @IBAction func needLab(sender: AnyObject) {
        self.tag2("18")
        self.disLabBtn()
    }
    
    @IBOutlet var helpab: UIButton!
    @IBAction func helpLab(sender: AnyObject) {
        self.tag2("9")
        self.disLabBtn()
    }
    
    @IBOutlet var hasLab: UIButton!
    @IBAction func hasLab(sender: AnyObject) {
        self.tag2("2")
        self.disLabBtn()
    }
    
    @IBAction func clearBtn(sender: AnyObject) {
        self.enableAllBtn()
    }
    @IBAction func post(sender: AnyObject) {
        forum().postTopic()
    }

    var tag1:String = ""
    var tag2:String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "发表"
        self.postContent.layer.borderWidth = 1
        self.postContent.layer.borderColor = UIColor(red: 193/255, green: 193/255, blue: 192/255, alpha: 0.9).CGColor
        self.postContent.layer.cornerRadius = 6
        User().updateUserToken{(result) in
            print(result)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tag1(tagId:String){
        self.tag1 = tagId
    }
    func tag2(tagId:String){
        self.tag2 = tagId
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
