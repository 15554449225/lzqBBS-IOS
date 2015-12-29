//
//  PostCell.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/28.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var AnsView: UIView!
    @IBOutlet var Title: UILabel!
    @IBOutlet var Num: UILabel!
    @IBOutlet var AuthorTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib() 
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
