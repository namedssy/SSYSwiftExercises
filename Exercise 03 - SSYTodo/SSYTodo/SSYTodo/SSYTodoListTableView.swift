//
//  SSYTodoListTableView.swift
//  SSYTodo
//
//  Created by 邵仕宇 on 2017/6/27.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

protocol SSYTodoListTabelViewCustomDelegate {
    func didClickWithModel(model:SSYModel, row:Int)
}

class SSYTodoListTableView: UITableView , UITableViewDelegate , UITableViewDataSource {

    lazy var dataArr = [SSYModel]()
    
    var customDelegate: SSYTodoListTabelViewCustomDelegate?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self.classForCoder))
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(self.classForCoder))
        }
        
        cell?.imageView?.image = UIImage.init(named: dataArr[indexPath.row].image)
        cell?.textLabel?.text = dataArr[indexPath.row].title
        cell?.detailTextLabel?.text = stringFromDate(dataArr[indexPath.row].date)
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let customDelegate = customDelegate {
            customDelegate.didClickWithModel(model: dataArr[indexPath.row], row:indexPath.row)
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            dataArr.remove(at: indexPath.row)
            self.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let todo = dataArr.remove(at: sourceIndexPath.row)
        
        dataArr.insert(todo, at: destinationIndexPath.row)
        
    }
    
    
}
