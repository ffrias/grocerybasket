//
//  Product.swift
//  groceryBasket
//
//  Created by Federico Frias on 22/11/2018.
//  Copyright © 2018 ffrias. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: Mappable{
    var name: String?
    var baskets: [Int]?
    var unitCost: Float?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map){
        name <- map["name"]
        baskets <- map["baskets"]
        unitCost <- map["unit_cost"]
    }
}
