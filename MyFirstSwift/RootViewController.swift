//
//  RootViewController.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor=UIColor.whiteColor()
        
        
        
        let verson = UIDevice.currentDevice().systemVersion
        
        print("\(verson)")
        
        switch UIDevice.currentDevice().systemVersion.compare("7.0.0", options: NSStringCompareOptions.NumericSearch) {
            
        case .OrderedSame, .OrderedDescending:
            
            print("大于7.0.0")
            
            self.edgesForExtendedLayout = UIRectEdge.None
            
            self.automaticallyAdjustsScrollViewInsets = false
            
        case .OrderedAscending:
            
           print("小于7.0.0")
            
        }
    }

   

}
