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
    var commentsInfo:[[String:String]] = [["username":"nil"]]
    
    func getById(id:String,callback:(result:AnyObject) -> Void){
        let url:String = Config().getApiDomain()+"/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
               callback(result: resp)
            }
        }
    }
    
    private func findUserById(id:Int,jsonStr:JSON) ->String{
        var res:String = "nil"
        let userId = jsonStr["included"][id]["relationships"]["user"]["data"]["id"].string!
        for(_,subJson):(String,JSON) in jsonStr["included"]{
            if(subJson["type"].string == "users" && subJson["id"].string == userId){
                res = subJson["attributes"]["username"].string!
            }
        }
        return res
    }
    
    private func findAvatorById(id:Int,jsonStr:JSON) ->String{
        var res:String = "nil"
        let userId = jsonStr["included"][id]["relationships"]["user"]["data"]["id"].string!
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
    
    private func findTag(jsonStr:JSON) -> String{
        var res:[String] = [""]
        var tagId:[String] = [""]
        var resStr:String = ""
        let tem = jsonStr["data"]["relationships"]["tags"]["data"]
        tagId.removeAll()
        res.removeAll()
        for(_,subJson):(String,JSON) in tem{
            tagId.append(subJson["id"].string!)
        }
        for(_,subJson):(String,JSON) in jsonStr["included"]{
            if(subJson["type"] == "tags"){
                for item in tagId{
                    if(subJson["id"].string! == item){
                        res.append(subJson["attributes"]["name"].string!)
                    }
                }
            }
        }
        for item in res{
            resStr += ","+item
        }
        return resStr.substringFromIndex(resStr.startIndex.advancedBy(1))
    }
    
    func getDetailById(id:String,callback:(result:Bool) -> Void){
        let url:String = Config().getApiDomain()+"/discussions/\(id)"
        Alamofire.request(.GET,url).responseJSON{(response)in
            if let resp = response.result.value{
                let jsonStr = JSON(resp)["data"]
                self.postInfo = [
                    "title":jsonStr["attributes"]["title"].string!,
                    "tag":self.findTag(JSON(resp)),
                    "commentsCount":String(jsonStr["attributes"]["commentsCount"].int!),
                    "startTime":jsonStr["attributes"]["startTime"].string!,
                    "lastTime":jsonStr["attributes"]["lastTime"].string!,
                    "userName":self.findUserById(0,jsonStr:JSON(resp)),
                    "avatar":self.findAvatorById(0,jsonStr:JSON(resp))
                ]
                self.commentsInfo.removeAll()
                for(index,subJson):(String,JSON) in JSON(resp)["included"]{
                    if(subJson["type"] == "posts" && subJson["attributes"]["contentType"] == "comment"){
                        self.commentsInfo.append([
                            "username":self.findUserById(Int(index)!, jsonStr: JSON(resp)),
                            "avator":self.findAvatorById(Int(index)!, jsonStr: JSON(resp)),
                            "time":subJson["attributes"]["time"].string!,
                            "contentHtml":subJson["attributes"]["contentHtml"].string!
                        ])
                    }
                }
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
    
    func postTopic(title:String,content:String,tags:[Dictionary<String,String>],callback:(isOk:Bool)->Void){
        let par = [
            "data":[
                "type":"discussions",
                "attributes":[
                    "title":title,
                    "content":content
                ],
                "relationships":[
                    "tags":[
                        "data":tags
                    ]
                ]
            ]
        ]
        let defaults = NSUserDefaults.standardUserDefaults()
        let Token:String = defaults.objectForKey("token") as! String
        let header = ["Authorization": "Token \(Token)","Content-Type": "application/vnd.api+json"]
        Alamofire.request(.POST, "http://bbs.lzqstd.net/api/discussions",headers:header,parameters:par,encoding: .JSON).responseJSON{(response) in
            if let res = response.result.value{
                let jsonStr = JSON(res)
                if(jsonStr["data"] != nil){
                    callback(isOk:true)
                }else{
                    callback(isOk:false)
                }
            }
        }
        
    }
    
}