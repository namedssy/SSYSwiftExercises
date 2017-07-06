//
//  AppDelegate.swift
//  SSYCandySearch
//
//  Created by 邵仕宇 on 2017/7/5.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class ssyAppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let splitVC = UISplitViewController()
        splitVC.delegate = self
        
        let masterTableVC = SSYMasterTableVC(style: .plain)
        let detailVC = SSYDetailVC()
        
        let nav = UINavigationController.init(rootViewController: masterTableVC)
        let nav2 = UINavigationController.init(rootViewController: detailVC)
        
        nav2.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem
        
        splitVC.viewControllers = [nav , nav2]
        
        window?.rootViewController = splitVC
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        
        return true
        
    }
}

