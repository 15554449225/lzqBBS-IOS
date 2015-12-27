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
    var url = "http://bbs.lzqstd.net/api/token"
    var loginData = ["identification": "xiaotian","password": "Gxt947171"]
    
    func saveUser(callback:(isOk:Bool) ->Void){
        
        Alamofire.request(.POST, self.url, parameters: self.loginData).responseJSON{(response) in
            if let resp = response.result.value{
                let jsonObj = JSON(resp)
                if jsonObj["token"] != nil {
                    callback(isOk: true)
                }else{
                    callback(isOk:false)
                }
            }
        }
    }
    
}