//
//  SSYModel.swift
//  SSYCandySearch
//
//  Created by 邵仕宇 on 2017/7/5.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYModel: NSObject {
    
    var category: String
    var name : String
    
    init(category: String, name: String) {
        self.category = category
        self.name = name
    }
}
