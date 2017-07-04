//
//  SSYArtistryTableView.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/6/29.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

protocol SSYArtistryCellCustomDelegate: NSObjectProtocol {
    func didClickCellWithModel(model:SSYArtistryModel)
}

class SSYArtistryTableView: UITableView , UITableViewDelegate , UITableViewDataSource {

    weak var customDelegate: SSYArtistryCellCustomDelegate?
    
    var dataArr = [SSYArtistryModel]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        
        initData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initData() {
        
        dataArr = SSYArtistryModel.artistsFromBundle()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(self.classForCoder)) as? SSYArtistryCell
        
        if cell == nil {
            cell = SSYArtistryCell(style: .subtitle, reuseIdentifier: NSStringFromClass(self.classForCoder))
        }
        
        if dataArr.count > 0 {
            cell?.setValueForCell(model: dataArr[indexPath.row])
        }
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let cell = self.tableView(tableView, cellForRowAt: indexPath) as? SSYArtistryCell {
            return cell.getCellHeight()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        customDelegate?.didClickCellWithModel(model: dataArr[indexPath.row])
        
    }
}
