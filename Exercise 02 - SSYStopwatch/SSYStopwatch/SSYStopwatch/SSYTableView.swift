//
//  SSYTableView.swift
//  SSYStopwatch
//
//  Created by 邵仕宇 on 2017/6/20.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYTableView: UITableView ,UITableViewDelegate , UITableViewDataSource {

    lazy var dataArr = [String]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.init(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: SSYTabelViewCell? = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self.classForCoder)) as? SSYTabelViewCell
        
        if cell == nil {
            cell = SSYTabelViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(self.classForCoder))
        }
        
        cell?.backgroundColor = UIColor.clear
        
        if dataArr.count > 0 {
            cell?.leftLabel.text = "Lap" + "\(dataArr.count - indexPath.row)"
            cell?.rightLabel.text = "\(dataArr[indexPath.row])"
        }
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
