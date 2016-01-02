//
//  PostCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 16/1/2.
//  Copyright © 2016年 郭晓天. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var Num: UILabel!
    @IBOutlet var Time: UILabel!
    @IBOutlet var Title: UILabel!

    
    
    override func awakeFromNib() {
        Title.numberOfLines = 0
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
