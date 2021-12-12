//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 06/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate: MealsTableViewController?

    @IBOutlet var nameInput: UITextField?
    @IBOutlet var feelingInput: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        
        if let mealName = nameInput?.text, let mealGrade = feelingInput?.text {
            let name = mealName
            
            if let grade: Int = Int(mealGrade){
                let meal = Meal(name: name, grade: grade)
                print(meal.name)
                print(meal.grade)
                
                delegate?.addMeal(meal)
                navigationController?.popViewController(animated: true)
                
            }
                 
        } else {
            print("Error full")
        }
        
     
    
    }
    

}

