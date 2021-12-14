//
//  AddItensViewController.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 12/12/21.
//

import UIKit

protocol AddItemsDelegate {
    func add(_ item: Item)
}

class AddItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    
    // MARK: - Properties
    
    var delegate: AddItemsDelegate?
    
    init(delegate: AddItemsDelegate) {
        self.delegate = delegate
        super.init(nibName: "AddItensViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - IBACTIONS
    
    @IBAction func addItem(_ sender: Any) {
        guard let name = nameField.text, let calories = caloriesField.text else {
            return
        }
        
        do  {

            
            
            if let calories = Double(calories) {
                let item = Item(name: name, calories: calories)
                delegate?.add(item)
                Alert(controller: self).show(title: "Information", message: "Daddy liked it ")
                
            } else {
                Alert(controller: self).show(title: "Erro", message: "Calorias inválidas")
            }
         
        } catch {
            Alert(controller: self).show(title: "Erro", message: "Calorias inválidas")
        }
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
