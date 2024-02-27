//
//  NewProfileViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import UIKit

class NewProfileViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    } ()
    private var viewModel: NewProfileViewModelType!
    
    init(viewModel: NewProfileViewModelType) {
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
        view.backgroundColor = .white
        tableView.dataSource = self
        let nib = UINib(nibName: "MainCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MainCell")
        view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: TabelView
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
//    @objc private func buttonTapped() {
//        DispatchQueue.main.async {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
}

extension NewProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        return cell
    }
}

