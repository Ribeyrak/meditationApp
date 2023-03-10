//
//  ProductsVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 30.01.2023.
//

import UIKit

class ProductsVC: UIViewController {
    //MARK: - Constants
    private enum Constants {
        static let identifier = "MyCell"
        static let nextScreenButton = "Continue"
        static let discriprionText = "How do you want to improve your life?"
    }
    var arrayCells = ["🙏 Learn self-care", "🧘 Start meditation", "😴 Sleep better and faster", "😶 Control emotions", "📝 Track your mood", "🎞 Watch self-care videos"]
    
    //MARK: - UI
    private let backgroundImage = UIImageView()
    private let screenDescrip = UILabel()
    private let productTableView = UITableView(frame: .zero, style: .grouped)
    private let nextScreenButton = NextScreenButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureAppearance()
        createTableView()
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Private functions
    private func setupViews() {
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        view.addSubview(screenDescrip)
        screenDescrip.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
        }
        
        view.addSubview(nextScreenButton)
        nextScreenButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(75)
        }
        
        productTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(productTableView)
        productTableView.snp.makeConstraints {
            $0.top.equalTo(screenDescrip.snp.bottom).offset(15)
            $0.bottom.equalTo(nextScreenButton.snp.top).offset(-15)
            $0.left.right.equalToSuperview().inset(34)
        }
    }
    
    private func configureAppearance() {
        
        backgroundImage.image = UIImage.Backgrounds.secondBack
        
        screenDescrip.text = Constants.discriprionText
        screenDescrip.textColor = .white
        screenDescrip.font = .systemFont(ofSize: 44, weight: .bold)
        screenDescrip.numberOfLines = 0
        screenDescrip.textAlignment = .center
        
        nextScreenButton.setTitle(Constants.nextScreenButton)
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }
    
    private func createTableView() {
        productTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.identifier)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.sectionHeaderHeight = 0
        productTableView.allowsMultipleSelection = true
//        productTableView.rowHeight = UITableView.automaticDimension
//        productTableView.estimatedRowHeight = 60
        productTableView.backgroundColor = .clear
        productTableView.isScrollEnabled = false
    }
    
    //MARK: - Actions
    @objc func nextVC() {
        let nextVC = PersonalizingVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

 //MARK: - TableView DataSoure
extension ProductsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath)
        cell.textLabel?.text = arrayCells[indexPath.section]
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.highlightedTextColor = .black
        
        cell.layer.cornerRadius = 14
        cell.backgroundColor = .clear
        
        let selected = UIView()
        selected.backgroundColor = UIColor.white
        selected.layer.cornerRadius = 14
        cell.selectedBackgroundView = selected
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = true
        
        return cell
    }
}

 //MARK: - TableView Delegate
extension ProductsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = (tableView.frame.height / CGFloat(arrayCells.count))*0.75
        return rowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
