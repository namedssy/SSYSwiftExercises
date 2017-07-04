//
//  AppDelegate.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/6/29.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class SSYAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var artistryVC: SSYArtistryVC?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        artistryVC = SSYArtistryVC()
        
        let nav = SSYNavController(rootViewController: artistryVC!)
        
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

