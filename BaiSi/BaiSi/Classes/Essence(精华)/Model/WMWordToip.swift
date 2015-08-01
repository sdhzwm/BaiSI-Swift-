//
//  WMWordToip.swift
//  BaiSi
//
//  Created by 王蒙 on 15/8/1.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMWordToip: NSObject {
    /** 名称 */
    var name:String
    /** 头像 */
    var profile_image:String
    /** 发帖时间 */
    var create_time:String
    /** 文字内容 */
    var text:String
    /** 顶的数量 */
    var ding:Int
    /** 踩的数量 */
    var cai:Int
    /** 转发的数量 */
    var repost:Int
    /** 评论的数量 */
    var comment:Int
    /**新浪微博*/
    var sina_v:String
    /**帖子的类型*/
    var type:Int
    
    init(dictionary: [String: AnyObject]) {
        
        name = dictionary["name"] as! String
        profile_image = dictionary["profile_image"] as! String
        create_time = dictionary["create_time"] as! String
        text = dictionary["text"] as! String
        
        
        let dingStr = dictionary["ding"] as! String
        ding = Int(dingStr)!
        let caiStr = dictionary["cai"] as! String
        cai = Int(caiStr)!
        
        let repostStr = dictionary["repost"] as! String
        repost = Int(repostStr)!
        
        if let commentStr = dictionary["comment"] as? String{
            comment = Int(commentStr)!
        }else{
            comment = 0
        }
        let typeStr = dictionary["type"] as! String
        type = Int(typeStr)!
        
        if let sina_vStr = dictionary["sina_v"] as? String{
            sina_v = sina_vStr
        }else{
            sina_v = "0"
        }
     
        
    }
    
    static func worfToipResults(results: [[String : AnyObject]]) -> [WMWordToip] {
        var wordToip = [WMWordToip]()
        
        for result in results {
            wordToip.append(WMWordToip(dictionary: result))
        }
        
        return wordToip
    }
    
}


