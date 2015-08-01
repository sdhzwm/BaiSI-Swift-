//
//  WMTabBars.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/22.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMTabBars: UITabBar {
    private var pushBtn:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let btn = UIButton(type: UIButtonType.Custom)
        
        btn.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: "onClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        self.pushBtn = btn
        self.backgroundImage = UIImage(named: "tabbar-light")
    }

    func onClick(){
    
        print("点击了一下")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWH = self.pushBtn.currentBackgroundImage?.size
        let tabBarWH = self.frame.size
        self.pushBtn.frame.size.height = (btnWH?.height)!
        self.pushBtn.frame.size.width = (btnWH?.width)!
        self.pushBtn.center = CGPointMake(tabBarWH.width*0.5, tabBarWH.height*0.5)
        
        let buttonY:CGFloat = 0
        let buttonW:CGFloat = tabBarWH.width/5
        let buttonH:CGFloat = tabBarWH.height
        
        var index = 0
        
        for  btn:UIView in self.subviews{
            if (!(btn.isKindOfClass(NSClassFromString("UITabBarButton")!))){
                continue
            }            
            let buttonX:CGFloat = buttonW * CGFloat(((index > 1) ? (index + 1) : index))
            
            btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
            index++
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
