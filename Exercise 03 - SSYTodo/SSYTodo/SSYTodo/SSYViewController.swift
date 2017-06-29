//
//  SSYViewController.swift
//  SSYTodo
//
//  Created by 邵仕宇 on 2017/6/27.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYViewController: UIViewController , SSYTodoListTabelViewCustomDelegate , SSYNewTodoVCCustomDelegate {
    
    private lazy var tableView: SSYTodoListTableView = {[unowned self] in
        
        let tableView = SSYTodoListTableView(frame: CGRect.init(x: 0, y: 0, width: self.view.width, height: self.view.height), style: .plain)
        tableView.customDelegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
        initUI()
        
    }
    
    //MARK:- 自定义方法
    
    /// 初始化数据方法
    private func initData() {
        
        tableView.dataArr = [SSYModel(id: "1", image: "child-selected", title: "Go to Disney", date: dateFromString("2014-10-20")!),
                 SSYModel(id: "2", image: "shopping-cart-selected", title: "Cicso Shopping", date: dateFromString("2014-10-28")!),
                 SSYModel(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dateFromString("2014-10-30")!),
                 SSYModel(id: "4", image: "travel-selected", title: "Plan to Europe", date: dateFromString("2014-10-31")!)]
        
    }
    
    /// 初始化UI方法
    private func initUI() {
        
        self.title = "Todo List"
        
        self.navigationItem.leftBarButtonItem = editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonClick))
        
        view.addSubview(tableView)
        
        tableView.reloadData()
    }
    
    //MARK:- 点击事件响应
    
    func addBarButtonClick() {
        
        let vc = SSYNewTodoVC()
        vc.customDelegate = self
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //MARK:- SSYTodoListTabelViewCustomDelegate
    
    func didClickWithModel(model: SSYModel, row:Int) {
        
        let vc = SSYNewTodoVC()
        vc.data = model
        vc.row = row
        vc.customDelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    //MARK:- SSYNewTodoVCCustomDelegate
    
    func addDataDelegate(data: SSYModel) {
        tableView.dataArr.append(data)
        tableView.reloadData()
    }
    
    func editDataDelegate(data: SSYModel, row:Int) {
        tableView.dataArr[row] = data
        tableView.reloadData()
    }
}
