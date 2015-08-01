//
//  WMPrivateController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMMeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的"
        let moon = UIBarButtonItem.itemWith(self, action:"moonClick", nimage: UIImage(named: "mine-moon-icon"), himage: UIImage(named: "mine-moon-icon-click"))
        let setting = UIBarButtonItem.itemWith(self, action:"settingClick", nimage: UIImage(named: "mine-setting-icon"), himage: UIImage(named: "mine-setting-icon-click"))
        self.navigationItem.rightBarButtonItems = [setting,moon]
    }
    
    func moonClick(){
        print("这是月亮")
        
    }
    
    func settingClick(){
        print("这是设置")
    }
}