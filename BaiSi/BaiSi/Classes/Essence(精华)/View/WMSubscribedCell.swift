//
//  WMSubscribedCell.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import SDWebImage
class WMSubscribedCell: UITableViewCell {
    
    @IBOutlet weak var subNuber: UILabel!
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var subImageView: UIImageView!
    var subscribed:WMSubscribedTag?{
        didSet{
            if let subTag = subscribed{
            
                self.subImageView.sd_setImageWithURL(NSURL(string: subTag.image_list), placeholderImage: UIImage(named: "defaultUserIcon"))
                self.subName.text = subTag.theme_name
                var count:Float = 0.0
                if subTag.subscribeNumber > 10000{
                    
                    count = Float(subTag.subscribeNumber) / Float(10000.0)
                    
                    self.subNuber.text = String(format: "%.1f万人关注",count)
                }else{
                     self.subNuber.text = String(format: "%ld人关注",subTag.subscribeNumber)
                }
            }
        }
    }
    
  override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame.origin.x += 10
        contentView.frame.size.width -= 20
        contentView.frame.size.height -= 1
    }
}
