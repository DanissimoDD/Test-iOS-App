//
//  NewProfileViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/27/24.
//

import UIKit

final class NewProfileViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // hier
        tableView.register(ProfileMainPictureCell.self, forCellReuseIdentifier: ProfileMainPictureCell.reuseIdentifier)
        return tableView
    } ()
    
    private var viewModel: ViewModelType!
    
    init(viewModel: ViewModelType) {
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
        tableView.dataSource = self // ругается если делать его в самом tableView
        tableView.delegate = self // ругается если делать его в самом tableView
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: TableView
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupBindings() {
        viewModel.didLoadUserData = { [weak self] userData in
            guard let self = self else { return }
            self.displayUserProfilePicture(userData)
        }
        viewModel.onError = { [weak self] errorString in
            print(errorString)
        }
    }
    
    
    private func displayUserProfilePicture(_ userData: UserData){
        guard let picture = userData.large, let url = URL(string: picture) else { return }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let image = try? Data(contentsOf: url) else { return }
            if let image = UIImage(data: image) {
                DispatchQueue.main.async {
                    //self?.userProfileImageView.image = image
                }
            }
        }
    }
    
//    @objc private func buttonTapped() {
//        DispatchQueue.main.async {
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
}

extension NewProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainPictureCell.reuseIdentifier, for: indexPath) as? ProfileMainPictureCell{
            // function cell.setData(imageURL: URL, name: String)
//            cell.setUserData()
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension NewProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}


