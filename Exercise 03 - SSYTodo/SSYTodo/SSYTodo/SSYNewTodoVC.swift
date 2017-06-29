//
//  SSYNewTodoVC.swift
//  SSYTodo
//
//  Created by 邵仕宇 on 2017/6/27.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

protocol SSYNewTodoVCCustomDelegate {
    func addDataDelegate(data:SSYModel)
    func editDataDelegate(data:SSYModel, row:Int)
}

class SSYNewTodoVC: UIViewController {
    
    var data:SSYModel?
    
    var row:Int?
    
    var customDelegate:SSYNewTodoVCCustomDelegate?

    private lazy var childButton: UIButton = {[unowned self] in
        
        let childButton = UIButton(type: .custom)
        childButton.setImage(UIImage.init(named: "child"), for: .normal)
        childButton.setImage(UIImage.init(named: "child-selected"), for: .selected)
        childButton.frame = CGRect.init(x: 33, y: 123, width: 50, height: 50)
        childButton.addTarget(self, action: #selector(buttonClikc(_:)), for: .touchUpInside)
        
        return childButton
    }()
    
    private lazy var phoneButton: UIButton = {[unowned self] in
        
        let phoneButton = UIButton(type: .custom)
        phoneButton.setImage(UIImage.init(named: "phone"), for: .normal)
        phoneButton.setImage(UIImage.init(named: "phone-selected"), for: .selected)
        phoneButton.frame = CGRect.init(x: self.childButton.x + self.childButton.width + 33, y:self.childButton.y, width: self.childButton.width, height: self.childButton.height)
        phoneButton.addTarget(self, action: #selector(buttonClikc(_:)), for: .touchUpInside)
        
        return phoneButton
    }()
    
    private lazy var shoppingCartButton: UIButton = {[unowned self] in
        
        let shoppingCartButton = UIButton(type: .custom)
        shoppingCartButton.setImage(UIImage.init(named: "shopping-cart"), for: .normal)
        shoppingCartButton.setImage(UIImage.init(named: "shopping-cart-selected"), for: .selected)
        shoppingCartButton.frame = CGRect(x: self.phoneButton.x + self.phoneButton.width + 33, y: self.phoneButton.y, width: self.phoneButton.width, height: self.phoneButton.height)
        shoppingCartButton.addTarget(self, action: #selector(buttonClikc(_:)), for: .touchUpInside)
        
        return shoppingCartButton
    }()
    
    private lazy var travelButton: UIButton = {[unowned self] in
        
        let travelButton = UIButton(type: .custom)
        travelButton.setImage(UIImage.init(named: "travel"), for: .normal)
        travelButton.setImage(UIImage.init(named: "travel-selected"), for: .selected)
        travelButton.frame = CGRect(x: self.shoppingCartButton.x + self.shoppingCartButton.width + 33, y: self.shoppingCartButton.y, width: self.shoppingCartButton.width, height: self.shoppingCartButton.height)
        travelButton.addTarget(self, action: #selector(buttonClikc(_:)), for: .touchUpInside)
        
        return travelButton
    }()
    
    private lazy var todoTitleLabel: UILabel = {[unowned self] in
        
        let todoTitleLabel = UILabel(frame: CGRect(x: 33, y:self.travelButton.y + self.travelButton.height + 50 , width: 0, height: 0))
        todoTitleLabel.text = "Todo Title:"
        todoTitleLabel.textColor = UIColor.black
        todoTitleLabel.font = UIFont.systemFont(ofSize: 17)
        todoTitleLabel.sizeToFit()
        
        return todoTitleLabel
    }()
    
    private lazy var todoTextField: UITextField = {[unowned self] in
        
        let todoTextField = UITextField()
        todoTextField.frame = CGRect(x: self.todoTitleLabel.x + self.todoTitleLabel.width + 39, y: 0, width: 182, height: 30)
        todoTextField.centerY = self.todoTitleLabel.centerY
        todoTextField.borderStyle = .roundedRect
        todoTextField.font = UIFont.systemFont(ofSize: 14)
        
        return todoTextField
    }()
    
    private lazy var datePicker: UIDatePicker = {[unowned self] in
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 0, y: self.todoTextField.y + self.todoTextField.height + 35, width: self.view.width, height: 200)
        datePicker.datePickerMode = .date
        datePicker.minuteInterval = 1

        
        return datePicker
    }()
    
    private lazy var doneButton: UIButton = {[unowned self] in
        
        let doneButton = UIButton(type: .custom)
        doneButton.setTitle("ADD", for: .normal)
        doneButton.setTitleColor(UIColor.blue, for: .normal)
        doneButton.frame = CGRect(x: 0, y: self.datePicker.y + self.datePicker.height + 20, width: 0, height: 0)
        doneButton.sizeToFit()
        doneButton.centerX = self.view.centerX
        doneButton.addTarget(self, action: #selector(doneButtonClick), for: .touchUpInside)
        
        return doneButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        initData()
        
        initUI()
    }
    
    //MARK:- 初始化方法
    
    
    /// 初始化数据
    private func initData() {
        
        if let data = data {
            
            self.title = "Edit Todo"
            
            if data.image == "child-selected" {
                childButton.isSelected = true
            }
            else if data.image == "phone-selected" {
                phoneButton.isSelected = true
            }
            else if data.image == "shopping-cart-selected" {
                shoppingCartButton.isSelected = true
            }
            else if data.image == "travel-selected" {
                travelButton.isSelected = true
            }
            todoTextField.text = data.title
            datePicker.setDate(data.date, animated: true)
        }
        else {
            self.title = "New Todo"
            childButton.isSelected = true
        }
        
    }
    
    /// 初始化UI
    private func initUI() {
    
        view.backgroundColor = UIColor.white
        
        
        view.addSubview(childButton)
        view.addSubview(phoneButton)
        view.addSubview(shoppingCartButton)
        view.addSubview(travelButton)
        view.addSubview(todoTitleLabel)
        view.addSubview(todoTextField)
        view.addSubview(datePicker)
        view.addSubview(doneButton)
    }
    
    //MARK:- 点击事件响应
    
    func buttonClikc(_ button:UIButton) {
        
        resetButtons()
        
        button.isSelected = true
        
    }
    
    func doneButtonClick() {
        
        var image = ""
        if childButton.isSelected == true {
            image = "child-selected"
        }
        else if phoneButton.isSelected == true {
            image = "phone-selected"
        }
        else if shoppingCartButton.isSelected == true {
            image = "shopping-cart-selected"
        }
        else if travelButton.isSelected == true {
            image = "travel-selected"
        }
        
        if let data = data {
            data.id = (self.data?.id)!
            data.image = image
            data.title = todoTextField.text!
            data.date = datePicker.date
            if let customDelegate = customDelegate {
                customDelegate.editDataDelegate(data: data, row: self.row!)
            }
        }
        else {
            let uuid = UUID().uuidString
            data = SSYModel(id: uuid, image: image, title: todoTextField.text!, date: datePicker.date)
            if let customDelegate = customDelegate {
                customDelegate.addDataDelegate(data: data!)
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    //MARK:- 自定义方法
    
    private func resetButtons() {
        
        childButton.isSelected = false
        phoneButton.isSelected = false
        shoppingCartButton.isSelected = false
        travelButton.isSelected = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}
