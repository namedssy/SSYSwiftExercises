//
//  AppDelegate.swift
//  SSYStopwatch
//
//  Created by 邵仕宇 on 2017/6/20.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class SSYAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var SSYVC: SSYViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        SSYVC = SSYViewController()
        
        let nav = UINavigationController(rootViewController: SSYVC!)
        
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

