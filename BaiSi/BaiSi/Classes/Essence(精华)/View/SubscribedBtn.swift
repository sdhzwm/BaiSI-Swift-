//
//  SubscribedBtn.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class SubscribedBtn: UIButton {
   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 10
        titleLabel?.center.y = center.y
        
        imageView?.frame.origin.x = CGRectGetWidth(frame) - (imageView!.image!.size.width + 10)
        imageView?.center.y = center.y
        
    }
    
    
 
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//       
//
//        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//  
    
    
}
