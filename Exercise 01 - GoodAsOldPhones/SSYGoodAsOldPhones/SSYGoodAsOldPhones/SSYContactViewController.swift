//
//  ContactViewController.swift
//  SSYGoodAsOldPhones
//
//  Created by 邵仕宇 on 2017/6/19.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYContactViewController: UIViewController {
    
    //MARK:- 懒加载
    
    private lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 375, height: 800)
        
        
        return scrollView
    }()
    
    private lazy var headerImgView: UIImageView = {
        
        let headerImgView = UIImageView()
        headerImgView.image = UIImage.init(named: "header-contact")
        
        return headerImgView
    }()
    
    private lazy var label_1: UILabel = {
        
        let label_1 = UILabel()
        label_1.text = "About Us"
        label_1.textColor = UIColor.black
        label_1.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label_1
    }()
    
    private lazy var label_2: UILabel = {
        
        let label_2 = UILabel()
        label_2.text = "Good as Old Phones returns the phones of yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:\n\nWhether you are looking for a turn-of-the-century wall set or a Zack Morris Sepcial,we've got you covered.Give us a ring,and we will get you connected\n\n\n\n*Hands-free phonesavailable";
        label_2.numberOfLines = 0
        label_2.textColor = UIColor.black
        label_2.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightLight)
        label_2.contentMode = .top
        
        return label_2
    }()
    
    private lazy var label_3: UILabel = {
    
        let label_3 = UILabel()
        label_3.text = "Contact"
        label_3.textColor = UIColor.black
        label_3.font = UIFont.boldSystemFont(ofSize: 23)
        
        return label_3
    }()
    
    private lazy var emailImgView: UIImageView = {
        
        let emailImgView = UIImageView(image: UIImage.init(named: "icon-about-email"))
        
        return emailImgView
    }()
    
    private lazy var emailLabel: UILabel = {
        
        let emailLabel = UILabel()
        emailLabel.text = "good-as-old@example.com"
        emailLabel.textColor = UIColor.black
        emailLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightLight)
        
        return emailLabel
    }()
    
    private lazy var phoneImgView: UIImageView = {
        
        let phoneImgView = UIImageView(image: UIImage.init(named: "icon-about-phone"))
        
        return phoneImgView
    }()
    
    private lazy var phoneLabel: UILabel = {
        
        let phoneLabel = UILabel()
        phoneLabel.text = "666-888-0000"
        phoneLabel.textColor = UIColor.black
        phoneLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightLight)
        
        return phoneLabel
    }()
    
    private lazy var websiteImgView: UIImageView = {
        
        let websiteImgView = UIImageView(image: UIImage.init(named: "icon-about-website"))
        
        return websiteImgView
    }()
    
    private lazy var websiteLabel: UILabel = {
    
        let websiteLabel = UILabel()
        websiteLabel.text = "www.baidu.com"
        websiteLabel.textColor = UIColor.black
        websiteLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightLight)
        
        return websiteLabel
    }()
    
    //MARK:- 生命周期
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.automaticallyAdjustsScrollViewInsets = false
        
        initUI() //TODO:初始化UI
    }
    
    //MARK:- 自定义方法
    
    /// 初始化UI方法
    func initUI () {
        
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
        headerImgView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 125)
        scrollView.addSubview(headerImgView)
        
        label_1.frame = CGRect(x: 0, y: headerImgView.y + headerImgView.height + 59, width: 0, height: 0)
        label_1.sizeToFit()
        label_1.centerX = view.width / 2
        scrollView.addSubview(label_1)
        
        label_2.frame = CGRect(x: 0, y: label_1.y + label_1.height + 20, width: 228, height: 310)
        label_2.centerX = label_1.centerX
        scrollView.addSubview(label_2)
        
        label_3.frame = CGRect(x: 0, y: label_2.y + label_2.height + 10, width: 0, height: 0)
        label_3.sizeToFit()
        label_3.centerX = label_2.centerX
        scrollView.addSubview(label_3)
        
        emailImgView.frame = CGRect(x: 75, y: label_3.y + label_3.height + 25, width: 34, height: 34)
        scrollView.addSubview(emailImgView)
        
        emailLabel.frame = CGRect(x: emailImgView.x + emailImgView.width + 24, y: 0, width: 0, height: 0)
        emailLabel.sizeToFit()
        emailLabel.centerY = emailImgView.centerY
        scrollView.addSubview(emailLabel)
        
        phoneImgView.frame = CGRect(x: emailImgView.x, y: emailImgView.y + emailImgView.height + 14, width: emailImgView.width, height: emailImgView.height)
        scrollView.addSubview(phoneImgView)
        
        phoneLabel.frame = CGRect(x: phoneImgView.x + phoneImgView.width + 24, y: 0, width: 0, height: 0)
        phoneLabel.sizeToFit()
        phoneLabel.centerY = phoneImgView.centerY
        scrollView.addSubview(phoneLabel)
        
        websiteImgView.frame = CGRect(x: phoneImgView.x, y: phoneImgView.y + phoneImgView.height + 14, width: phoneImgView.width, height: phoneImgView.height)
        scrollView.addSubview(websiteImgView)
        
        websiteLabel.frame = CGRect(x: websiteImgView.x + websiteImgView.width + 24, y: 0, width: 0, height: 0)
        websiteLabel.sizeToFit()
        websiteLabel.centerY = websiteImgView.centerY
        scrollView.addSubview(websiteLabel)
    }
}
