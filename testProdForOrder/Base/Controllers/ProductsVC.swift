//
//  ProductsVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 30.01.2023.
//

import UIKit

class ProductsVC: UIViewController {
    
    let identifier = "MyCell"
    var arrayCells = ["🙏 Learn self-care", "🧘 Start meditation", "😴 Sleep better and faster", "😶 Control emotions", "📝 Track your mood", "🎞 Watch self-care videos"]
    
    // MARK: - UI
    private let backgroundImage = UIImageView()
    private let image = Resouces.Backgrounds.secondBack
    private let screenDescrip = UILabel()
    private let productTableView = UITableView(frame: .zero, style: .grouped)
    private let nextScreenButton = NextScreenButton()
    
    // MARK: - Lifececycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureAppearance()
        createTableView()
        //productTableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    // MARK: - Private functions
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
            $0.bottom.equalTo(nextScreenButton.snp.top).inset(-44)
            $0.left.right.equalToSuperview().inset(34)
        }
    }
    
    private func configureAppearance() {
        
        backgroundImage.image = image
        
        screenDescrip.text = "How do you want to improve your life?"
        screenDescrip.textColor = .white
        screenDescrip.font = .systemFont(ofSize: 44, weight: .bold)
        screenDescrip.numberOfLines = 0
        screenDescrip.textAlignment = .center
        
        nextScreenButton.setTitle(Resouces.ButtonLabel.next)
        nextScreenButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }
    
    private func createTableView() {
        productTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.sectionHeaderHeight = 0
        productTableView.allowsMultipleSelection = true
        //productTableView.rowHeight = 60//UITableView.automaticDimension
        productTableView.backgroundColor = .clear
        productTableView.isScrollEnabled = false
    }
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
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
        return 60
    }
}
