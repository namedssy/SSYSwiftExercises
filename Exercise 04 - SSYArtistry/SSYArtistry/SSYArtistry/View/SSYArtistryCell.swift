//
//  SSYArtistryCell.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/6/29.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYArtistryCell: UITableViewCell {
    
    var model: SSYArtistryModel?
    
    fileprivate var cellHeight: CGFloat?

    private lazy var img: UIImageView = {
        
        let img = UIImageView()
        img.frame = CGRect(x: 4, y: 8, width: 192, height: 0)
        img.contentMode = .scaleToFill
        
        return img
    }()
    
    private lazy var bioLabel: UILabel = {[unowned self] in
        
        let bioLabel = UILabel()
        bioLabel.frame = CGRect(x: self.img.x + self.img.width + 9, y: 0, width: 164, height: 0)
        bioLabel.font = UIFont.systemFont(ofSize: 17)
        bioLabel.numberOfLines = 0
        bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
        
        return bioLabel
    }()
    
    private lazy var nameLabel: UILabel = {[unowned self] in
    
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: self.img.x, y: 0, width: 184, height: 21)
        nameLabel.backgroundColor = UIColor(red: 1, green: 152 / 255, blue: 0, alpha: 1)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .center
        
        return nameLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        initUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 自定义方法
    
    func initUI() {
        contentView.addSubview(img)
        contentView.addSubview(bioLabel)
        contentView.addSubview(nameLabel)
    }
    
    func setValueForCell(model: SSYArtistryModel) {
        
        img.image = model.image
        img.height = model.image.size.height
        
        bioLabel.text = model.bio
        bioLabel.sizeToFit()
        
        nameLabel.text = model.name
        nameLabel.y = self.img.y + self.img.height + 8
        
        if img.height > bioLabel.height {
            cellHeight = img.height + 45
            bioLabel.centerY = img.centerY
        }
        else {
            bioLabel.y = img.y
            cellHeight = bioLabel.height + 16
        }
    }
    
    func getCellHeight() -> CGFloat {
        
        return cellHeight!
    }

}
