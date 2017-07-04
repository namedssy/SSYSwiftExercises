//
//  SSYWorkVC.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/7/3.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYWorkVC: UIViewController {
    
    var workModel: [Work]?
    
    private lazy var tableView: SSYWorkTableView = {[unowned self] in
        
        let tableView = SSYWorkTableView(frame: self.view.bounds, style: .plain)
        tableView.dataArr = self.workModel!
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        self.title = "Pablo Picasso"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.init(name: "Optima-Bold", size: 24) ?? UIFont(), NSForegroundColorAttributeName: UIColor.white]
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //取消下移64
        self.extendedLayoutIncludesOpaqueBars = true;
        
        initUI() //初始化UI
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- 初始化方法
    
    /// 初始化UI方法
    private func initUI() {
        
        view.addSubview(tableView)
        
    }
}
