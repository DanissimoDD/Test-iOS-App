//
//  NewProfileFieldDataCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/1/24.
//

import Foundation
import UIKit

final class NewProfileFieldDataCell: UITableViewCell {
    
    static let reuseIdentifier = "FieldDataCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let fieldDataCellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        label.textAlignment = .left
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        return label
    }()
    
    private let fieldUserData: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        label.textAlignment = .left
        label.layer.cornerRadius = 5
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 8
        stackView.spacing = 12
        return stackView
    }()

    private func setupView(){
//        stackView.
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(fieldDataCellTitle)
        stackView.addArrangedSubview(fieldUserData)
    }
    
    private func setupConstraints(){
        fieldDataCellTitle.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        fieldUserData.setContentCompressionResistancePriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            // MARK: stackView
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
    }
}

extension NewProfileFieldDataCell {

    func configurate(viewModel: NewProfileFieldDataCellViewModel){
        fieldDataCellTitle.text = viewModel.title
        fieldUserData.text = viewModel.subtitle
    }
}
