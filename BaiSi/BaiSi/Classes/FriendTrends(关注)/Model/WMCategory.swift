//
//  WMCategory.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMCategory: NSObject {
    
    var count: Int
    var id: String
    var name: String
    
    var friends = [WMFriend]()
    var currentPage = 1
    var total = 0
    
    
    init(dictionary: [String: AnyObject]) {
        let countStr = dictionary["count"] as! String
        count = Int(countStr)!
        id = dictionary["id"] as! String
        name = dictionary["name"] as! String
    }
    
    static func categoryFromResults(results: [[String : AnyObject]]) -> [WMCategory] {
        var channels = [WMCategory]()
        
        for result in results {
            channels.append(WMCategory(dictionary: result))
        }
        
        return channels
    }
    
}
