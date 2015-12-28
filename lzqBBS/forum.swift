//
//  forum.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/23.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import Foundation
import Alamofire

class forum {
    func getAll(callback:(result:AnyObject) -> Void){
        let url:String = "http://discuss.flarum.org.cn/api/discussions?include=startUser,lastUser,startPost,tags&&page[offset]=20"
        Alamofire.request(.GET,url).responseJSON{ (response) in
            if let resp = response.result.value{
                callback(result: resp)
            }
        }
    }
    
    func getById(id:String,callback:(result:AnyObject) -> Void){
        let url:String = "http://discuss.flarum.org.cn/api/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
               callback(result: resp)
            }
        }
    }
}