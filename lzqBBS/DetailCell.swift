//
//  DetailCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/4.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet var content: UITextView!
    @IBOutlet var time: UILabel!
    @IBOutlet var username: UILabel!
    @IBOutlet var avator: UIImageView!
    override func awakeFromNib() {
        self.avator.layer.cornerRadius = 15
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
