//
//  emptyView.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/24/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import UIKit

class emptyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        //Generic View. DO NOT ADD ANY THING HERE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
