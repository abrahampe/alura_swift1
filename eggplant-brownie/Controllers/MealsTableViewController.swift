//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 10/12/21.
//

import UIKit

protocol AddMealDelegate {
    func addMeal(_ meal: Meal)
}

class MealsTableViewController: UITableViewController, AddMealDelegate {
  
    var meals = [
        Meal(name: "Macarrão", grade: 5),
        Meal(name: "Azeite", grade: 4),
        Meal(name: "Chocolate", grade: 5),
        Meal(name: "Chicória", grade: 1),
   ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        return cell
    }
    
    func addMeal(_ meal: Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
        
    }
    
}
