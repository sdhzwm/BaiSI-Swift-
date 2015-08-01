//
//  WMSubscribedTag.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMSubscribedTag: NSObject {
    var theme_name: String
    var image_list: String
    var subscribeNumber: Int
    
    init(dictionary: [String: AnyObject]) {
        theme_name = dictionary["theme_name"] as! String
        image_list = dictionary["image_list"] as! String
        
        let subNumStr = dictionary["sub_number"] as! String
        subscribeNumber = Int(subNumStr)!
    }
    
    static func SubscribedTagResults(results: [[String : AnyObject]]) -> [WMSubscribedTag] {
        var subscribedTag = [WMSubscribedTag]()
        
        for result in results {
            subscribedTag.append(WMSubscribedTag(dictionary: result))
        }
        
        return subscribedTag
    }
    
}
