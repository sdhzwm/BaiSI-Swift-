//
//  WMCategoryCell.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMConttainerCell: UITableViewCell {
    
    @IBOutlet weak var indicatorView: UIView!
    
    var category: WMCategory? {
        didSet {
            if let channel = category {
                self.textLabel?.text = channel.name
            }
        }
    }
    override func awakeFromNib() {
        self.backgroundColor = UIColor.LobalBg();
        self.indicatorView.backgroundColor = UIColor.RGBColor(219, g: 21, b: 26)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.indicatorView.hidden = !selected
        
        textLabel?.textColor = selected ? self.indicatorView.backgroundColor : UIColor.blackColor()
    }
    
    override func layoutSubviews() {
       
        super.layoutSubviews()
        
        textLabel!.frame.origin.y += 2.0
        textLabel!.frame.size.height -= 4.0
    }
    
  
    

}
