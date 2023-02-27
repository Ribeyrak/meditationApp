//
//  UIFont + ext.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.02.2023.
//

import UIKit

extension UIFont {
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        static func georgiaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Georgia", size: size) ?? UIFont()
        }
        static func ralewayRegular(with size: CGFloat, and bold: UIFont.Weight) -> UIFont {
            UIFont(name: "Raleway", size: size) ?? UIFont()
        }
    }
}
