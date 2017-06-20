//
//  SSYModel.swift
//  SSYGoodAsOldPhones
//
//  Created by 邵仕宇 on 2017/6/19.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYModel: NSObject {
    
    var name: String?
    var cellImgName: String?
    var fullScreenImgName: String?
    
    init(name: String, cellImgName: String, fullScreenImgName: String) {
        
        self.name = name
        self.cellImgName = cellImgName
        self.fullScreenImgName = fullScreenImgName
        
    }
    
}
