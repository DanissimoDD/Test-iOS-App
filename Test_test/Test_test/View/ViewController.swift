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
        pImageView.layer.cornerRadius = 5
        pImageView.clipsToBounds = true
        
        return pImageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.text = "First, Second Name"
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.text = "Gender"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.text = "Age:"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.text = "Location"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
        }()
    
    private let userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        label.text = "Email"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true;
        scrollView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 209/255, alpha: 255/255)
        return scrollView
    }()
    
    private let scrollContainer: UIView = {
        let scContainer = UIView()
        scContainer.translatesAutoresizingMaskIntoConstraints = false
        scContainer.backgroundColor = .white
        return scContainer
    }()
    // зачем тут скобки и почему мы так делаем
    
    private let titleLabel: UILabel = {
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
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 209/255, alpha: 255/255)
        label.text = "И практикующие журналисты, и исследователи отмечают, что для привлечения внимания читателей в эпоху информационного изобилия и характерного для Интернета клипового восприятия лонгрид должен содержать уникальную и более яркую, более качественную информацию, чем обычно предлагается в СМИ. В англоязычной литературе это названо in-depth reporting7, что подразумевает значительное время и усилия журналиста, потраченные на исследование темы и − как результат − на ее новое понимание, недоступное при поверхностном ознакомлении с темой. Погружение же в тему позволяет затем передать это новое знание и новое понимание в тексте, что станет для читателя вознаграждением за время, потраченное на чтение лонгрида. Именно глубину погружения в тему, качество собранной информации следует считать главной жанровой характеристикой лонгрида. Журналист должен достичь экспертного понимания темы, что позволит ему заметить многие детали и сделать обоснованные выводы. Глубина погружения проявляется и в количестве источников информации, использованных при подготовке материала, и в количестве примеров, подтверждающих заявленный тренд, и в информативности текста, когда большой объем сочетается с высокой плотностью смысла. Но, с точки зрения автора данного исследования, мультимедийная составляющая жанровой характеристикой лонгрида не является, так как с использованием мультимедийных средств можно подавать тексты любого жанра. Тем более, что облегчение восприятия текстовой информации с помощью иллюстративности в прессе и мультимедийности в Интернете – тренд последних 10−20 лет. При этом, если в содержательном плане материал ничем не выделяется, ожидать повышенного интереса к нему только благодаря использованию мультимедиа стоит едва ли. Даже при качественном и оригинальном мультимедийном сопровождении материала интерес может возникнуть именно к этому сопровождению, а не к тексту, и, в лучшем случае, будет «длительный просмотр», а  не «длительное прочтение»."
        label.numberOfLines = 0
        return label
        }()
    
    private let scrollContentGuide: UILayoutGuide
    private let scrollFrameGuide: UILayoutGuide
    private var viewModel: ViewModelType!
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        self.scrollContentGuide = scrollView.contentLayoutGuide
        self.scrollFrameGuide = scrollView.frameLayoutGuide
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
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 232/255, alpha: 255/255)
        view.addSubview(userProfileImageView)
        view.addSubview(userNameLabel)
        view.addSubview(userGenderLabel)
        view.addSubview(userAgeLabel)
        view.addSubview(userLocationLabel)
        view.addSubview(userEmailLabel)
        view.addSubview(pushButtonNext)
        view.addSubview(pushButtonPause)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        
        let margins = view.layoutMarginsGuide
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            userProfileImageView.leftAnchor.constraint(equalTo: margins.leftAnchor),
//            userProfileImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24),
            userProfileImageView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userAgeLabel.bottomAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: userAgeLabel.leftAnchor),
            userNameLabel.rightAnchor.constraint(equalTo: margins.rightAnchor),
        ])
                
        NSLayoutConstraint.activate([
            userAgeLabel.topAnchor.constraint(equalTo: userProfileImageView.topAnchor),
            userAgeLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            userGenderLabel.topAnchor.constraint(equalTo: userAgeLabel.topAnchor),
            userGenderLabel.bottomAnchor.constraint(equalTo: userAgeLabel.bottomAnchor),
            userGenderLabel.leftAnchor.constraint(equalTo: userAgeLabel.rightAnchor),
//            userGenderLabel.rightAnchor.constraint(equalTo: margins.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userLocationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            userLocationLabel.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor),
            userLocationLabel.rightAnchor.constraint(equalTo: margins.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            userEmailLabel.topAnchor.constraint(equalTo: userLocationLabel.bottomAnchor),
            userEmailLabel.leftAnchor.constraint(equalTo: userLocationLabel.leftAnchor),
            userEmailLabel.rightAnchor.constraint(equalTo: margins.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            pushButtonNext.heightAnchor.constraint(equalToConstant: 80),
//            pushButtonNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pushButtonNext.leftAnchor.constraint(equalTo: self.view.centerXAnchor),
            pushButtonNext.rightAnchor.constraint(equalTo: margins.rightAnchor),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: pushButtonNext.bottomAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            pushButtonPause.topAnchor.constraint(equalTo: pushButtonNext.topAnchor),
//            pushButtonPause.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            pushButtonPause.leftAnchor.constraint(equalTo: margins.leftAnchor),
            pushButtonPause.rightAnchor.constraint(equalTo: self.view.centerXAnchor),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: pushButtonPause.bottomAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            scrollView.bottomAnchor.constraint(equalTo: pushButtonNext.topAnchor, constant: -8),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
        ])
        

        
        NSLayoutConstraint.activate([
//            scrollContainer.topAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
//            scrollContainer.bottomAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
//            scrollContainer.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
//            scrollContainer.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),

//            scrollContainer.leadingAnchor.constraint(equalTo: scrollFrameGuide.leadingAnchor),
//            scrollContainer.trailingAnchor.constraint(equalTo: scrollFrameGuide.trailingAnchor),
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//
            descriptionLabel.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            
            

            
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
        }
    }
    
    
    
    
    
}
