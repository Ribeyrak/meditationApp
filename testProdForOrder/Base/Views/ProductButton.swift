//
//  ProductButton.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 09.02.2023.
//

import UIKit

final class ProductButton: UIButton {
    
    private let label = UILabel()
    private let iconView = UIImageView()
    private let ima = UIImage()
    private let devider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
    func setImages(_ image: UIImage) {
        iconView.image = image
    }
}

private extension ProductButton {
    
    func addViews() {
        addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(34)
            $0.top.bottom.equalToSuperview().inset(20)
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

    func configure() {
        label.font = Resouces.Fonts.helvelticaRegular(with: 20)
        label.textColor = .white
        titleLabel?.font = .systemFont(ofSize: 36)
        layer.cornerRadius = 16
        layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1
        backgroundColor = .clear.withAlphaComponent(0.1)
        
        devider.backgroundColor = .white.withAlphaComponent(0.5)
        
        makeSystem(self)
    }
}
