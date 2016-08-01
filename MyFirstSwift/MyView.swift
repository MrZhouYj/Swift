//
//  MyView.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/27.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

 enum HomeStyle {
        
        case Logistics
        case Carpool
        case Mall
        
    }
 protocol MyViewDelegata{
        
        func leftJump(style:HomeStyle)
    }

class MyView: UIView {

        
    var delegata:MyViewDelegata?
    
    var currentHomeStyle:HomeStyle?
    
    var leftTitle:UILabel?
    
    var leftImageV:UIImageView?
    
    var topBtn:UIButton?
    
    var downBtn:UIButton?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        
        creatUI()
    }
    
    func creatUI() {
        
        let leftView:UIView=UIView()
        
        self.addSubview(leftView)
        
        
        leftView.sd_layout()
        .topSpaceToView(self,0)
        .bottomSpaceToView(self,0)
        .leftEqualToView(self)
        .widthRatioToView(self,0.4)
        
        let tap:UITapGestureRecognizer=UITapGestureRecognizer.init(target: self, action: "LeftViewJump")
        
        leftView.addGestureRecognizer(tap)
        
        
        leftTitle = UILabel()
        leftView.addSubview(leftTitle!)
        
        leftTitle?.sd_layout()
        .rightSpaceToView(leftView,5)
        .widthIs(40)
        .heightIs(30)
        .centerYEqualToView(leftView)
        
       
        leftTitle?.font=UIFont.systemFontOfSize(14)
        leftTitle?.textColor=UIColor.whiteColor()
        
        self.leftImageV=UIImageView()
        leftView.addSubview(leftImageV!)
        
        leftImageV?.sd_layout()
        .rightSpaceToView(leftTitle,5)
        .centerYEqualToView(leftView)
        .heightRatioToView(leftView,0.5)
        .widthEqualToHeight()
        
        
        let lineV = UIView()
        self.addSubview(lineV)
        
        lineV.backgroundColor=UIColor.whiteColor()
        lineV.sd_layout()
        .leftSpaceToView(leftView,0)
        .topEqualToView(leftImageV!)
        .bottomEqualToView(leftImageV!)
        .widthIs(1)
        
        let lineH = UIView()
        self.addSubview(lineH)
        
        lineH.backgroundColor = UIColor.whiteColor()
        lineH.sd_layout()
        .leftSpaceToView(lineV,50)
        .rightSpaceToView(self,50)
        .centerYEqualToView(self)
        .heightIs(1)
        
        self.topBtn=UIButton.init(type: UIButtonType.System)
        self.addSubview(topBtn!)
        
        topBtn?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        self.topBtn?.sd_layout()
        .leftSpaceToView(lineV,0)
        .rightSpaceToView(self,0)
        .bottomSpaceToView(lineH,5)
        .topSpaceToView(self,10)
        
        self.downBtn=UIButton.init(type: UIButtonType.System)
        self.addSubview(downBtn!)
        
        downBtn?.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        self.downBtn?.sd_layout()
            .leftSpaceToView(lineV,0)
            .rightSpaceToView(self,0)
            .bottomSpaceToView(self,10)
            .topSpaceToView(lineH,5)
        
        
    }
    
    func LeftViewJump(){
        
        delegata?.leftJump(HomeStyle.Logistics)
    }

    
    func configWithHomeStyle(style:HomeStyle){
        
        self.currentHomeStyle=style
        
        switch style {
            
        case .Logistics:
            
            self.backgroundColor=UIColorFromRGB(0xf8c246)
            
            leftImageV?.image=UIImage.init(named: "logistics_icone")
            
            leftTitle?.text="物流"
            
            topBtn?.setTitle("我要发货", forState: UIControlState.Normal)
            
            downBtn?.setTitle("我要收货", forState: UIControlState.Normal)
            
            break
        case .Carpool:
            
            self.backgroundColor=UIColorFromRGB(0x51dac2)
            
            leftImageV?.image=UIImage.init(named: "carpool_icone")
            
            leftTitle?.text="拼车"
            
            topBtn?.setTitle("发布行程", forState: UIControlState.Normal)
            
            downBtn?.setTitle("我要坐车", forState: UIControlState.Normal)

            
            break
        case .Mall:
            
            self.backgroundColor=UIColorFromRGB(0x9ad475)
            
            leftImageV?.image=UIImage.init(named: "mall_icon")
            
            leftTitle?.text="商城"
            
            topBtn?.setTitle("在线商城", forState: UIControlState.Normal)
            
            downBtn?.setTitle("私人订制", forState: UIControlState.Normal)

            
            break
        }
        
    }
}

