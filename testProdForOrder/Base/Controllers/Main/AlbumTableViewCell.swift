//
//  AlbumTableViewCell.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 13.02.2023.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    //MARK: - Properties
    var cellsTitle = ["Meditate", "Sleep scape", "Feel calm"]
    var cellsImage = ["mind", "sleep", "leaf"]
    
    private let label: UILabel = {
        let v = UILabel()
        v.font = UIFont.Fonts.helvelticaRegular(with: 20)
        v.textColor = .white
        return v
    }()
    private let iconView: UIImageView = {
        let v = UIImageView()
        return v
    }()
    private let devider: UIView = {
        let v = UIView()
        v.backgroundColor = .white.withAlphaComponent(0.5)
        return v
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func setupConstraints() {
        addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(34)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(30)
        }
        
        addSubview(devider)
        devider.snp.makeConstraints {
            $0.width.equalTo(2)
            $0.top.bottom.equalToSuperview().inset(20)
            $0.left.equalTo(iconView.snp.right).offset(30)
        }
        
        addSubview(label)
        label.snp.makeConstraints {
            $0.left.equalTo(devider.snp.right).offset(35)
            $0.top.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setupCell() {
        textLabel?.textColor = .white
        textLabel?.highlightedTextColor = .black
        
        layer.cornerRadius = 16
        backgroundColor = .clear
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        let selected = UIView()
        selected.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
        selected.layer.cornerRadius = 16
        selectedBackgroundView = selected
    }
    
    func setCells(_ image: String, _ title: String) {
        iconView.image = UIImage(named: image)
        label.text = title
    }
}
