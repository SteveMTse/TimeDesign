//
//  FilterBar.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/24/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import UIKit
import ComponentKit

class FilterBar: emptyView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var Constraints: [String] = ["Sort By: Popular", "All"]
    
    var HomeViewController: SectionViewController?
    
    lazy var display: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    lazy var separateView:emptyView = {
        let view = emptyView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var hSeparateView:emptyView = {
        let view = emptyView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var filterLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Filter"
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textAlignment = NSTextAlignment.center
        lb.isUserInteractionEnabled = true
        return lb
    }()
    
    lazy var icon:UIImageView = {
        let imView = UIImageView.init(image: UIImage.arrDownImage)
        imView.sizeToFit()
        imView.isUserInteractionEnabled = true
        return imView
    }()
    
    lazy var menuForFilter: filterMenu = {
        let vi = filterMenu()
        vi.alpha = 0
        vi.tag = 11111
        return vi
    }()
    
    let id = "constraints"
    
    //let mainWindow = UIApplication.shared.keyWindow!
    
    override func setupView() {
        
        //backgroundColor = UIColor.backgdWhite
        
        addSubview(display)
        addSubview(separateView)
        addSubview(filterLabel)
        addSubview(icon)
        addSubview(hSeparateView)
        
        addConstraintWithFormat(format: "V:|-5-[v0]-5-[v1(0.2)]|", views: [display, hSeparateView])
        addConstraintWithFormat(format: "V:|-5-[v0]-5-|", views: [separateView])
        addConstraintWithFormat(format: "V:|-5-[v0]-5-|", views: [filterLabel])
        addConstraintWithFormat(format: "V:|-8-[v0]-8-|", views: [icon])
        addConstraintWithFormat(format: "H:|[v0]|", views: [hSeparateView])
        addConstraintWithFormat(format: "H:|-5-[v0][v1(1)]-5-[v2(43)][v3(\(heightOfFilterBar-16))]-5-|", views: [display, separateView, filterLabel, icon, hSeparateView])
        
        
        display.setNeedsLayout()
        //setNeedsLayout()
        
        filterLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showMenu)))
        icon.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showMenu)))
        
        display.register(constraintCell.self, forCellWithReuseIdentifier: id)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constraints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = display.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! constraintCell
        cell.label.text = Constraints[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = display.frame.height
        let bound = sizeOfTextView(str: Constraints[indexPath.item]+"****", size: CGSize.init(width: 1000, height: height), font: filterBarFont)
        return CGSize.init(width: bound.width, height: height)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func showMenu() {
        
        guard let home = self.HomeViewController else {
            return
        }
        
        home.showMenu(param: self.Constraints)
        
    }

}

class constraintCell: emptyCell {
    
    lazy var label: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor.clear
        lb.textAlignment = NSTextAlignment.center
        lb.font = UIFont.systemFont(ofSize: filterBarFont)
        return lb
    }()
    
    override func setupView() {
        
        addSubview(label)
        
        backgroundColor = UIColor.themeColor
        
        layer.cornerRadius = frame.height / 2
        
        addConstraintWithFormat(format: "H:|[v0]|", views: [label])
        addConstraintWithFormat(format: "V:|[v0]|", views: [label])
    }
}
