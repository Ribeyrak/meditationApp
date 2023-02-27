//
//  UIView + ext.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

extension UIView {
    // button change color when tapped
    func makeSystem(_ botton: UIButton) {
        
        botton.addTarget(self, action: #selector(hendleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        botton.addTarget(self, action: #selector(hendleOut), for: [
            .touchUpInside,
            .touchDragOutside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func hendleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
        
    }
    
    @objc func hendleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
}
