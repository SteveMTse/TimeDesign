//
//  emptyCell.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/24/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import UIKit

class emptyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setupView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
}
