//
//  ViewController.swift
//  SSYStopwatch
//
//  Created by 邵仕宇 on 2017/6/20.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYViewController: UIViewController {

    fileprivate var isPlay: Bool = false
    
    //MARK:懒加载
    fileprivate lazy var mainLabel: UILabel = {
        
        let mainLabel = UILabel()
        mainLabel.text = "00:00.00"
        mainLabel.textColor = UIColor.black
        mainLabel.font = UIFont.systemFont(ofSize: 40)
        
        return mainLabel
    }()
    
    fileprivate lazy var lapLabel: UILabel = {
        
        let lapLabel = UILabel()
        lapLabel.text = "00:00:00"
        lapLabel.textColor = UIColor.black
        lapLabel.font = UIFont.systemFont(ofSize: 17)
        
        return lapLabel
    }()
    
    fileprivate lazy var tableView: SSYTableView = {
    
        let tableView = SSYTableView(frame: CGRect(), style: .grouped)
        
        return tableView
    }()
    
    fileprivate lazy var headerView: UIView = {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.init(colorLiteralRed: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    
        return headerView
    }()
    
    fileprivate lazy var playPauseButton: UIButton = {
    
        let playPauseButton = UIButton(type: .custom)
        playPauseButton.setTitle("Start", for: .normal)
        playPauseButton.setTitleColor(UIColor.green, for: .normal)
        playPauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        playPauseButton.backgroundColor = UIColor.white
        playPauseButton.addTarget(self, action: #selector(playPauseButtonClick(_ :)), for: .touchUpInside)
        
        return playPauseButton
    }()
    
    fileprivate lazy var lapRestButton: UIButton = {
        
        let lapRestButton = UIButton(type: .custom)
        lapRestButton.setTitle("Lap", for: .disabled)
        lapRestButton.setTitleColor(UIColor.lightGray, for: .disabled)
        lapRestButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        lapRestButton.backgroundColor = UIColor.white
        lapRestButton.addTarget(self, action: #selector(lapRestButtonClick(_ :)), for: .touchUpInside)
        lapRestButton.isEnabled = false
        
        return lapRestButton
    }()
    
    fileprivate lazy var mainStopwatch: SSYStopWatch = {
    
        let mainStopwatch = SSYStopWatch()
        
        return mainStopwatch
    }()
    
    fileprivate lazy var lapStopwatch: SSYStopWatch = {
        
        let lapStopwatch = SSYStopWatch()
        
        return lapStopwatch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        self.title = "Stopwatch"
        
        initUI()
    }

    //MARK:- 自定义方法
    
    /// 初始化UI方法
    func initUI () {
        
        mainLabel.frame = CGRect(x: 0, y: 133, width: 0, height: 0)
        mainLabel.sizeToFit()
        mainLabel.centerX = view.width / 2
        view.addSubview(mainLabel)
        
        lapLabel.frame = CGRect(x: 200, y: 106, width: 0, height: 0)
        lapLabel.sizeToFit()
        view.addSubview(lapLabel)

        headerView.frame = CGRect.init(x: 0, y: 219, width: view.width, height: 110)
        view.addSubview(headerView)
        
        lapRestButton.frame = CGRect.init(x: 100, y: 23, width: 60, height: 60)
        lapRestButton.layer.cornerRadius = lapRestButton.width / 2
        lapRestButton.layer.masksToBounds = true
        headerView.addSubview(lapRestButton)
        
        playPauseButton.frame = CGRect.init(x: lapRestButton.x + lapRestButton.width + 50, y: lapRestButton.y, width: lapRestButton.width, height: lapRestButton.height)
        playPauseButton.layer.cornerRadius = playPauseButton.width / 2
        playPauseButton.layer.masksToBounds = true
        headerView.addSubview(playPauseButton)
        
        tableView.frame = CGRect(x: 0, y: 329, width: view.width, height: view.height - 329)
        view.addSubview(tableView)
        
    }
    
    /// 改变button的文字和颜色
    ///
    /// - Parameters:
    ///   - button: button
    ///   - title: 文字
    ///   - titleColor: 颜色
    fileprivate func changeButton(button: UIButton , title: String , titleColor: UIColor) {
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(titleColor, for: UIControlState())
    }
    
    /// 更新显示时间
    ///
    /// - Parameters:
    ///   - stopwatch: stopwatch
    ///   - label: label
    fileprivate func updateTimer(_ stopwatch: SSYStopWatch , label: UILabel) {
        
        stopwatch.counter = stopwatch.counter + 0.035
        
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0" + minutes
        }
        
        var seconds: String = String(format:"%.2f",stopwatch.counter.truncatingRemainder(dividingBy: 60))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
    
    func updateMainTimer() {
        updateTimer(mainStopwatch, label: mainLabel)
    }
    
    func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapLabel)
    }
    
    /// 清空时间
    ///
    /// - Parameters:
    ///   - stopwatch: stopwatch
    ///   - label: label
    fileprivate func resetTimer(stopwatch: SSYStopWatch, label: UILabel) {
        stopwatch.counter = 0.0
        label.text = "00:00.00"
    }
    
    fileprivate func resetMainTimer() {
        resetTimer(stopwatch: mainStopwatch, label: mainLabel)
    }
    
    fileprivate func resetLapTimer() {
        resetTimer(stopwatch: lapStopwatch, label: lapLabel)
    }
    
    //MARK:- 点击事件相应
    
    func playPauseButtonClick(_ button:UIButton) {
        
        if !isPlay {
            changeButton(button: button, title: "Stop", titleColor: UIColor.red)
            changeButton(button: lapRestButton, title: "Lap", titleColor: UIColor.black)
            
            if lapRestButton.isEnabled == false {
                lapRestButton.isEnabled = true
            }
            
            //开启秒表
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
        
            RunLoop.current.add(mainStopwatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            
        }
        else {
            changeButton(button: button, title: "Play", titleColor: UIColor.green)
            changeButton(button: lapRestButton, title: "Reset", titleColor: UIColor.black)
            
            //暂停秒表
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
        }
        
        //改变点击状态
        isPlay = !isPlay
    }
    
    func lapRestButtonClick(_ button:UIButton) {
        
        if !isPlay {
            
            resetMainTimer()
            resetLapTimer()
            
            tableView.dataArr.removeAll()
            tableView.reloadData()
            
            button.isEnabled = false
        }
        else {
            if let mainText = mainLabel.text {
                tableView.dataArr.insert(mainText, at: 0)
            }
            tableView.reloadData()
            
            lapStopwatch.timer.invalidate()
            resetLapTimer()
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            
        }
        
    }
    
}

