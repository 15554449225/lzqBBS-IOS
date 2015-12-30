//
//  forum.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/23.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class forum {
    func getById(id:String,callback:(result:AnyObject) -> Void){
        let url:String = Config().getApiDomain()+"/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
               callback(result: resp)
            }
        }
    }
    
    func getAllArr(callback:(result:AnyObject)->Void){
        var data:[[String:String]] = [["id":"nil","title":"nil","commentsCount":"nil","startTime":"nil","lastTime":"nil"]]
        let url:String = Config().getApiDomain()+"/discussions?include=startUser,lastUser,startPost,tags&&page[offset]=0&sort=-lastTime"
        Alamofire.request(.GET,url).responseJSON{ (response) in
            if let resp = response.result.value{
                
                let jsonStr = JSON(resp)
                data.removeAll()
                for(_,subJson):(String,JSON) in jsonStr["data"]{
                    data.append([
                        "id":subJson["id"].string!,
                        "title":subJson["attributes"]["title"].string!,
                        "commentsCount":String(subJson["attributes"]["commentsCount"].int!),
                        "startTime":subJson["attributes"]["startTime"].string!,
                        "lastTime":subJson["attributes"]["lastTime"].string!
                        ])
                }
                callback(result: data)
            }
        }
    }
}