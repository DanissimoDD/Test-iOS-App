//
//  MainCell.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import Foundation
import UIKit


final class MainCell: UITableViewCell {
    
    private let testLebel: UILabel = {
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
    
    
}
