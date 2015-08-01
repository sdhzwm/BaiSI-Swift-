//
//  WMCoustParameter.swift
//  BaiSi
//
//  Created by 王蒙 on 15/7/28.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

let windowH = UIScreen.mainScreen().bounds.size.height

let windowW = UIScreen.mainScreen().bounds.size.width

//WMEssenceController模块部分使用
/**导航条的高度或者是Y值*/
let navH:CGFloat = 64
/**标签栏的高度*/
let titleViewH:CGFloat = 35
/**cell的间隔*/
let wordCellMargin:CGFloat = 10
/**文字上面的Y值*/
let textTopViewY:CGFloat = 55
/**下部标签栏的高度 */
let tabBatViewH:CGFloat = 44
/**图片的最大高度*/
let largePirctureMaxH:CGFloat = 1000
/**如果是最大的高度那么就选这个*/
let largePirctureH:CGFloat = 250

enum EssenceType:Int{
   case EssenceTypeAll = 1    
   case EssenceTypePricture = 10
   case EssenceTypeWord = 29
   case EssenceTypeVoice = 31
   case EssenceTypeVideo = 41
    
   
}