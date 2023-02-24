//
//  PaywallVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 01.02.2023.
//

import UIKit

class PaywallVC: UIViewController {
    
    var subscriptions: [Subscriptions] = []
    
    //MARK: - UI
    private let backgroundImage = UIImageView()
    private let firstLabel = UILabel()
    private let oneDiscipLabel = UILabel()
    private let twoDiscipLabel = UILabel()
    private let threeDiscipLabel = UILabel()
    private let fourDiscipLabel = UILabel()
    private let trialLabel = UILabel()
    
    private var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let nextScreenButton = NextScreenButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureAppearance()
        availableSubscriptions()
        collectionView.reloadData()
        
        
    }
    
    //MARK: - Private functions
    private func setupViews() {
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.right.left.equalToSuperview()
        }
        view.addSubview(nextScreenButton)
        nextScreenButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(34)
            $0.height.equalTo(75)
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(nextScreenButton.snp.top).inset(11)
            $0.height.equalTo(200)
        }
        view.addSubview(trialLabel)
        trialLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(23)
            $0.bottom.equalTo(collectionView.snp.top).inset(12)
        }
        view.addSubview(fourDiscipLabel)
        fourDiscipLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(23)
            $0.bottom.equalTo(trialLabel.snp.top).inset(-12)
        }
        view.addSubview(threeDiscipLabel)
        threeDiscipLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(23)
            $0.bottom.equalTo(fourDiscipLabel.snp.top).inset(-12)
        }
        view.addSubview(twoDiscipLabel)
        twoDiscipLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(23)
            $0.bottom.equalTo(threeDiscipLabel.snp.top).inset(-12)
        }
        view.addSubview(oneDiscipLabel)
        oneDiscipLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(23)
            $0.bottom.equalTo(twoDiscipLabel.snp.top).inset(-12)
        }
        view.addSubview(firstLabel)
        firstLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(23)
            //$0.top.equalToSuperview().offset(240)
            $0.bottom.equalTo(oneDiscipLabel.snp.top).inset(-25)
        }
    }
    
    private func configureAppearance() {
        
        backgroundImage.image = Resouces.Backgrounds.secondBack
        
        firstLabel.text = "Try Investee Premium for Free"
        firstLabel.textColor = .white
        firstLabel.numberOfLines = 0
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 44, weight: .bold)
        
        oneDiscipLabel.text = "✓ Feel x3.4 times less stressed"
        oneDiscipLabel.textColor = .white
        oneDiscipLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        twoDiscipLabel.text = "✓ Fall asleep in minutes"
        twoDiscipLabel.textColor = .white
        twoDiscipLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        threeDiscipLabel.text = "✓ Unlimited access to AI-assistant"
        threeDiscipLabel.textColor = .white
        threeDiscipLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        fourDiscipLabel.text = "✓ Get access to over 20 meditations and soundscapes"
        fourDiscipLabel.textColor = .white
        fourDiscipLabel.font = .systemFont(ofSize: 18, weight: .light)
        fourDiscipLabel.numberOfLines = 0
        
        trialLabel.text = "After 7 days trial:"
        trialLabel.textColor = .white
        trialLabel.textAlignment = .center
        trialLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        nextScreenButton.setTitle("Try for free and subscribe")
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(nextVC))
    }
    
    private func availableSubscriptions() {
        subscriptions = [
            Subscriptions(typeLabel: "Annual", priceLable: "$39.99", perMonthLabel: "$3.33 per month", specLabel: "Best Value"),
            Subscriptions(typeLabel: "Monthly", priceLable: "$4.99", perMonthLabel: "per month", specLabel: nil)
        ]
    }
    
    //MARK: - Actions
    @objc func nextVC() {
        let nextVC = MainVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

//MARK: - CollectionView DataSource
extension PaywallVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subscriptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier,
                                                      for: indexPath) as! CustomCollectionViewCell
        
        if (indexPath.row == 0) {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
        
        let subscription = subscriptions[indexPath.row]
        cell.setup(with: subscription)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        cell.layer.borderColor = UIColor.clear.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK: - CollectionView Delegate
extension PaywallVC: UICollectionViewDelegate {}

//MARK: - CollectionViewDelegateFlowLayout Delegate
extension PaywallVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth / 2) * 0.85 // 2 ячейки в строке, 0.85 - отступы
        let cellHeight: CGFloat = 150
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
    }
}
