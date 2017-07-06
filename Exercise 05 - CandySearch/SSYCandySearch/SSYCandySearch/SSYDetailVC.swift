//
//  DetailVC.swift
//  SSYCandySearch
//
//  Created by 邵仕宇 on 2017/7/5.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYDetailVC: UIViewController {
    
    var model: SSYModel?
    
    fileprivate lazy var titleLabel: UILabel = {[unowned self] in
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 66, width:0, height: 0))
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.text = self.model?.name
        titleLabel.sizeToFit()
        titleLabel.centerX = self.view.centerX
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            titleLabel.width = self.view.bounds.width
//        }
        
        return titleLabel
    }()
    
    fileprivate lazy var imgView: UIImageView = {[unowned self] in
        
        let imgView = UIImageView()
        imgView.image = UIImage(named: (self.model?.name)!)
        imgView.sizeToFit()
        imgView.center = self.view.center
        
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.barTintColor = UIColor.candyGreen()
        navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = true
        
        view.addSubview(titleLabel)
        view.addSubview(imgView)
        
        title = model?.category
    }
}
