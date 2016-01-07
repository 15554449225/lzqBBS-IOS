//
//  LoginViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/7.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginViewController: UIViewController {


    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        let username = userName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let password = passWord.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if(username != "" && password != ""){
            self.showLoadingView()
            let user = User()
            user.loginWithValue(username!, password: password!, callback: {(result) in
                if(result){
                    self.hideLoadinView()
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }else{
                    self.hideLoadinView()
                    self.showLoadingViewFail()
                }
            })
        }

    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "登陆"
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showLoadingView(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "登录中...."
    }
    func showLoadingViewFail(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "用户名密码错误"
        hud.hide(true, afterDelay: 1)
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
