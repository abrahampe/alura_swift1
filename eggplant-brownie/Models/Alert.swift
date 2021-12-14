//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Abraao Barros on 14/12/21.
//

import UIKit

class Alert {

    let controller: UIViewController
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func show(title: String = "Atenção", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let btnOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(btnOk)
        controller.present(alert, animated: true, completion: nil)
        
    }
    
}
