//
//  MasterTableVC.swift
//  SSYCandySearch
//
//  Created by 邵仕宇 on 2017/7/5.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYMasterTableVC: UITableViewController {

    lazy var dataArr = [SSYModel]()
    lazy var filteredDataArr = [SSYModel]()
    let searchVC = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.candyGreen()
        self.navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = true
        
        let imageView = UIImageView(image: UIImage(named: "Inline-Logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 349, height: 47)
        self.navigationItem.titleView = imageView
        
        initData() //初始化数据
        
        initUI() //初始化UI
    }
    
    // MARK: - 初始化方法
    
    
    /// 初始化数据方法
    fileprivate func initData() {
        
        dataArr = [
            SSYModel(category:"Chocolate", name:"Chocolate Bar"),
            SSYModel(category:"Chocolate", name:"Chocolate Chip"),
            SSYModel(category:"Chocolate", name:"Dark Chocolate"),
            SSYModel(category:"Hard", name:"Lollipop"),
            SSYModel(category:"Hard", name:"Candy Cane"),
            SSYModel(category:"Hard", name:"Jaw Breaker"),
            SSYModel(category:"Other", name:"Caramel"),
            SSYModel(category:"Other", name:"Sour Chew"),
            SSYModel(category:"Other", name:"Gummi Bear")
        ]
    }
    
    /// 初始化UI方法
    fileprivate func initUI() {
        
        UISearchBar.appearance().barTintColor = UIColor.candyGreen()
        UISearchBar.appearance().tintColor = UIColor.white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.candyGreen()
        
        searchVC.searchResultsUpdater = self
        //搜索时背景颜色不变暗
        searchVC.dimsBackgroundDuringPresentation = false
        //如果不设置 那么搜索框会一直留在视图中
        definesPresentationContext = true
        tableView.tableHeaderView = searchVC.searchBar
        searchVC.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchVC.searchBar.delegate = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchVC.isActive ? filteredDataArr.count : dataArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")

        if (cell == nil) {
           cell = UITableViewCell(style: .subtitle, reuseIdentifier: String(describing: SSYMasterTableVC.self))
        }
        
        cell?.textLabel?.text = searchVC.isActive ? filteredDataArr[indexPath.row].name : dataArr[indexPath.row].name
        cell?.detailTextLabel?.text = searchVC.isActive ? filteredDataArr[indexPath.row].category : dataArr[indexPath.row].category

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model: SSYModel
      
        model = searchVC.isActive ? filteredDataArr[indexPath.row] : dataArr[indexPath.row]
      
        if UIDevice.current.userInterfaceIdiom == .phone {
            let vc = SSYDetailVC()
            vc.model = model
            navigationController?.pushViewController(vc, animated: true)
    
        }
        else {
            let nav = self.splitViewController?.viewControllers[1] as? UINavigationController
            let vc = nav?.viewControllers[0] as? SSYDetailVC
//            vc?.loadDetailViewController(model: model)
            vc?.model = model
            
        }
    }
    //MARK: - 自定义方法
    fileprivate func filterContentForSearchText(_ searchText: String, scope: String) {
        
        filteredDataArr = dataArr.filter({ (model) -> Bool in
            if (model.category != scope) && scope != "All" {
                return false
            }
            return model.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        })
        tableView.reloadData()
    }
}

extension SSYMasterTableVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        
        filterContentForSearchText(searchBar.text!, scope: scope!)
    }
    
}

extension SSYMasterTableVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        let scope = searchBar.scopeButtonTitles?[selectedScope]
        
        filterContentForSearchText(searchBar.text!, scope: scope!)
    }
}

extension UIColor {
    static func candyGreen() -> UIColor {
        return UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
    }
}
