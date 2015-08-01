//
//  WMRecommendController.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/22.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMRecommendController: UIViewController {
    
    var channelController : WMConttainerController!
    var friendsController : WMFirendsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.LobalBg()
        self.title = "推荐关注"
        channelController.delegate = friendsController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "channelEmbedSegue" {
            
            if let controller = segue.destinationViewController as? WMConttainerController {
                self.channelController = controller
            }
          
            
        } else if segue.identifier == "friendsEmbedSegue" {
            
            if let controller = segue.destinationViewController as? WMFirendsController {
                self.friendsController = controller
            }
        }

    }
}
