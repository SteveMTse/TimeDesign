//
//  loginPageViewController.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/26/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import UIKit
import ComponentKit

class loginPage: emptyViewController, UITextFieldDelegate {
    
    let textFieldContainerDim: CGSize = CGSize.init(width: dim.width * 0.7, height: 40)
    let borderWidth: CGFloat = 0.4
    
    lazy var logo: UIImageView = {
        let im = UIImageView()
        im.image = UIImage.OiconImage
        im.sizeToFit()
        return im
    }()
    
    lazy var back: UIImageView = {
        let im = UIImageView()
        im.image = UIImage.backImage
        im.isUserInteractionEnabled = true
        im.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleDismiss)))
        im.sizeToFit()
        return im
    }()
    
    lazy var accountContainer: textFieldContainer = {
        let cv = textFieldContainer()
        cv.str = ("Account", "Email or Phone Number")
        cv.text.delegate = self
        cv.text.isSecureTextEntry = false
        cv.text.autocapitalizationType = UITextAutocapitalizationType.none
        cv.text.tag = 0
        return cv
    }()
    
    lazy var passwordContainer: textFieldContainer = {
        let cv = textFieldContainer()
        cv.str = ("Password", "Password")
        cv.text.delegate = self
        return cv
    }()
    
    lazy var regButton: buttonContainer = {
        let bt = buttonContainer()
        bt.lb.text = "Register"
        return bt
    }()
    
    lazy var loginButton: buttonContainer = {
        let bt = buttonContainer()
        bt.lb.text = "Log in"
        bt.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleLogin)))
        return bt
    }()
    
    lazy var QQLogin: alterLoginOptContainer = {
        let cv = alterLoginOptContainer()
        cv.backgroundColor = UIColor.brown
        return cv
    }()
    
    func handleDismiss() {
        self.accountContainer.text.resignFirstResponder()
        self.passwordContainer.text.resignFirstResponder()
        self.accountContainer.text.text = nil
        self.passwordContainer.text.text = nil
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func handleLogin() {
        print(self.accountContainer.text.text)
        print(self.passwordContainer.text.text)
        self.accountContainer.text.resignFirstResponder()
        self.passwordContainer.text.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoDim: CGFloat = 35
        let backButtonDim: CGFloat = 30
        let font: CGFloat = 17
        let buttonDim = sizeOfTextView(str: "Register****", size: CGSize.init(width: 100, height: textFieldContainerDim.height), font: font)
        
        self.view.addSubview(logo)
        self.view.addSubview(back)
        self.view.addSubview(accountContainer)
        self.view.addSubview(passwordContainer)
        self.view.addSubview(regButton)
        self.view.addSubview(loginButton)
        self.view.addSubview(QQLogin)
        
        self.view.addConstraintWithFormat(format: "H:|-\((dim.width - logoDim)/2)-[v0]-\((dim.width - logoDim)/2)-|", views: [logo])
        self.view.addConstraintWithFormat(format: "V:|-\(2*statusBarHeight)-[v0(\(logoDim))]", views: [logo])
        
        self.view.addConstraintWithFormat(format: "H:|-\(dim.width * 0.05)-[v0(\(backButtonDim))]", views: [back])
        self.view.addConstraintWithFormat(format: "V:|-\(3*statusBarHeight + logoDim)-[v0(\(backButtonDim))]", views: [back])
        
        self.view.addConstraintWithFormat(format: "H:|-\((dim.width - textFieldContainerDim.width)/2)-[v0(\(textFieldContainerDim.width))]-\((dim.width - textFieldContainerDim.width)/2)-|", views: [accountContainer])
        self.view.addConstraintWithFormat(format: "V:|-\(3*statusBarHeight + logoDim + 1.35 * heightOfNavigationBar)-[v0(\(textFieldContainerDim.height))]", views: [accountContainer])
        
        self.view.addConstraintWithFormat(format: "H:|-\((dim.width - textFieldContainerDim.width)/2)-[v0(\(textFieldContainerDim.width))]-\((dim.width - textFieldContainerDim.width)/2)-|", views: [passwordContainer])
        self.view.addConstraintWithFormat(format: "V:|-\(3*statusBarHeight + logoDim + 1.35 * heightOfNavigationBar + textFieldContainerDim.height + 25)-[v0(\(textFieldContainerDim.height))]", views: [passwordContainer])
        
        self.view.addConstraintWithFormat(format: "V:|-\(3*statusBarHeight + logoDim + 1.35 * heightOfNavigationBar + 2 * textFieldContainerDim.height + 85)-[v0(\(textFieldContainerDim.height))]", views: [regButton])
        self.view.addConstraintWithFormat(format: "V:|-\(3*statusBarHeight + logoDim + 1.35 * heightOfNavigationBar + 2 * textFieldContainerDim.height + 85)-[v0(\(textFieldContainerDim.height))]-\(heightOfNavigationBar * 1.2)-[v1(\(textFieldContainerDim.height * 1.2))]", views: [loginButton, QQLogin])
        let gap = (dim.width - 2 * buttonDim.width) / 3
        //print(gap)
        let _ = "H:|-\(gap)-[v0(\(buttonDim.width))]-20-[v1(\(buttonDim.width))]"
        self.view.addConstraintWithFormat(format: "H:|-\(gap)-[v0(\(buttonDim.width))]-\(gap)-[v1]-\(gap)-|", views: [regButton, loginButton])
        
        let dimForAlterLoginButton = textFieldContainerDim.width * 0.85
        self.view.addConstraintWithFormat(format: "H:|-\((dim.width - dimForAlterLoginButton)/2)-[v0(\(dimForAlterLoginButton))]|", views: [QQLogin])
        
        self.view.backgroundColor = UIColor.loginBackgrd
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            self.accountContainer.layer.borderColor = UIColor.blue.cgColor
            self.passwordContainer.layer.borderColor = UIColor.black.cgColor
            (self.accountContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.blue
            (self.passwordContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
        case 1:
            self.accountContainer.layer.borderColor = UIColor.black.cgColor
            self.passwordContainer.layer.borderColor = UIColor.blue.cgColor
            (self.accountContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
            (self.passwordContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.blue
        default:
            self.accountContainer.layer.borderColor = UIColor.black.cgColor
            self.passwordContainer.layer.borderColor = UIColor.black.cgColor
            (self.accountContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
            (self.passwordContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        self.accountContainer.layer.borderColor = UIColor.black.cgColor
        self.passwordContainer.layer.borderColor = UIColor.black.cgColor
        (self.accountContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
        (self.passwordContainer.viewWithTag(98765) as! UILabel).textColor = UIColor.black
    }
    
}

/*Component In this Page*/
class alterLoginOptContainer: emptyView {
    
    lazy var icon: UIImageView = {
        let im = UIImageView()
        im.sizeToFit()
        return im
    }()
    
    lazy var label: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        return lb
    }()
    
    override func setupView() {
        
        let selfDim = self.frame
        
        addSubview(icon)
        
        print(selfDim)
        //addConstraintWithFormat(format: "H:|[v0()]|", views: <#T##[UIView]#>)
        
    }
}

class buttonContainer: emptyView {
    
    lazy var lb = UILabel()
    lazy var im = UIImageView.init(image: UIImage.buttonInLoginPageImage)
    
    override func setupView() {
        lb.textAlignment = NSTextAlignment.center
        lb.tag = 98765
        lb.backgroundColor = UIColor.clear
        addSubview(im)
        addSubview(lb)
       
        addConstraintWithFormat(format: "H:|[v0]|", views: [im])
        addConstraintWithFormat(format: "V:|[v0]|", views: [im])
        addConstraintWithFormat(format: "H:|[v0]|", views: [lb])
        addConstraintWithFormat(format: "V:|[v0]|", views: [lb])
    }
}

class textFieldContainer: emptyView {
    
    var str: (String, String) = ("", "") {
        didSet {
            lb.text = str.0
            //How to change the color of placeholder
            text.attributedPlaceholder = NSAttributedString.init(string: str.1, attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
        }
    }
    
    let textFieldContainerDim: CGSize = CGSize.init(width: dim.width * 0.7, height: 40)
    let borderWidth: CGFloat = 0.4
    let font: CGFloat = 17
    let lb = UILabel.init()
    
    let arr = UIImageView.init(image: UIImage.reverseBackImage)
    let text = UITextField()
    
    let arrDim: CGFloat = 10
    
    override func setupView() {
        
        
        let bound = sizeOfTextView(str: "Password", size: CGSize.init(width: 100, height: self.textFieldContainerDim.height), font: font)
        layer.borderWidth = self.borderWidth
        lb.tag = 98765
        text.font = UIFont.systemFont(ofSize: font)
        text.tag = 1
        arr.tintColor = UIColor.lightGray
        arr.sizeToFit()
        text.isSecureTextEntry = true
        lb.font = UIFont.systemFont(ofSize: font)
        addSubview(lb)
        addSubview(arr)
        addSubview(text)
        addConstraintWithFormat(format: "H:|-5-[v0(\(bound.width))][v1(10)][v2]|", views: [lb, arr, text])
        addConstraintWithFormat(format: "V:|[v0]|", views: [lb])
        addConstraintWithFormat(format: "V:|-\((self.textFieldContainerDim.height - arrDim)/2)-[v0]-\((self.textFieldContainerDim.height - arrDim)/2)-|", views: [arr])
        addConstraintWithFormat(format: "V:|[v0]|", views: [text])
        
    }
}
