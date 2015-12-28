//
//  PostCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/28.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {


    @IBOutlet var cv: UIView!
    @IBOutlet var Title: UILabel!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var Time: UILabel!
    @IBOutlet var resNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cv.layer.cornerRadius = 4
        cv.layer.borderWidth = 1
        cv.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue:0.85, alpha: 0.9).CGColor
        cv.layer.masksToBounds = true
//        containerView.layer.
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
