//
//  Utils.swift
//  SSYTodo
//
//  Created by 邵仕宇 on 2017/6/27.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import Foundation

func stringFromDate(_ date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter.string(from:date)
}

func dateFromString(_ string:String) -> Date? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter.date(from: string)
}
