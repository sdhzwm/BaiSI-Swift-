//
//  WMOneController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMNewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle" ))
        
        let item = UIBarButtonItem.itemWith(self, action: "onClick", nimage: UIImage(named: "MainTagSubIcon"), himage: UIImage(named: "MainTagSubIconClick"))
        
        self.navigationItem.leftBarButtonItem = item
    }
    func onClick(){
        print("h")
    }

}
