//
//  PersonalizingVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 30.01.2023.
//

import UIKit

class PersonalizingVC: UIViewController {

    // MARK: - UI
    private let backgroundImage = UIImageView()
    private let image = Resouces.Backgrounds.thirdBack
    private let firstLabel = UILabel()
    private let progressView = UIProgressView()
    private var timer = Timer()
    private let screenDescrip = UILabel()
    
    // MARK: - Lifececycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureAppearance()
        createdTimer()
    }
    
    // MARK: - Private functions
    private func setupViews() {
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.left.equalToSuperview()
        }
        
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
        }
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstLabel.snp.bottom).offset(64)
            $0.right.left.equalToSuperview().inset(15)
            $0.height.equalTo(5)
        }
        
        view.addSubview(screenDescrip)
        screenDescrip.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
            $0.top.equalTo(progressView.snp.bottom).offset(8)
        }
    }
    
    private func configureAppearance() {
        backgroundImage.image = image
        
        firstLabel.text = "Personalizing content"
        firstLabel.textColor = .white
        firstLabel.font = .systemFont(ofSize: 52, weight: .bold)
        firstLabel.numberOfLines = 0
        firstLabel.textAlignment = .center
        
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: false)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = UIColor(hexString: "#63B2FB")
        
        screenDescrip.text = "Please wait little bit..."
        screenDescrip.textColor = .white
        screenDescrip.font = .systemFont(ofSize: 19, weight: .light)
        screenDescrip.textAlignment = .center
    }
    
    private func createdTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.5 / 1
        } else if progressView.progress == 1.0 {
            let nextVC = PaywallVC()
            navigationController?.pushViewController(nextVC, animated: true)
            timer.invalidate()
        }
    }
}
