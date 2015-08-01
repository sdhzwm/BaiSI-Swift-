//
//  WMWordYoipCell.swift
//  BaiSi
//
//  Created by 王蒙 on 15/8/1.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMWordToipCell: UITableViewCell {

    var wordToip:WMWordToip!
    /** 头像 */
    @IBOutlet weak var profileImageView: UIImageView!
    /** 昵称 */
    @IBOutlet weak var nameLabel: UILabel!
    /** 时间 */
    @IBOutlet weak var createTimeLabel: UILabel!
    /** 顶 */
    @IBOutlet weak var dingButton: UIButton!
    /** 踩 */
    @IBOutlet weak var caiButton: UIButton!
    /** 分享 */
    @IBOutlet weak var shareButton: UIButton!
    /** 评论 */
    @IBOutlet weak var commentButton: UIButton!
    /**文本内容*/    
    @IBOutlet weak var text_Label: UILabel!
   
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        let bgView = UIImageView()
        bgView.image = UIImage(named: "mainCellBackground")
        backgroundView = bgView;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
