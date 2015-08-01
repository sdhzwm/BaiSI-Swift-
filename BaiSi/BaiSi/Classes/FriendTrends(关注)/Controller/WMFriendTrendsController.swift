//
//  WMMessageController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMFriendTrendsController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的关注"
        let item = UIBarButtonItem.itemWith(self, action:"friendsClick", nimage: UIImage(named: "friendsRecommentIcon"), himage: UIImage(named: "friendsRecommentIcon-click"))
      
        self.navigationItem.leftBarButtonItem = item
        
       
    }
    func friendsClick(){
        
         performSegueWithIdentifier("ShowRecommend", sender: nil)
       
    }
   
}
