//
//  PauseViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/25/24.
//

import UIKit

class PauseViewController: UIViewController {

    private let pushButtonResume: UIButton = {
        let button = UIButton(type: .system)// 101 161
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 255/255)
        button.setTitle("Resume!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 15
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
        }()
    
    private var viewModel: PauseViewModelType!
    
    init(viewModel: PauseViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("Do not use")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 93/255, green: 117/255, blue: 186/255, alpha: 255/255)
        view.addSubview(pushButtonResume)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            pushButtonResume.heightAnchor.constraint(equalToConstant: 120),
            pushButtonResume.widthAnchor.constraint(equalToConstant: 120),
            pushButtonResume.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            pushButtonResume.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
}
