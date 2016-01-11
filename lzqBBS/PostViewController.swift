//
//  PostViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/7.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit
import MBProgressHUD

class PostViewController: UIViewController,UITextViewDelegate {


    @IBOutlet var postTitle: UITextField!
    @IBOutlet var postContent: UITextView!
    
    
    @IBOutlet var genCat: UIButton!
    @IBAction func genCat(sender: AnyObject) {
        self.tag1("1",tagName: (self.genCat.titleLabel?.text)!)
        self.disCatBtn()
    }
    
    @IBOutlet var lzqCat: UIButton!
    @IBAction func lzqCat(sender: AnyObject) {
        self.tag1("22",tagName: (self.lzqCat.titleLabel?.text)!)
        self.disCatBtn()
    }
    
    @IBOutlet var appCat: UIButton!
    @IBAction func appCat(sender: AnyObject) {
        self.tag1("19",tagName: (self.appCat.titleLabel?.text)!)
        self.disCatBtn()
    }

    
    @IBOutlet var wCat: UIButton!
    @IBAction func wCat(sender: AnyObject) {
        self.tag1("20",tagName: (self.wCat.titleLabel?.text)!)
        self.disCatBtn()
    }

    @IBOutlet var fronCat: UIButton!
    @IBAction func fronCat(sender: AnyObject) {
        self.tag1("3",tagName: (self.fronCat.titleLabel?.text)!)
        self.disCatBtn()
    }
    
    @IBOutlet var backCat: UIButton!
    @IBAction func backCat(sender: AnyObject) {
        self.tag1("12",tagName: (self.backCat.titleLabel?.text)!)
        self.disCatBtn()
    }
    
    @IBOutlet var sysCat: UIButton!
    @IBAction func sysCat(sender: AnyObject) {
        self.tag1("13",tagName: (self.sysCat.titleLabel?.text)!)
        self.disCatBtn()
    }
    
    @IBOutlet var jinLab: UIButton!
    @IBAction func jinLab(sender: AnyObject) {
        self.tag2("10",tagName: (self.jinLab.titleLabel?.text)!)
        self.disLabBtn()
    }
    
    @IBOutlet var testLab: UIButton!
    @IBAction func testLab(sender: AnyObject) {
        self.tag2("11",tagName: (self.testLab.titleLabel?.text)!)
        self.disLabBtn()
    }
    
    @IBOutlet var needLab: UIButton!
    @IBAction func needLab(sender: AnyObject) {
        self.tag2("18",tagName: (self.needLab.titleLabel?.text)!)
        self.disLabBtn()
    }
    
    @IBOutlet var helpab: UIButton!
    @IBAction func helpLab(sender: AnyObject) {
        self.tag2("9",tagName: (self.helpab.titleLabel?.text)!)
        self.disLabBtn()
    }
    
    @IBOutlet var hasLab: UIButton!
    @IBAction func hasLab(sender: AnyObject) {
        self.tag2("2",tagName: (self.hasLab.titleLabel?.text)!)
        self.disLabBtn()
    }
    
    @IBAction func clearBtn(sender: AnyObject) {
        self.Tabs.text = ""
        self.tag2 = ""
        self.tag1 = ""
        self.enableAllBtn()
    }
    @IBAction func post(sender: AnyObject) {
        self.showPostLoadingView()
        forum().postTopic(self.postTitle.text!,content: self.postContent.text,tags: self.tags(),callback: {(res)in
            if(res){
                self.hideLoadinView()
                self.successView()
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
        })
    }

    @IBOutlet var Tabs: UILabel!
    var tag1:String = ""
    var tag2:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "发表"
        self.postContent.layer.borderWidth = 1
        self.postContent.layer.borderColor = UIColor(red: 193/255, green: 193/255, blue: 192/255, alpha: 0.9).CGColor
        self.postContent.layer.cornerRadius = 6
        
        
        self.postContent.delegate = self
        
        self.showLoadingView()
        User().updateUserToken{(result) in
            if(result){
                self.hideLoadinView()
            }
        }
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            self.postContent.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tag1(tagId:String,tagName:String){
        self.Tabs.text = self.Tabs.text! + " \(tagName)"
        self.tag1 = tagId
    }
    func tag2(tagId:String,tagName:String){
        self.Tabs.text = self.Tabs.text! + " \(tagName)"
        self.tag2 = tagId
    }
    
    func tags() -> [Dictionary<String,String>]{
        if(tag1 != "" && tag2 != ""){
            return [
                ["type":"tags","id":self.tag1],
                ["type":"tags","id":self.tag2]
            ]
        }
        if(tag2 == ""){
            return [
                ["type":"tags","id":self.tag1]
            ]
        }
        return [
            ["type":"tags","id":self.tag2]
        ]
        
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
    
    func showLoadingView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "获取token"
    }
    func successView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "发表成功"
        hud.hide(true, afterDelay: 1)
    }
    func showPostLoadingView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "正在发表"
    }
    func hideLoadinView(){
        MBProgressHUD.hideHUDForView(self.view, animated: true)
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
