//
//  Validator.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 31.01.2023.
//

import UIKit

class Validator: NSObject {
    
    func simpleAlert(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
