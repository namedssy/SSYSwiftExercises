//
//  SSYProductViewController.swift
//  SSYGoodAsOldPhones
//
//  Created by 邵仕宇 on 2017/6/19.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYProductViewController: UIViewController {

    var model: SSYModel?
    
    //MARK:- 懒加载
    
    private lazy var label: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 0, y: 104, width: 0, height: 0))
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var bgImgView: UIImageView = {
        
        let bgImgView = UIImageView()
        
        return bgImgView
        
    }()
    
    private lazy var button: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(named: "button-addtocart"), for: .normal)

        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        bgImgView.frame = view.bounds
        if let fullScreenImgName = model?.fullScreenImgName {
            bgImgView.image = UIImage.init(named: fullScreenImgName)
        }
        view.addSubview(bgImgView)
        
        label.text = model?.name
        label.sizeToFit()
        label.centerX = view.width / 2
        view.addSubview(label)
        
        
        button.frame = CGRect(x: 0, y: label.y + label.height + 65, width: 0, height: 0)
        button.sizeToFit()
        button.centerX = label.centerX
        
        view.addSubview(button)
    }
}
