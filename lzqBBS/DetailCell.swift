//
//  DetailCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/4.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class DetailCell: UITableViewCell {

    @IBOutlet var content: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var username: UILabel!
    @IBOutlet var avator: UIImageView!
    override func awakeFromNib() {
        self.content.numberOfLines = 0
        self.avator.layer.cornerRadius = 15
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(jsonStr:[String:String]){
        self.username.text = jsonStr["username"]
        self.time.text = jsonStr["time"]
    
        self.content.attributedText = jsonStr["contentHtml"]?.html2AttributedString
        
        if(jsonStr["avator"] != "nil"){
            let avatorUrl = NSURL(string: jsonStr["avator"]!)
            self.avator.kf_setImageWithURL(avatorUrl!)
        }
        
    }

}
