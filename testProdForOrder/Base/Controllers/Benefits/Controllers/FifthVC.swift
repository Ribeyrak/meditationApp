//
//  FiveVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

class FifthVC: BaseViewController {

    //MARK: - Constants
    private enum Constants {
        static let topLabel = "Mood"
        static let bottomLabel = "Journal."
        static let descriptionLabel = "Well, buddy, you got to this screen, and now what?"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundImage.image = UIImage.Backgrounds.fiveBack
        firstLabel.text = Constants.topLabel
        secondLabel.text = Constants.bottomLabel
        screenDescrip.text = Constants.descriptionLabel
    }

    override func nextVC() {
        
        let nextVC = RegisterVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
