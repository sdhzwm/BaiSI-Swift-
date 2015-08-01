//
//  WMFriendCell.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/25.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
import Kingfisher
import SDWebImage

class WMFriendCell: UITableViewCell {
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fansCountLabel: UILabel!
    
    var friend: WMFriend? {
        didSet {
            if let friend = friend {
//                headImageView.kf_setImageWithURL(NSURL(string: friend.header)!, placeholderImage: UIImage(named: "defaultUserIcon"))
               headImageView.sd_setImageWithURL(NSURL(string: friend.header)!, placeholderImage: UIImage(named: "defaultUserIcon"))
                nameLabel.text = friend.name
                fansCountLabel.text = "\(friend.fansCount)人关注"
            }
        }
    }
}
