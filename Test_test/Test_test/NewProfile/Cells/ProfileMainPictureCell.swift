//
//  MainCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import Foundation
import UIKit


final class ProfileMainPictureCell: UITableViewCell {
    
    static let reuseIdentifier = "MainCell"
    
    private let userProfileImageView: UIImageView = {
        let pImageView = UIImageView()
        pImageView.translatesAutoresizingMaskIntoConstraints = false
        pImageView.contentMode = .scaleAspectFill
        pImageView.layer.cornerRadius = 5
        pImageView.clipsToBounds = true
        return pImageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let emailAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        contentView.addSubview(userProfileImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(emailAddressLabel)
    }
    
    private func setupConstraints(){
        userNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        phoneNumberLabel.setContentCompressionResistancePriority(.required - 1, for: .vertical)
        emailAddressLabel.setContentCompressionResistancePriority(.required - 2, for: .vertical)
        stackView.setCustomSpacing(8, after: userNameLabel)
        NSLayoutConstraint.activate([
            // MARK: UserImage
            userProfileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 150),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 150),
            // MARK: StackView
            stackView.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func loadImageData(url: URL) {
        guard let data = try? Data(contentsOf: url) else { return }
        if let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.userProfileImageView.image = image
            }
        }
        // переделать почитать!
        // Data(contentsOf: url) тут идет запрос
        // оторисовка в мейн очереди
        // запрос вызываем не в мейн очереди в глобальдной
//        guard let picture = userData.large, let url = URL(string: picture) else { return }
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            guard let image = try? Data(contentsOf: url) else { return }
//            if let image = UIImage(data: image) {
//                DispatchQueue.main.async {
//                    self?.userProfileImageView.image = image
//                }
//            }
//        }
    }
}

extension ProfileMainPictureCell {

    func configurate(viewModel: NewProfileTopCellViewModel){
        if let url = viewModel.profileImageURL {
            loadImageData(url: url)
        }
        userProfileImageView.backgroundColor = .black
        userNameLabel.text = viewModel.name
        phoneNumberLabel.text = viewModel.phoneNumber
        emailAddressLabel.text = viewModel.emailAddress
        
    }
}
