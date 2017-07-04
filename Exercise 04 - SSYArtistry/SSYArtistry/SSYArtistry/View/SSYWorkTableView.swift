//
//  SSYWorkTableView.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/7/3.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYWorkTableView: UITableView {
    
    lazy var dataArr = [Work]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SSYWorkTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SSYWorkCell.self)) as? SSYWorkCell
        
        if cell == nil {
            cell = SSYWorkCell(style: .subtitle, reuseIdentifier: String(describing: SSYWorkCell.self))
        }
        
        if dataArr.count > 0 {
            cell?.setValuesForModel(model: dataArr[indexPath.row])
        }
        
        return cell!
    }
}

extension SSYWorkTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let cell = self.tableView(tableView, cellForRowAt: indexPath) as? SSYWorkCell {
            
            return cell.getCellHeight()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? SSYWorkCell else { return  }
        
        var model = dataArr[indexPath.row]
        model.isExpanded = !model.isExpanded
        dataArr[indexPath.row] = model
        
        tableView.beginUpdates()
        cell.setValuesForModel(model: model)
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
}

