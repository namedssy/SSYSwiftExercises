//
//  SSYArtistryVC.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/6/29.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYArtistryVC: UIViewController , SSYArtistryCellCustomDelegate {
    
    private lazy var tableView: SSYArtistryTableView = {[unowned self] in
        
        let tableView = SSYArtistryTableView(frame: self.view.bounds, style: .plain)

        tableView.customDelegate = self as SSYArtistryCellCustomDelegate
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Artistry"
        
        view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 105/255, green: 159/255, blue: 56/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.init(name: "Optima-Bold", size: 24) ?? UIFont(),NSForegroundColorAttributeName:UIColor.white]
        
        self.navigationController?.navigationBar.isTranslucent = false
        //取消下移64
        self.extendedLayoutIncludesOpaqueBars = true;
        
        initUI() //初始化UI
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- 初始化方法
    
    /// 初始化UI方法
    fileprivate func initUI() {
        
        view.addSubview(tableView)
    }
    
    //MARK:- SSYArtistryCellCustomDelegate
    
    func didClickCellWithModel(model: SSYArtistryModel) {
        
        let vc = SSYWorkVC()
        vc.workModel = model.works
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
