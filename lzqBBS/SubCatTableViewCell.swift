//
//  SubCatTableViewCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/15.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit

class SubCatTableViewCell: UITableViewCell {

    @IBOutlet var Num: UILabel!
    @IBOutlet var Time: UILabel!
    @IBOutlet var Title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
