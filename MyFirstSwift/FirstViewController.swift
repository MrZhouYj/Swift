//
//  FirstViewController.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class FirstViewController: RootViewController,MyViewDelegata {
    
    var scrollView:UIScrollView?

    
    var banner:ZZBannerView?
    
    var firstView:MyView?
    
    var SecondView:MyView?
    
    var threeView:MyView?
    
    func leftJump(style:HomeStyle){
        
        print(style)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "首页"
        
        self.scrollView=UIScrollView(frame: CGRectMake(0, 0, MainScreenWidth, MainScreenHeight-49))
        
        self.view.addSubview(scrollView!)
        
        self.scrollView?.backgroundColor=UIColor.whiteColor()
        
        self.banner = ZZBannerView()
        
        scrollView?.addSubview(banner!)
        
//        添加物流
        
        self.firstView = MyView()
        
        self.firstView?.delegata=self
        
        scrollView?.addSubview(firstView!)
        
        firstView?.configWithHomeStyle(HomeStyle.Logistics)
        
        
//        添加拼车
        self.SecondView=MyView()
        
        scrollView?.addSubview(SecondView!)
        
        SecondView?.configWithHomeStyle(HomeStyle.Carpool)
        
//    添加商城
        
        self.threeView=MyView()
        
        scrollView?.addSubview(threeView!)
        
        threeView?.configWithHomeStyle(HomeStyle.Mall)
        
        
        
        
        banner?.sd_layout()
        .leftEqualToView(scrollView)
        .topEqualToView(scrollView)
        .rightEqualToView(scrollView)
        .autoHeightRatio(0.52)
        
     
        
        
        firstView?.sd_layout()
        .leftSpaceToView(scrollView,10)
        .rightSpaceToView(scrollView,10)
        .topSpaceToView(banner,10)
        .autoHeightRatio(0.35)
        
        SecondView?.sd_layout()
        .leftEqualToView(firstView)
        .rightEqualToView(firstView)
        .topSpaceToView(firstView,10)
        .heightRatioToView(firstView,1)
        
        threeView?.sd_layout()
            .leftEqualToView(firstView)
            .rightEqualToView(firstView)
            .topSpaceToView(SecondView,10)
            .heightRatioToView(firstView,1)
        
        banner?.configBanner(["https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3066663093,2345920417&fm=58","https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2008984343,3285540530&fm=58","https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1680087752,2008686196&fm=58"])
        
        scrollView?.setupAutoContentSizeWithBottomView(threeView, bottomMargin: 10);
        
    }

    
    
  
   

}
