//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 06/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemsDelegate {
    
    
    
    
    // MARK: - Atributtes
    var delegate: AddMealDelegate?
    
    var itens: [Item] = [Item(name: "Eggplant brownie", calories: 10),
                         Item(name: "Zucchini brownie", calories: 20),
                         Item(name: "Mushroom brownie", calories: 30),
                         Item(name: "Branco brownie", calories: 40),
                         Item(name: "strudel", calories: 50)]
    var selectedItens: [Item] = []
    
    
    // MARK: - Outlets
    @IBOutlet var nameInput: UITextField?
    @IBOutlet var feelingInput: UITextField?
    
    @IBOutlet weak var itemsTable: UITableView!
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newItemButton = UIBarButtonItem(title: "Novo Item", style: .plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem() {
        //let newItem = NewItemViewController(delegate: self)
        let addItemsViewController = AddItensViewController(delegate: self)
        navigationController?.pushViewController(addItemsViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itemsTable.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func add(_ sender: Any) {
        
        if let mealName = nameInput?.text, let mealGrade = feelingInput?.text {
            let name = mealName
            
            if let grade: Int = Int(mealGrade){
                let meal = Meal(name: name, grade: grade, items: selectedItens)
                
                
                delegate?.addMeal(meal)
                navigationController?.popViewController(animated: true)
                
            }
            
        } else {
            print("Error full")
        }
        
        
        
    }
    
    // MARK - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let item = itens[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        let row = indexPath.row
        let item = itens[row]
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            if let position = selectedItens.firstIndex(of: item) {
                selectedItens.remove(at: position)
            }
            
        } else {
            cell.accessoryType = .checkmark
            
            selectedItens.append(itens[row])
        }
        
    }
    
}

