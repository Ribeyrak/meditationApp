//
//  Resouces.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

enum Resouces {
    enum Backgrounds {
        static let firstBack = UIImage(named: "p1")
        static let secondBack = UIImage(named: "p2")
        static let thirdBack = UIImage(named: "p3")
        static let fourBack = UIImage(named: "p4")
        static let fiveBack = UIImage(named: "p5")
    }
    
    enum TopLabel {
        static let firstScreen = "One & Only"
        static let secondScreen = "Al Selfcare"
        static let thirdScreen = "Meditate"
        static let fourScreen = "In Love"
        static let fiveScreen = "Mood"
    }
    
    enum BottomLabel {
        static let firstScreen = "Self Care App."
        static let secondScreen = "Expert."
        static let thirdScreen = "Stress less."
        static let fourScreen = "with Sleep."
        static let fiveScreen = "Journal."
    }
    
    enum DisciptLabel {
        static let firstScreen = "Relieve stress, drink coffee and chill the fuck with us, buddy"
        static let secondScreen = "Why did the soccer player take so long to eat dinner? Because he thought he couldn’t use his hands."
        static let thirdScreen = "Why did the teddy bear say no to dessert? Because she was stuffed"
        static let fourScreen = "Name the kind of tree you can hold in your hand? A palm tree!"
        static let fiveScreen = "Well, buddy, you got to this screen, and now what?"
    }
    
    enum ButtonLabel {
        static let next = "Continue"
    }
    
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
