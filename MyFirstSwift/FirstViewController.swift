//
//  FirstViewController.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class FirstViewController: RootViewController {

    var firstView:MyView?
    
    var banner:ZZBannerView?
    
    var SecondView:MyView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "首页"
        
        self.banner = ZZBannerView()
        
        self.view.addSubview(banner!)
        
        self.firstView = MyView()
        
        self.view.addSubview(firstView!)
        
        self.SecondView=MyView()
        
        self.view.addSubview(SecondView!)
        
        firstView!.backgroundColor=UIColor.greenColor()
        
        SecondView!.backgroundColor=UIColor.cyanColor()
        
        banner?.sd_layout()
        .leftEqualToView(self.view)
        .topEqualToView(self.view)
        .rightEqualToView(self.view)
        .autoHeightRatio(0.52)
        
        banner?.backgroundColor=UIColor.orangeColor()
        
        
        firstView?.sd_layout()
        .leftSpaceToView(self.view,10)
        .rightSpaceToView(self.view,10)
        .topSpaceToView(banner,0)
        .autoHeightRatio(0.35)
        
        SecondView?.sd_layout()
        .leftEqualToView(firstView)
        .rightEqualToView(firstView)
        .topSpaceToView(firstView,10)
        .heightRatioToView(firstView,1)
        
        banner?.configBanner(["https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3066663093,2345920417&fm=58","https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2008984343,3285540530&fm=58","https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1680087752,2008686196&fm=58"])
        
        
    }

    
    

   

}
