//
//  PostCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/28.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var lb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 4
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue:0.85, alpha: 0.9).CGColor
        containerView.layer.masksToBounds = true
        //self.backgroundColor = UIColor.greenColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
