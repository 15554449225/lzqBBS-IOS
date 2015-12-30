//
//  Config.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/29.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import Foundation
class Config {
    private var apiDomain:String = "http://bbs.lzqstd.net/api"
//    private var apiDomain:String = "http://discuss.flarum.org.cn/api"
    func getApiDomain()->String{
        return self.apiDomain
    }
}