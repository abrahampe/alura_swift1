//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 07/12/21.
//

import UIKit

class Meal: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(grade, forKey: "grade")
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
       name = coder.decodeObject(forKey: "name") as! String
        grade = coder.decodeInteger(forKey: "grade")
        items = coder.decodeInteger(forKey: "items") as! Array<Item>
    }
    

    let name: String
    let grade: Int
    var items: Array <Item> = []
    
    init(name: String, grade:Int, items: [Item] = []) {
        self.name = name
        self.grade = grade
        self.items = items
    }
    
    
    func totalCalories() -> Double {
        var total:Double = 0.0
        for item in items {
            total += item.calories
            
        }
        
        return total
    }

    func details() -> String {
        var message = "Refeição: \(name) - Felicidade: \(grade) - Total Calories: \(totalCalories())"
        for item in items {
            message += "\n\t\(item.name) - Calories: \(item.calories)"
        }
        
        return message
    }

}
