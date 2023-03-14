//
//  Third.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 15.03.2023.
//

import UIKit

class ThirdVC: BaseViewController {

    //MARK: - Constants
    private enum Constants {
        static let topLabel = "Meditate"
        static let bottomLabel = "Stress less."
        static let descriptionLabel = "Why did the teddy bear say no to dessert? Because she was stuffed"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundImage.image = UIImage.Backgrounds.thirdBack
        firstLabel.text = Constants.topLabel
        secondLabel.text = Constants.bottomLabel
        screenDescrip.text = Constants.descriptionLabel
    }

    override func nextVC() {
        
        let nextVC = FourthVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
