//
//  MainCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import Foundation
import UIKit
import SDWebImage


final class ProfileMainPictureCell: UITableViewCell {
    
    static let reuseIdentifier = "MainCell"
    
    private let userProfileImageView: UIImageView = {
        let pImageView = UIImageView()
        pImageView.image = UIImage()
        pImageView.translatesAutoresizingMaskIntoConstraints = false
        pImageView.contentMode = .scaleAspectFill
        pImageView.layer.cornerRadius = 5
        pImageView.clipsToBounds = true
        return pImageView
    }()
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 232/255, alpha: 255/255)
        label.text = "Review"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(testLabel)
        contentView.addSubview(userProfileImageView)
        
        
        NSLayoutConstraint.activate([
            // MARK: TabelView
            testLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            testLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            // MARK: Image
            userProfileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            userProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        ])
        
    }
    
    func setUserData(viewModel: ProfileMainPictureCellViewModel){
        testLabel.text = viewModel.phoneNumber
        userProfileImageView.sd_setImage(with: viewModel.pictureURL)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
