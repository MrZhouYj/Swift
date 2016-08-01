//
//  ZZBannerCollectionViewCell.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class ZZBannerCollectionViewCell: UICollectionViewCell {
    
    var imageVie:UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        print("走这里")
        
        self.imageVie=UIImageView()
        
        self.contentView.addSubview(imageVie!)
        
        self.imageVie?.sd_layout().spaceToSuperView(UIEdgeInsetsZero)
        
    }
    
    func setImageWithUrl(imageUrl:NSString) {
        
        
        imageVie!.sd_setImageWithURL(NSURL.init(string: imageUrl as String)) {
            (image:UIImage!, error:NSError!, SDImageCacheTypeNone, url:NSURL!) in
            
            print("下载完成")
        }
    }
    
    
}
