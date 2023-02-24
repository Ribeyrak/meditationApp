//
//  MainVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 01.02.2023.
//

import UIKit

class MainVC: UIViewController {
    
    var cellsTitle = ["Meditate", "Sleep scape", "Feel calm"]
    var cellsImage = ["mind", "sleep", "leaf"]
    
    var albums = Album.get()
    
    //MARK: - UI
    private let backgroundImage = UIImageView()
    private let image = Resouces.Backgrounds.firstBack
    private let hiLabel = UILabel()
    private let usernameLabel = UILabel()
    private let defaults = UserDefaults.standard
    private let discriptLabel = UILabel()
    
    private var tableView = UITableView(frame: .zero, style: .grouped)

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setupViews()
        configureAppearance()
        createTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Private functions
    private func setupViews() {
        view.addView(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        view.addSubview(hiLabel)
        hiLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(discriptLabel)
        discriptLabel.snp.makeConstraints {
            $0.top.equalTo(hiLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(discriptLabel.snp.bottom).offset(88)
            $0.left.right.equalToSuperview().inset(34)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func configureAppearance() {
        navigationController?.navigationBar.isHidden = true
        
        backgroundImage.image = image
        
        usernameLabel.text = defaults.string(forKey: "userName")
        
        hiLabel.text = "Hi, \(usernameLabel.text ?? "")!"
        hiLabel.textColor = .white
        hiLabel.font = .systemFont(ofSize: 40, weight: .bold)
        
        discriptLabel.text = "Take a deep breath"
        discriptLabel.textColor = .white
        discriptLabel.font = .systemFont(ofSize: 20, weight: .light)
    }
    
    private func createTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 132
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
    }
}

//MARK: - TableView Delegate & DataSource
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumTableViewCell
        
        cell.setImage(cellsImage[indexPath.section])
        cell.setTitle(cellsTitle[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlayerVC(album: albums[indexPath.section])
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
