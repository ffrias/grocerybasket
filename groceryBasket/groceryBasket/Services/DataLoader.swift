//
//  DataLoader.swift
//  groceryBasket
//
//  Created by Federico Frias on 22/11/2018.
//  Copyright © 2018 ffrias. All rights reserved.
//

import Foundation
import ObjectMapper

class DataLoader{
    static let sharedInstance = DataLoader()
    fileprivate init(){}
    var products = [Product]()
    static let getDataFromJsonFileNotification = "getDataFromJsonFileNotification"
    
    func loadFile(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                products = Mapper<Product>().mapArray(JSONString: jsonString)!
                print("File read OK")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getDataFromJsonFileNotification"), object: nil)
                
            }catch {
                print("File read error")
            }
        }else{
            print("Error when trying to load json file")
        }
    }
}
