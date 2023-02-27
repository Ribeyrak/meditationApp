//
//  NextScreenButton.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

final class NextScreenButton: UIButton {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension NextScreenButton {
    
    func addViews() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    func configure() {
        //label.font = Resouces.Fonts.helvelticaRegular(with: 20)
        label.font = UIFont.Fonts.helvelticaRegular(with: 20)
        label.textColor = .white
        titleLabel?.font = .systemFont(ofSize: 36)
        layer.cornerRadius = 16
        backgroundColor = UIColor(hexString: "#63B2FB")
        makeSystem(self)
    }
}
