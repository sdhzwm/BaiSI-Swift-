//
//  WMFriend.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMFriend: NSObject {
    
    var header: String
    var fansCount: Int
    var name: String
    
    init(dictionary: [String: AnyObject]) {
        
        let fansCountStr = dictionary["fans_count"] as! String
        fansCount = Int(fansCountStr)!
   
        name = dictionary["screen_name"] as! String
        header = dictionary["header"] as! String
    }
    
  
    static func friendsFromResults(results: [[String : AnyObject]]) -> [WMFriend] {
        var friends = [WMFriend]()
        
        for result in results {
            friends.append(WMFriend(dictionary: result))
        }
        
        return friends
    }

}
