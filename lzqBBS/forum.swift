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
    func getAll(callback:(result:AnyObject) -> Void){
        let url:String = "http://bbs.lzqstd.net/api/discussions"
        Alamofire.request(.POST,url).responseJSON{ (response) in
            if let resp = response.result.value{
                callback(result: resp)
            }
        }
    }
}