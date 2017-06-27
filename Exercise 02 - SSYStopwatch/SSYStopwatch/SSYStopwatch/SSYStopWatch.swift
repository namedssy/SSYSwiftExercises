//
//  SSYStopWatch.swift
//  SSYStopwatch
//
//  Created by 邵仕宇 on 2017/6/26.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYStopWatch: NSObject {

    var timer:Timer
    var counter:Double
    
    override init() {
        timer = Timer()
        counter = 0.0
    }
    
}
