//
//  CustomCollectionViewCell.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 07.02.2023.
//

import UIKit
import Foundation
import SnapKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI
    private let typeLabel = UILabel()
    private let priceLable = UILabel()
    private let perMonthLabel = UILabel()
    private let specLabel = UILabel()
    
    private let checkLabel = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSubviews()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // selected cell
    override var isSelected: Bool {
        didSet {
            if isSelected {
                typeLabel.textColor = .black
                priceLable.textColor = .black
                perMonthLabel.textColor = .black
                specLabel.textColor = .black
                contentView.backgroundColor = .white
                
                checkLabel.image = .checkmark
                checkLabel.isHidden = false
            } else {
                typeLabel.textColor = .white
                priceLable.textColor = .white
                perMonthLabel.textColor = .white
                specLabel.textColor = .white
                contentView.backgroundColor = .clear
                
                checkLabel.isHidden = true
            }
        }
    }
    
    //MARK: - Func
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(specLabel)
        specLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(27)
        }
        
        contentView.addSubview(priceLable)
        priceLable.snp.makeConstraints {
            $0.top.equalToSuperview().inset(46)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(perMonthLabel)
        perMonthLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(31)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(checkLabel)
        checkLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.left.equalToSuperview().inset(12)
        }
    }
    
    func configure() {
        typeLabel.textAlignment = .center
        typeLabel.font = .systemFont(ofSize: 20, weight: .light)
        typeLabel.textColor = .white
        
        priceLable.textAlignment = .center
        priceLable.font = .systemFont(ofSize: 40, weight: .bold)
        priceLable.textColor = .white
        
        perMonthLabel.textAlignment = .center
        perMonthLabel.font = .systemFont(ofSize: 16, weight: .light)
        perMonthLabel.textColor = .white
        
        specLabel.textAlignment = .center
        specLabel.textColor = .white
        specLabel.font = .systemFont(ofSize: 14, weight: .light)
        specLabel.backgroundColor = .systemPink
        specLabel.layer.masksToBounds = true
        specLabel.layer.cornerRadius = 6
        specLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
//        checkLabel.layer.masksToBounds = true
//        checkLabel.layer.cornerRadius = 10
//        checkLabel.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
//        checkLabel.layer.borderWidth = 1
        //checkLabel.image = .checkmark
    }
    
    func setup(with subs: Subscriptions) {
        typeLabel.text = subs.typeLabel
        priceLable.text = subs.priceLable
        perMonthLabel.text = subs.perMonthLabel
        specLabel.text = subs.specLabel
        
        layer.cornerRadius = 14
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1
    }

}

//MARK: - extensions
extension CustomCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
