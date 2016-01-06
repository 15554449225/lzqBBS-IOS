//
//  Config.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/29.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import Foundation

class Config {
//    private var apiDomain:String = "http://bbs.lzqstd.net/api"
    private var apiDomain:String = "http://discuss.flarum.org.cn/api"
    func getApiDomain()->String{
        return self.apiDomain
    }
}
extension String {
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding], documentAttributes: nil)
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}