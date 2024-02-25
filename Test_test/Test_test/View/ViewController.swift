//
//  ViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/21/24.
//

import UIKit

final class ViewController: UIViewController {
    
//    private let profileTextColor = UIColor.darkgray
//    private let profileFontSize = UIFont.systemFont(ofSize: 24, weight: .bold)
    
    private let userProfileImageView: UIImageView = {
        let pImageView = UIImageView()
        pImageView.image = UIImage(named: "testPicture")
        pImageView.translatesAutoresizingMaskIntoConstraints = false
        pImageView.contentMode = .scaleAspectFill
        pImageView.clipsToBounds = true
        
        return pImageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.text = "First, Second Name"
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.text = "Gender"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.text = "Age:"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.text = "Location"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.text = "Email"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let pushButtonNext: UIButton = {
        let button = UIButton(type: .system)// 101 161
        button.backgroundColor = UIColor(red: 80/255, green: 171/255, blue: 101/255, alpha: 255/255)
        button.setTitle("Generate next!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 15
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
        }()
    
    private let pushButtonPause: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 220/255, green: 101/255, blue: 161/255, alpha: 255/255)
        button.setTitle("Stop", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        return button
        }()
    
    
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
        setupBindings()
        viewModel.didLoad()
    }

    private func setupView() {
        view.backgroundColor = .systemGray
        view.addSubview(userProfileImageView)
        view.addSubview(userNameLabel)
        view.addSubview(userGenderLabel)
        view.addSubview(userAgeLabel)
        view.addSubview(userLocationLabel)
        view.addSubview(userEmailLabel)
        view.addSubview(pushButtonNext)
        view.addSubview(pushButtonPause)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            userProfileImageView.widthAnchor.constraint(equalToConstant: 450),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 900),
            
            userProfileImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            userProfileImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            userProfileImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.bottomAnchor.constraint(equalTo: userLocationLabel.topAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: userProfileImageView.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userGenderLabel.bottomAnchor.constraint(equalTo: userAgeLabel.bottomAnchor),
            userGenderLabel.leftAnchor.constraint(equalTo: userAgeLabel.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userAgeLabel.bottomAnchor.constraint(equalTo: userNameLabel.topAnchor),
            userAgeLabel.leftAnchor.constraint(equalTo: userProfileImageView.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userLocationLabel.bottomAnchor.constraint(equalTo: userEmailLabel.topAnchor),
            userLocationLabel.leftAnchor.constraint(equalTo: userProfileImageView.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userEmailLabel.bottomAnchor.constraint(equalTo: pushButtonPause.topAnchor),
            userEmailLabel.leftAnchor.constraint(equalTo: userProfileImageView.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            pushButtonNext.heightAnchor.constraint(equalToConstant: 80),
            pushButtonNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pushButtonNext.leftAnchor.constraint(equalTo: self.view.centerXAnchor),
            pushButtonNext.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            pushButtonPause.topAnchor.constraint(equalTo: pushButtonNext.topAnchor),
            pushButtonPause.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pushButtonPause.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            pushButtonPause.rightAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
    }
    
    private func setupBindings() {
        viewModel.didLoadUserData = { [weak self] userData in
//            view.addSubview(userProfileImageView)
            self!.userNameLabel.text = userData.first! + " " + userData.last!
            self!.userGenderLabel.text = userData.gender!
            let transferToString = userData.age
            if let string = transferToString {
                self!.userAgeLabel.text = "Age: " + String(string) + ", "
            }
            self!.userLocationLabel.text = userData.country! + ", " + userData.city!
            self!.userEmailLabel.text = userData.email!
            guard let picture = userData.large, let url = URL(string: picture) else { return }
            guard let image = try? Data(contentsOf: url) else { return }
            if let image = UIImage(data: image) {
                self!.userProfileImageView.image = image
            }
            print(userData.large!)
        }
        viewModel.onError = { [weak self] errorString in
            print(errorString)
        }
    }
    
    @objc func buttonTapped() {
        viewModel.didLoad()
    }
    
    
    @objc func pauseTapped() {
        setPause()
    }
    
    func setPause(){
        let pauseViewModel = PauseViewModel()
        let pauseViewController = PauseViewController(viewModel: pauseViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(pauseViewController, animated: true)

//            self.navigationController?.present(pauseViewController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(pauseViewController, animated: true)
        }
    }
    
    
    
    
    
}
