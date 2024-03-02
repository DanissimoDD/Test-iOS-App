//
//  NewProfileRegularSectionHeaderCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/1/24.
//

import Foundation
import UIKit


final class NewProfileRegularSectionHeader: UITableViewHeaderFooterView {
    static let reuseIdentifier = "RegularSectionHeaderCell"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor.black
        label.backgroundColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        
        contentView.addSubview(headerLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}

extension NewProfileRegularSectionHeader {

    func configurate(viewModel: NewProfileRegularSectionHeaderViewModel){
        headerLabel.text = viewModel.title
    }
}
