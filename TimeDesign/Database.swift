//
//  Database.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/25/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation

class data: NSObject {
    
    var items:[Item] = {
        
        var Items: [Item] = []
        
        for i in 0..<100 {
            let it = Item()
            if i % 2 == 0 {
                it.itemImage = "testIm"
                it.title = "2.42ct White Round Cut Diamond Lotus Flower Engagement Wedding Ring"
                it.price = "$1999.89"
            }
            else {
                it.itemImage = "testIm"
                it.title = "Panthere Cartier Ring"
                it.price = "$29999.12"
            }
            Items.append(it)
        }
        
        return Items
    }()
    
}
