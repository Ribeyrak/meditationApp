//
//  BaseController.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 14.03.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Constants
    private enum Constants {
        static let nextScreenButton = "Continue"
    }

    //MARK: - UI
    let backgroundImage = UIImageView()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let screenDescrip = UILabel()
    let nextScreenButton = NextScreenButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func configureAppearance() {

        navigationController?.navigationBar.isHidden = true
        
        backgroundImage.contentMode = .scaleAspectFill
        
        firstLabel.textColor = UIColor(hexString: "#63B2FB")
        firstLabel.font = .systemFont(ofSize: 52, weight: .bold)
        
        secondLabel.textColor = .white
        secondLabel.font = .systemFont(ofSize: 52, weight: .bold)
        
        screenDescrip.font = .systemFont(ofSize: 19, weight: .light)
        screenDescrip.textColor = .white
        screenDescrip.numberOfLines = 0
        
        nextScreenButton.setTitle(Constants.nextScreenButton)
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }

    //MARK: - Actions
    @objc func nextVC() {
        fatalError("Must be implemented in subclass")
    }
}
