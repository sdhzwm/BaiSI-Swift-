//
//  WMMainTabBarController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMMainTabBarController: UITabBarController {
    var items = [UITabBarItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载控制器
        self.setUpController()
        //设置tabBar
           }
    
    /**
     *加载控制器，tabbar的图片与标题
    */
    func setUpController(){
    
        self.setTabBarButtonColor()
        
        let sbEssence = UIStoryboard(name: "WMEssenceController", bundle: nil)
        let essence = sbEssence.instantiateInitialViewController()
     
        self.setAddChildController(essence!, image: UIImage(named: "tabBar_essence_icon")!, selImage: UIImage(named: "tabBar_essence_click_icon")!, title: "精华")
        let new = WMNewController()
         self.setAddChildController(new, image: UIImage(named: "tabBar_new_icon")!, selImage: UIImage(named: "tabBar_new_click_icon")!, title: "新帖")
        let sb = UIStoryboard(name: "FriendTrend", bundle: nil)
       
        let friendTrend = sb.instantiateInitialViewController()
        self.setAddChildController(friendTrend!, image: UIImage(named: "tabBar_friendTrends_icon")!, selImage: UIImage(named: "tabBar_friendTrends_click_icon")!, title: "关注")
        
        let me = WMMeController()
         self.setAddChildController(me, image: UIImage(named: "tabBar_me_icon")!, selImage: UIImage(named: "tabBar_me_click_icon")!, title: "我")
        self.setValue(WMTabBars(), forKeyPath: "tabBar")
    }
    /**
    *添加到控制器
    */
    func setAddChildController(vc:UIViewController,image:UIImage,selImage:UIImage,title:String){
    
              vc.tabBarItem.image = image;
        vc.tabBarItem.selectedImage = selImage;
        vc.tabBarItem.title = title;
        
        let nvc = WMNavigationController(rootViewController:vc)
      
        self.addChildViewController(nvc)
        vc.view.backgroundColor = UIColor.LobalBg()

    }
    
    /**
    设置tabBar及布局
    */
    func setTabBarButtonColor(){
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.grayColor()], forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Selected)
        
    }
      
}

