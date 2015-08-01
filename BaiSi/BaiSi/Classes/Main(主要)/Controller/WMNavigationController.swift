//
//  WMNavigationController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMNavigationController: UINavigationController {
    

     override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
       
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if (self.childViewControllers.count>0) {
            
            let btn = UIButton(type: UIButtonType.Custom)
            
            btn.setTitle("返回", forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
            btn.setImage(UIImage(named: "navigationButtonReturn"), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: "navigationButtonReturnClick"), forState: UIControlState.Highlighted)
            btn.sizeToFit()
            
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
            
            //        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            //        btn.size = CGSizeMake(60, 35);
            //        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
            
           btn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
            
           btn.titleLabel?.font = UIFont.systemFontOfSize(14)
           viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
           viewController.hidesBottomBarWhenPushed = true;
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    func onClick(){
        self.popViewControllerAnimated(true)
    }

}
