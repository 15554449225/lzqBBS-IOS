//
//  CateViewController.swift
//  lzqBBS
//
//  Created by 郭晓天 on 15/12/21.
//  Copyright © 2015年 郭晓天. All rights reserved.
//

import UIKit
import PageController



class CustomMenuCell: MenuCell {
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateData() {
        super.updateData()
        backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 0.9)
        titleLabel.textColor = selected ? UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.9) : UIColor.grayColor()
    }
}

class CateViewController:  PageController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBar.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        menuBar.registerClass(CustomMenuCell.self)
        viewControllers = createViewControllers()

        // Do any additional setup after loading the view.
    }
    
    func isLogin(isTrue:Bool){
        print(isTrue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createViewControllers() -> [UIViewController]{
//        let names = ["name1","name2","name3","name4"]
        
        let tags = forum().getTags()
        
        return tags.map{tag -> UIViewController in
            let viewController = SubCateViewController()
            viewController.title = tag["tagName"]
            viewController.tagNameEn = tag["tagNameEn"]
            return viewController
        }
    }
    
    
}
