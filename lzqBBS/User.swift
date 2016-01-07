//
//  User.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/22.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User {
    
    func loginWithValue(identify:String,password:String,callback:(isOK:Bool) -> Void){
        Alamofire.request(.POST, Config().getApiDomain()+"/token",parameters:["identification":identify,"password":password]).responseJSON{(response) in
            if let resp = response.result.value{
                let jsonObj = JSON(resp)
                if jsonObj["token"] != nil {
                    callback(isOK: true)
                    self.setUserDefault(identify, password: password, token: jsonObj["token"].string!, id: String(jsonObj["userId"].int!))
                }else{
                    callback(isOK:false)
                }
            }
        }
    }
    
    func updateUserToken(callback:(isOk:Bool) -> Void){
        let defaults = NSUserDefaults.standardUserDefaults()
        Alamofire.request(.POST, Config().getApiDomain()+"/token",parameters:["identification":defaults.objectForKey("identification")!,"password":defaults.objectForKey("password")!]).responseJSON{(response) in
            if let resp = response.result.value{
                let jsonObj = JSON(resp)
                if jsonObj["token"] != nil {
                    callback(isOk: true)
                    defaults.setValue(jsonObj["token"].string, forKey: "token")
                }else{
                    callback(isOk:false)
                }
            }
        }
    }
    
    
    private func setUserDefault(identification:String,password:String,token:String,id:String){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(identification, forKey: "identification")
        defaults.setValue(password, forKey: "password")
        defaults.setValue(token, forKey: "token")
        defaults.setValue(id, forKey: "userId")
    }
    
}