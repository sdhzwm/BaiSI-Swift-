//
//  WMCustomField.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/28.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMCustomField: UITextField {

   
    override func awakeFromNib() {
        self.setValue(self.textColor, forKeyPath: "placeholderLabel.textColor")
        super.becomeFirstResponder()
    }
    
    override func becomeFirstResponder() -> Bool {
        self.setValue(self.textColor, forKeyPath: "placeholderLabel.textColor")
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        self.setValue(UIColor.grayColor(), forKeyPath: "placeholderLabel.textColor")
        return super.resignFirstResponder()
    }
    
}
