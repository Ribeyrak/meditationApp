//
//  Second.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 15.03.2023.
//

import UIKit

class SecondVC: BaseViewController {

    //MARK: - Constants
    private enum Constants {
        static let topLabel = "Al Selfcare"
        static let bottomLabel = "Expert."
        static let descriptionLabel = "Why did the soccer player take so long to eat dinner? Because he thought he couldn’t use his hands."
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundImage.image = UIImage.Backgrounds.secondBack
        firstLabel.text = Constants.topLabel
        secondLabel.text = Constants.bottomLabel
        screenDescrip.text = Constants.descriptionLabel
    }

    override func nextVC() {
        
        let nextVC = ThirdVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
