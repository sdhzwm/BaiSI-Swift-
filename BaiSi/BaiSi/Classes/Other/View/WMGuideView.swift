//
//  WMGuideView.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/28.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMGuideView: UIView {

   
    class func initWithGuideView()->WMGuideView{
        return NSBundle.mainBundle().loadNibNamed("WMGuideView", owner: nil, options: nil).last as! WMGuideView
    }
    

    @IBAction func closeBtn(sender: UIButton) {
   
        self.removeFromSuperview()
    }

}

extension WMGuideView{

    class func showGuideView(){
        
        let key = "CFBundleShortVersionString"
        
        //获取当前的版本号
        let currViession = NSBundle.mainBundle().infoDictionary?[key] as! String
        //获取沙盒中的版本号
        let oldViession = NSUserDefaults.standardUserDefaults().stringForKey(key)
        
        if currViession  != oldViession{
            let window = UIApplication.sharedApplication().keyWindow
            
            let guideView = WMGuideView.initWithGuideView()
            window?.addSubview(guideView)
            //保存现在的版本号
            NSUserDefaults.standardUserDefaults().setValue(currViession, forKey: key)
        }
        
    }
}
