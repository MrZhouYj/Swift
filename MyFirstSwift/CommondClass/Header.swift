
//
//  Header.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/8/1.
//  Copyright © 2016年 xinde. All rights reserved.
//

import Foundation

/** 用十六进制创建颜色*/

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}



let MainScreenWidth = UIScreen.mainScreen().bounds.size.width

let MainScreenHeight = UIScreen.mainScreen().bounds.size.height
