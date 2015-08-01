//
//  Extionseion.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit



extension UIBarButtonItem{
    class func itemWith(target: AnyObject?, action: Selector ,nimage:UIImage?,himage:UIImage?) ->UIBarButtonItem
    {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(nimage, forState: UIControlState.Normal)
        btn.setImage(himage, forState: UIControlState.Highlighted)
        btn.frame.size = btn.currentImage!.size
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return UIBarButtonItem(customView: btn)
    }
    
}

extension UIColor{
    class func RandomColor() ->UIColor{
        let hue = CGFloat(arc4random_uniform(256))/255.0
        let brightness = CGFloat(arc4random_uniform(256))/255.0 + 0.5
        let saturation = CGFloat(arc4random_uniform(256))/255.0 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    class func LobalBg() ->UIColor{
        return  self.RGBColor(223, g: 223, b: 223)
    }
    
    class func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
}