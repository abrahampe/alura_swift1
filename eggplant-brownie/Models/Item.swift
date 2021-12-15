//
//  Item.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 07/12/21.
//

import UIKit

class Item: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calories = coder.decodeObject(forKey: "calories") as! Double
    }
    
    
    let name: String
    let calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
    
  
}
