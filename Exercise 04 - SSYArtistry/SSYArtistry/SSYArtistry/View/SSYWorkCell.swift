//
//  SSYWorkCell.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/7/3.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYWorkCell: UITableViewCell {
    
    let moreInfoText = "Select For More Info >"
    
    fileprivate lazy var imgView: UIImageView = {
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 12, y: 0, width: 351, height: 21)
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
        
        return nameLabel
    }()
    
     lazy var infoLabel: UILabel = {[unowned self] in
        
        let infoLabel = UILabel()
        infoLabel.text = self.moreInfoText
        infoLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        infoLabel.textColor =  UIColor(white: 114 / 255, alpha: 1)
        
        return infoLabel
    }()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initUI() {
        
        self.imgView.x = 12;
        self.imgView.y = 15;
        
        contentView.addSubview(imgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(infoLabel)
    }
    
    func setValuesForModel(model: Work) {
        
        imgView.image   = model.image
        imgView.height  = model.image.size.height
        imgView.width   = model.image.size.width > 375 - 24 ? 375 - 24 : model.image.size.width;
        imgView.centerX = 375 / 2
        
        nameLabel.y     = imgView.y + imgView.height + 21
        nameLabel.text  = model.name
        
        infoLabel.text  = model.isExpanded ? model.info : moreInfoText
        infoLabel.x     = 12
        infoLabel.y     = nameLabel.y + nameLabel.height + 21
        infoLabel.height = 0
        infoLabel.numberOfLines = 0
        infoLabel.preferredMaxLayoutWidth = 375 - 21
        infoLabel.width = 375 - 21
        infoLabel.sizeToFit()
        
        if model.isExpanded == false {
            infoLabel.width = 375 - 21
        }
        
        infoLabel.textAlignment = model.isExpanded ? .left : .center
    }
    
    func getCellHeight() -> CGFloat {
        
        return 15 + imgView.height + 21 + nameLabel.height + 21 + infoLabel.height + 21
    }

}
