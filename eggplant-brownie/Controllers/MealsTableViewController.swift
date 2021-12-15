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
    
    override func viewDidLoad() {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let path = directory.appendingPathComponent("meal")
        
        do {
            let data = try Data(contentsOf: path)
            guard let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Meal] else {return}
            meals = savedMeals
            print(meals)
        } catch {
            print(error.localizedDescription)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            
            let cell = gesture.view as! UITableViewCell
            guard let indexPath =  tableView.indexPath(for: cell) else {
                return
            }
            let meal = meals[indexPath.row]
            let cancelButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            let removeButton = UIAlertAction(title: "Remover", style: .destructive, handler: {
                alert in
                self.meals.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
            var message = "Nível de felicidade: \(meal.grade)"
            for item in meal.items {
                message += "\n- \(item.name) - calorias: \(item.calories)"
            }
            
            let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
            alert.addAction(cancelButton)
            alert.addAction(removeButton)
        }
        
        
    }
    
    func addMeal(_ meal: Meal){
        meals.append(meal)
        tableView.reloadData()
        
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let path = directory.appendingPathComponent("meal")
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            print(data)
            try data.write(to: path)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func removeMeal(alert: UIAlertAction){
        print("remove meal")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
        
    }
    
}
