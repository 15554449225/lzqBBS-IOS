//
//  replyViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/12.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit
import MBProgressHUD

class replyViewController: UIViewController,UITextViewDelegate {

    @IBOutlet var replyContent: UITextView!
    
    @IBAction func replyBtn(sender: AnyObject) {
        forum().replyTopic(self.topicId, replyContent: self.replyContent.text, callback: {(res) in
            if(res){
//                self.navigationController?.popToRootViewControllerAnimated(true)
                self.navigationController?.popViewControllerAnimated(true)
            }else{
                
            }
        })
    }
    var topicId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLoadingView()
        User().updateUserToken{(result) in
            if(result){
                self.hideLoadinView()
            }
        }
        
        self.replyContent.layer.borderWidth = 1
        self.replyContent.layer.borderColor = UIColor(red: 193/255, green: 193/255, blue: 192/255, alpha: 0.9).CGColor

        self.replyContent.delegate = self
        // Do any additional setup after loading the view.
    }

    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            self.replyContent.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func successView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "回复成功"
        hud.hide(true, afterDelay: 1)
    }
    func failView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "回复失败，请重试"
        hud.hide(true, afterDelay: 1)
    }
    func showLoadingView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.dimBackground = true
        hud.labelText = "获取token"
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
