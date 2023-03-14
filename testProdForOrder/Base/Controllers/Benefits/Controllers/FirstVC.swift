//
//  FirstVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 14.03.2023.
//

import UIKit

class FirstVC: BaseViewController {

    //MARK: - Constants
    private enum Constants {
        static let topLabel = "One & Only"
        static let bottomLabel = "Self Care App."
        static let descriptionLabel = "Relieve stress, drink coffee and chill the fuck with us, buddy"
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundImage.image = UIImage.Backgrounds.firstBack
        firstLabel.text = Constants.topLabel
        secondLabel.text = Constants.bottomLabel
        screenDescrip.text = Constants.descriptionLabel
    }

    override func nextVC() {
        //super.nextVC()
        
        let nextVC = SecondVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
