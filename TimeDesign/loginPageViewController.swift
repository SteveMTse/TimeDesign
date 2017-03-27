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

class loginPage: emptyViewController {
    
    lazy var logo: UIImageView = {
        let im = UIImageView()
        im.image = UIImage.OiconImage
        im.sizeToFit()
        return im
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoDim: CGFloat = 40
        
        self.view.addSubview(logo)
        
        self.view.addConstraintWithFormat(format: "H:|-\((dim.width - logoDim)/2)-[v0]-\((dim.width - logoDim)/2)-|", views: [logo])
        self.view.addConstraintWithFormat(format: "V:|-\(2*statusBarHeight)-[v0(\(logoDim))]", views: [logo])
        
        self.view.backgroundColor = UIColor.loginBackgrd
    }
    
    
}
