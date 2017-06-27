//
//  SSYTabelViewCell.swift
//  SSYStopwatch
//
//  Created by 邵仕宇 on 2017/6/26.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYTabelViewCell: UITableViewCell {
    
     lazy var leftLabel: UILabel = {
        
        let leftLabel = UILabel()
        leftLabel.text = "Lap 000"
        leftLabel.font = UIFont.systemFont(ofSize: 17)
        leftLabel.textColor = UIColor.black
        
        return leftLabel
    }()
    
     lazy var rightLabel:UILabel = {
        
        let rightLabel = UILabel()
        rightLabel.text = "00 : 00 . 00"
        rightLabel.font = UIFont.systemFont(ofSize: 17)
        rightLabel.textColor = UIColor.black
        
        return rightLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        leftLabel.frame = CGRect.init(x: 30, y: 0, width: 0, height: 0)
        leftLabel.sizeToFit()
        leftLabel.centerY = self.centerY
        self.contentView.addSubview(leftLabel)
        
        rightLabel.frame = CGRect.init(x: 250, y: 0, width: 0, height: 0)
        rightLabel.sizeToFit()
        rightLabel.centerY = self.centerY
        self.contentView.addSubview(rightLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
