//
//  AppDelegate.swift
//  MyFirstSwift
//
//  Created by 周永建 on 16/7/27.
//  Copyright © 2016年 xinde. All rights reserved.
//

import UIKit



 let MainScreenWidth = UIScreen.mainScreen().bounds.size.width

 let MainScreenHeight = UIScreen.mainScreen().bounds.size.height


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
        
        
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        self.window?.rootViewController=TabBarViewController()
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

 


}

