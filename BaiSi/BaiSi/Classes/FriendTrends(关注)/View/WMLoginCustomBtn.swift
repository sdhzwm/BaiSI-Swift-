
//
//  WMLoginCustomBtn.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/28.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMLoginCustomBtn: UIButton {

    
    override init(frame: CGRect) {
         super.init(frame: frame)
          self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            self.setup()
    }
    
    func setup(){
        self.titleLabel!.textAlignment = .Center;
    }
   

    override func awakeFromNib(){
        self.setup()
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        var frame = self.imageView?.frame
        frame?.origin.x = 0
        frame?.origin.y = 0
        frame?.size.width = self.frame.width
        frame?.size.height = (frame?.size.width)!
        
        self.imageView?.frame = frame!
        //调整文字
        var titleFrame = self.titleLabel?.frame
        titleFrame?.origin.x = 0
        titleFrame?.origin.y = (frame?.size.height)!
        titleFrame?.size.width = self.frame.width
        titleFrame?.size.height = self.frame.height - (titleFrame?.origin.y)!
        
        self.titleLabel?.frame = titleFrame!

    }

}
