//
//  FourVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

class FourthVC: BaseViewController {

    //MARK: - Constants
    private enum Constants {
        static let topLabel = "In Love"
        static let bottomLabel = "with Sleep."
        static let descriptionLabel = "Name the kind of tree you can hold in your hand? A palm tree!"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundImage.image = UIImage.Backgrounds.fourBack
        firstLabel.text = Constants.topLabel
        secondLabel.text = Constants.bottomLabel
        screenDescrip.text = Constants.descriptionLabel
    }

    override func nextVC() {
        
        let nextVC = FifthVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
