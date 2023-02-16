//
//  ProfileCell.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 06.02.2023.
//

import Foundation
import UIKit

//protocol ReusableView: AnyObject {
//    static var identifier: String { get }
//}
//
//final class ProfileCell: UICollectionViewCell {
//
//    private enum Constants {
//        // MARK: contentView layout constants
//        static let contentViewCornerRadius: CGFloat = 4.0
//
//        // MARK: profileImageView layout constants
//        static let imageHeight: CGFloat = 180.0
//
//        // MARK: Generic layout constants
//        static let verticalSpacing: CGFloat = 8.0
//        static let horizontalPadding: CGFloat = 16.0
//        static let profileDescriptionVerticalPadding: CGFloat = 8.0
//    }
//
//    let name: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.textAlignment = .center
//        return label
//    }()
//
//    let locationLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.textAlignment = .center
//        return label
//    }()
//
//    let professionLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.textAlignment = .center
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        setupViews()
//        setupLayouts()
//    }
//
//    private func setupViews() {
//        contentView.clipsToBounds = true
//        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
//        contentView.backgroundColor = .white
//
//        contentView.addSubview(name)
//        contentView.addSubview(locationLabel)
//        contentView.addSubview(professionLabel)
//    }
//
//    private func setupLayouts() {
//            name.translatesAutoresizingMaskIntoConstraints = false
//            locationLabel.translatesAutoresizingMaskIntoConstraints = false
//            professionLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            // Layout constraints for `usernameLabel`
//            NSLayoutConstraint.activate([
//                name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
//                name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
//                name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.profileDescriptionVerticalPadding)
//            ])
//
//            // Layout constraints for `descriptionLabel`
//            NSLayoutConstraint.activate([
//                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
//                locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
//                locationLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4.0)
//            ])
//
//            // Layout constraints for `matchLabel`
//            NSLayoutConstraint.activate([
//                professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
//                professionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
//                professionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8.0),
//                professionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.profileDescriptionVerticalPadding)
//            ])
//        }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setup(with profile: Subscriptions) {
//        name.text = profile.name
//        locationLabel.text = profile.location
//        professionLabel.text = profile.profession
//    }
//
//}
//
//extension ProfileCell: ReusableView {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
