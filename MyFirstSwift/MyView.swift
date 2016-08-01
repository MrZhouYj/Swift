//
//  MyView.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/27.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    
    
    
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
        
        leftView.backgroundColor = UIColor.redColor()
        
        leftView.sd_layout()
        .topSpaceToView(self,0)
        .bottomSpaceToView(self,0)
        .leftEqualToView(self)
        .widthRatioToView(self,0.4)
        
        
    }
    

}

