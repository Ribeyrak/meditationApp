//
//  String + ext.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 31.01.2023.
//

import Foundation

extension String {
    func isValidName(name: String) -> Bool {
        let nameRegEx = "[A-Z0-9a-z]{2,20}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        let result = nameTest.evaluate(with: name)
        return result
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegEx = "[0-9]{6,14}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let result = phoneTest.evaluate(with: phone)
        return result
    }
}
