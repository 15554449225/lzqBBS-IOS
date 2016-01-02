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
    
    var postInfo:Dictionary<String,String>?
    var commentsInfo:[[String:String]]?
    
    func getById(id:String,callback:(result:AnyObject) -> Void){
        let url:String = Config().getApiDomain()+"/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
               callback(result: resp)
            }
        }
    }
    
    func findUser(jsonStr:JSON) -> String{
        var res:String = "nil"
        let userId = jsonStr["included"][0]["relationships"]["user"]["data"]["id"].string!
        for(_,subJson):(String,JSON) in jsonStr["included"]{
            if(subJson["type"].string == "users" && subJson["id"].string == userId){
                res = subJson["attributes"]["username"].string!
            }
        }
        return res
    }
    
    func findAvator(jsonStr:JSON) ->String{
        var res:String = "nil"
        let userId = jsonStr["included"][0]["relationships"]["user"]["data"]["id"].string!
        for(_,subJson):(String,JSON) in jsonStr["included"]{
            if(subJson["type"].string == "users" && subJson["id"].string == userId){
                if(subJson["attributes"]["avatarUrl"] == nil){
                    res = "nil"
                }else{
                    res = subJson["attributes"]["avatarUrl"].string!
                }
            }
        }
        return res
    }
    
    func getDetailById(id:String,callback:(result:Bool) -> Void){
        let url:String = Config().getApiDomain()+"/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
                let jsonStr = JSON(resp)["data"]
                self.postInfo = [
                    "title":jsonStr["attributes"]["title"].string!,
                    "commentsCount":String(jsonStr["attributes"]["commentsCount"].int!),
                    "startTime":jsonStr["attributes"]["startTime"].string!,
                    "lastTime":jsonStr["attributes"]["lastTime"].string!,
                    "userName":self.findUser(JSON(resp)),
                    "avatar":self.findAvator(JSON(resp))
                ]
                callback(result: true)
            }
        }
    }
    
    func getAllArr(page:Int,callback:(result:[[String:String]])->Void){
        var data:[[String:String]] = [["id":"nil","title":"nil","commentsCount":"nil","startTime":"nil","lastTime":"nil"]]
        let url:String = Config().getApiDomain()+"/discussions?include=startUser,lastUser,startPost,tags&&page[offset]=\(page*20)&sort=-lastTime"
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