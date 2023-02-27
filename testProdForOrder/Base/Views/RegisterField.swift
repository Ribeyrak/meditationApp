//
//  RegisterField.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 31.01.2023.
//

import UIKit

class RegisterField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(_ holder: String) {
        placeholder = holder
    }
    
    //MARK: Private func
    func configure() {
        backgroundColor = .white.withAlphaComponent(0.5)
        layer.cornerRadius = 14
        font = .systemFont(ofSize: 18)
        layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        autocorrectionType = .no
    }
    
}

extension RegisterField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardAppearance = .default
        if textField == self {
            becomeFirstResponder()
        }
        backgroundColor = .white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        backgroundColor = .white.withAlphaComponent(0.5)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self {
            resignFirstResponder()
        }
        return true
    }
}
