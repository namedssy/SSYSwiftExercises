//
//  ViewController.swift
//  SSYGoodAsOldPhones
//
//  Created by 邵仕宇 on 2017/6/19.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYProductsTabelViewController: UITableViewController {

    private var dataArr:[SSYModel]?
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [SSYModel(name: "1907 Wall Set", cellImgName: "image-cell1", fullScreenImgName:   "phone-fullscreen1"),
                   SSYModel(name: "1921 Dial Phone", cellImgName: "image-cell2", fullScreenImgName: "phone-fullscreen2"),
                   SSYModel(name: "1937 Desk Set", cellImgName: "image-cell3", fullScreenImgName: "phone-fullscreen3"),
                   SSYModel(name: "1984 Moto Portable", cellImgName: "image-cell4", fullScreenImgName: "phone-fullscreen4")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self.classForCoder))
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(self.classForCoder))
        }
        
        guard var dataArr = dataArr else {
            return cell!
        }
        
        cell?.imageView?.image = UIImage.init(named: dataArr[indexPath.row].cellImgName ?? "")
        cell?.textLabel?.text = dataArr[indexPath.row].name
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let productsVC = SSYProductViewController()
        productsVC.model = dataArr?[indexPath.row]
        
        self.navigationController?.pushViewController(productsVC, animated: true)
    }
}

