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
        contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 1, right: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateData() {
        super.updateData()
        backgroundColor = UIColor.grayColor()
        titleLabel.textColor = selected ? UIColor.blackColor() : UIColor.greenColor()
    }
}

class CateViewController:  PageController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBar.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        menuBar.registerClass(CustomMenuCell.self)
        
        viewControllers = createViewControllers()
        
        let u = User()
        u.saveUser(isLogin)

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
        let names = ["name1","name2","name3","name4"]
        return names.map{name -> UIViewController in
            let viewController = SubCateViewController()
            viewController.title = name
            return viewController
        }
    }
    
    
}
