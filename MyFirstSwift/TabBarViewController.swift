//
//  TabBarViewController.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/28.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
       let firstVc = FirstViewController()
       let navc1 = UINavigationController.init(rootViewController: firstVc)
       let item1:UITabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(imageLiteral: "icon_home_pager_selected"), selectedImage: UIImage.init(imageLiteral: "icon_home_pager_selected"))
        navc1.tabBarItem = item1
        
        let secondVc = SecondViewController()
        let navc2 = UINavigationController.init(rootViewController: secondVc)
        let item2:UITabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(imageLiteral: "icon_my_unselected"), selectedImage: UIImage.init(imageLiteral: "icon_my_selected"))
        
        navc2.tabBarItem = item2
        
        self.viewControllers = [navc1,navc2]
    }

 
    

   

}
