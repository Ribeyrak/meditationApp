//
//  RegisterVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 30.01.2023.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: - Constants
    private enum Constants {
        static let firstLabelText = "Register"
        static let discriptionLabel = "Start improving your life today"
        static let nextScreenButton = "Continue"
        static let nameFieldPlaceholder = "Name"
        static let emailFieldPlaceholder = "example@mail.com"
        static let phoneFieldPlaceholder = "+1(123)000 0000"
        static let nameAlertTitle = "Warning"
        static let nameAlertMessage = "All fields must be filled"
        static let emailAlertTitle = "Incorrect email"
        static let emailAlertMessage = "Enter valid email"
        static let phoneAlertTitle = "Incorrect phone"
        static let phoneAlertMessage = "Must contain 6-12 numbers"
        
        enum DefaultsKeysText {
            static let nameField = "userName"
            static let emailField = "userEmail"
            static let phoneField = "userPhone"
        }
    }
    
    //MARK: - UI
    private let backgroundImage = UIImageView()
    private let firstLabel = UILabel()
    private let screenDescrip = UILabel()
    private let nameFiled = RegisterField()
    private let defaults = UserDefaults.standard
    private let emailField = RegisterField()
    private let phoneField = RegisterField()
    private let nextScreenButton = NextScreenButton()
    
    //MARK: - Lifececycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureAppearance()
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { nc in
//            self.nextScreenButton.frame.origin.y = 430
//        }
//        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { nc in
//            self.nextScreenButton.frame.origin.y = 740
//        }
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
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(screenDescrip)
        screenDescrip.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(nameFiled)
        nameFiled.snp.makeConstraints {
            $0.top.equalTo(screenDescrip.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(52)
        }
        
        view.addSubview(emailField)
        emailField.snp.makeConstraints {
            $0.top.equalTo(nameFiled.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(52)
        }
        
        view.addSubview(phoneField)
        phoneField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(52)
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
        
        backgroundImage.image = UIImage.Backgrounds.firstBack
        
        firstLabel.text = Constants.firstLabelText
        firstLabel.textColor = .white
        firstLabel.font = .systemFont(ofSize: 52, weight: .bold)
        
        screenDescrip.text = Constants.discriptionLabel
        screenDescrip.textColor = .white
        screenDescrip.font = .systemFont(ofSize: 19, weight: .light)
        
        nextScreenButton.setTitle(Constants.nextScreenButton)
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        
        nameFiled.setPlaceholder(Constants.nameFieldPlaceholder)
        nameFiled.text = defaults.string(forKey: Constants.DefaultsKeysText.nameField)
        
        emailField.setPlaceholder(Constants.emailFieldPlaceholder)
        emailField.text = defaults.string(forKey: Constants.DefaultsKeysText.emailField)
        
        phoneField.setPlaceholder(Constants.phoneFieldPlaceholder)
        phoneField.text = defaults.string(forKey: Constants.DefaultsKeysText.phoneField)
    }
    
    //MARK: - TextFields Validation
    @objc func nextVC() {
        let nextVC = ProductsVC()
        
        if let name = nameFiled.text, let email = emailField.text, let phone = phoneField.text {
            if name.isEmpty || email.isEmpty || phone.isEmpty {
                Validator().simpleAlert(vc: self, title: Constants.nameAlertTitle, message: Constants.nameAlertMessage)
            } else {
                if !email.isValidEmail(email: email) {
                    Validator().simpleAlert(vc: self, title: Constants.emailAlertTitle, message: Constants.emailAlertMessage)
                } else if !phone.isValidPhone(phone: phone) {
                    Validator().simpleAlert(vc: self, title: Constants.phoneAlertTitle, message: Constants.phoneAlertMessage)
                } else {
                    navigationController?.pushViewController(nextVC, animated: true)
                }
            }
            defaults.set(name, forKey: Constants.DefaultsKeysText.nameField)
            defaults.set(email, forKey: Constants.DefaultsKeysText.emailField)
            defaults.set(phone, forKey: Constants.DefaultsKeysText.phoneField)
        }
    }
}

