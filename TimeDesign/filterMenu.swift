//
//  filterMenu.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/25/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import UIKit
import ComponentKit

class filterMenuViewController: emptyViewController {
    
    var interactor:Interactor? = nil
    
    var filterBy: [String] = ["Sort By: Popular", "All"] {
        
        didSet {
            self.filterMen.const = filterBy
            //print(2222222)
        }
    
    }
    
    lazy var blackView: emptyView = {
        let black = emptyView()
        black.backgroundColor = UIColor.translucentBlack
        return black
    }()
    
    lazy var filterMen: filterMenu = {
        let fv = filterMenu()
        return fv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(111111)
        
        let gap = dim.width * 0.3
        
        self.view.addSubview(blackView)
        self.view.addSubview(filterMen)
        
        self.view.addConstraintWithFormat(format: "H:|[v0]|", views: [blackView])
        self.view.addConstraintWithFormat(format: "V:|[v0]|", views: [blackView])
        
        self.view.addConstraintWithFormat(format: "H:|-\(gap)-[v0]|", views: [filterMen])
        self.view.addConstraintWithFormat(format: "V:|-\(heightOfNavigationBar+heightOfFilterBar)-[v0]|", views: [filterMen])
        
        blackView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleDismiss)))
        
    }
    
    func handleDismiss() {
        dismiss(animated: true, completion: nil);
    }
    
}

/*Configuration of the menu begin*/

class filterMenu: emptyView, UITableViewDelegate, UITableViewDataSource {
    
    var const: [String] = ["Sort By: Popular", "All"] {
        didSet {
            let set1 = Set(const)
            let set2 = Set(["Sort By: Popular", "All"])
            
            let diff = set1.symmetricDifference(set2)
            
            if diff.isEmpty {
                (self.titleView.viewWithTag(22222) as! UIButton).isEnabled = false
            }
            else {
                (self.titleView.viewWithTag(22222) as! UIButton).isEnabled = true
            }
        }
    }

    let id = "table"
    
    lazy var titleView: emptyView = {
        let vi = emptyView()
        let label = UILabel()
        let button = UIButton.init(type: .system)
        button.tag = 22222
        button.setTitle("Clear All", for: [])
        //button.setTitleColor(UIColor.blue, for: [])
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(clearAll), for: .touchDown)
        label.text = "Filter By:"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        vi.addSubview(label)
        vi.addSubview(button)
        vi.addConstraintWithFormat(format: "H:|-5-[v0(100)]-100-[v1]|", views: [label, button])
        vi.addConstraintWithFormat(format: "V:|-5-[v0]-5-|", views: [button])
        vi.addConstraintWithFormat(format: "V:|-5-[v0]-5-|", views: [label])
        vi.backgroundColor = UIColor.backgdWhite
        return vi
    }()
    
    lazy var table: UITableView = {
        let tb = UITableView()
        tb.dataSource = self
        tb.delegate = self
        return tb
    }()
    
    func clearAll() {
        print("OK")
    }
    
    override func setupView() {
        backgroundColor = UIColor.white
        
        
        
        let shapeLayer = CAShapeLayer()
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        shapeLayer.path = createBezierPath().cgPath
        
        // apply other properties related to the path
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.backgdWhite.cgColor
        shapeLayer.lineWidth = 1.0
        
        let width = UIScreen.main.bounds.width * 0.7
        
        shapeLayer.position = CGPoint(x: width - 20, y: -10)
        
        // add the new layer to our custom view
        self.layer.addSublayer(shapeLayer)
        
        addSubview(table)
        addSubview(titleView)
        
        addConstraintWithFormat(format: "H:|[v0]|", views: [table])
        addConstraintWithFormat(format: "H:|[v0]|", views: [titleView])
        addConstraintWithFormat(format: "V:|[v0(40)][v1]|", views: [titleView, table])
        
        table.register(emptyTableCell.self, forCellReuseIdentifier: id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: id, for: indexPath)
        return cell
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.*/
    
    func createBezierPath() -> UIBezierPath {
        let fillPath = UIBezierPath.init()
        fillPath.move(to: CGPoint.init(x: 0, y: 0))
        fillPath.addLine(to: CGPoint.init(x: 30, y: 40))
        fillPath.addLine(to: CGPoint.init(x: -30, y: 40))
        fillPath.addLine(to: CGPoint.init(x: 0, y: 0))
        fillPath.close()
        
        return fillPath
    }
}

class menuTableCell: emptyTableCell {
}

/*Configuration of the menu end*/
