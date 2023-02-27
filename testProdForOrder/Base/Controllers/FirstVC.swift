//
//  FirstVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit
import SnapKit

class FirstVC: UIViewController {
    //MARK: - Constants
    private enum Constants {
        static let topLabel = "One & Only"
        static let bottomLabel = "Self Care App."
        static let discriptionLabel = "Relieve stress, drink coffee and chill the fuck with us, buddy"
        static let nextScreenButton = "Continue"
    }

    //MARK: - UI
    private let backgroundImage = UIImageView()
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let screenDescrip = UILabel()
    private let nextScreenButton = NextScreenButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        setupViews()
        configureAppearance()
    }
    
    //MARK: - Private functions
    private func setupViews() {
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.left.right.equalToSuperview().inset(15)
        }
        
        view.addSubview(secondLabel)
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).inset(8)
            $0.left.right.equalToSuperview().inset(15)
        }
        
        view.addSubview(screenDescrip)
        screenDescrip.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(15)
        }
        
        view.addSubview(nextScreenButton)
        nextScreenButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(34)
            $0.height.equalTo(75)
        }
    }
    
    private func configureAppearance() {

        navigationController?.navigationBar.isHidden = true
        
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage.Backgrounds.firstBack
        
        firstLabel.text = Constants.topLabel
        firstLabel.textColor = UIColor(hexString: "#63B2FB")
        firstLabel.font = .systemFont(ofSize: 52, weight: .bold)
        
        secondLabel.text = Constants.bottomLabel
        secondLabel.textColor = .white
        secondLabel.font = .systemFont(ofSize: 52, weight: .bold)
        
        screenDescrip.text = Constants.discriptionLabel
        screenDescrip.font = .systemFont(ofSize: 19, weight: .light)
        screenDescrip.textColor = .white
        screenDescrip.numberOfLines = 0
        
        nextScreenButton.setTitle(Constants.nextScreenButton)
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func nextVC() {
        let nextVC = SecondVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
