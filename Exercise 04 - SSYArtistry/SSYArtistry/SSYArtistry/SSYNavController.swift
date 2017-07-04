//
//  SSYNavController.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/7/3.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        let topVC = self.topViewController
        
        return (topVC?.preferredStatusBarStyle)!
        
    }
}
