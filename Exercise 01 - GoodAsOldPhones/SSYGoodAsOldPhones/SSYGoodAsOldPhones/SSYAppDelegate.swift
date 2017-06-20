//
//  AppDelegate.swift
//  SSYGoodAsOldPhones
//
//  Created by 邵仕宇 on 2017/6/19.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

@UIApplicationMain
class SSYAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var products: SSYProductsTabelViewController?
    var contact: SSYContactViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        products = SSYProductsTabelViewController(style: .grouped)
        let productsNav = UINavigationController(rootViewController: products!)
        
        contact = SSYContactViewController()
        let contactNav = UINavigationController(rootViewController: contact!)
        
        //tabbarItem
        productsNav.tabBarItem.title = "Products"
        contactNav.tabBarItem.title = "Contact"
        
        //tabbarController
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [productsNav,contactNav]
        tabbarController.selectedIndex = 0
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

