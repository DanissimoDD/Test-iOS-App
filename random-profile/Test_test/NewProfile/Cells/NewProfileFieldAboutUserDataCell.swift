//
//  NewProfileFieldAboutUserDataCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 3/2/24.
//

import Foundation
import UIKit

final class NewProfileFieldAboutUserDataCell: UITableViewCell {
    
    static let reuseIdentifier = "AboutUserDataCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let aboutUserCellTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var aboutUserTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        textView.textColor = UIColor.gray
        textView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        textView.textContainer.lineFragmentPadding = 0
        textView.isEditable = false
        textView.textAlignment = .left
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 255/255)
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 8
        stackView.spacing = 0
        return stackView
    }()
    
    private func setupView(){
        aboutUserCellTitle.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        aboutUserTextView.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(aboutUserCellTitle)
        stackView.addArrangedSubview(aboutUserTextView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            // MARK: stackView
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            aboutUserTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension NewProfileFieldAboutUserDataCell {

    func configurate(viewModel: NewProfileFieldAboutUserDataCellViewModel){
        aboutUserCellTitle.text = viewModel.title
        aboutUserTextView.text = viewModel.text
    }
}
