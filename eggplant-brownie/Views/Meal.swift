//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 07/12/21.
//

import UIKit

class Meal: NSObject {

    let name: String
    let grade: Int
    let items: Array <Item> = []
    
    init(name: String, grade:Int) {
        self.name = name
        self.grade = grade
    }
    
    
    func totalCalories() -> Double {
        var total:Double = 0.0
        for item in items {
            total += item.calories
            
        }
        
        return total
    }

}
