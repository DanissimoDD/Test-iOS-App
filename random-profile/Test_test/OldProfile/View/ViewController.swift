//
//  ViewController.swift
//  Test_test
//
//  Created by Thanos Cynric on 2/21/24.
//

import UIKit

final class ViewController: UIViewController {
    
    private let userProfileImageView: UIImageView = {
        let pImageView = UIImageView()
        pImageView.image = UIImage()
        pImageView.translatesAutoresizingMaskIntoConstraints = false
        pImageView.contentMode = .scaleAspectFill
        pImageView.layer.cornerRadius = 5
        pImageView.clipsToBounds = true
        return pImageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let userGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let userAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let userLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var pushButtonNext: UIButton = {
        let button = UIButton(type: .system)// 101 161
        button.backgroundColor = UIColor(red: 80/255, green: 171/255, blue: 101/255, alpha: 255/255)
        button.setTitle("Generate next!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
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
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 209/255, alpha: 255/255)
        label.text = "И практикующие журналисты, и исследователи отмечают, что для привлечения внимания читателей в эпоху информационного изобилия и характерного для Интернета клипового восприятия лонгрид должен содержать уникальную и более яркую, более качественную информацию, чем обычно предлагается в СМИ. В англоязычной литературе это названо in-depth reporting7, что подразумевает значительное время и усилия журналиста, потраченные на исследование темы и − как результат − на ее новое понимание, недоступное при поверхностном ознакомлении с темой. Погружение же в тему позволяет затем передать это новое знание и новое понимание в тексте, что станет для читателя вознаграждением за время, потраченное на чтение лонгрида. Именно глубину погружения в тему, качество собранной информации следует считать главной жанровой характеристикой лонгрида. Журналист должен достичь экспертного понимания темы, что позволит ему заметить многие детали и сделать обоснованные выводы. Глубина погружения проявляется и в количестве источников информации, использованных при подготовке материала, и в количестве примеров, подтверждающих заявленный тренд, и в информативности текста, когда большой объем сочетается с высокой плотностью смысла. Но, с точки зрения автора данного исследования, мультимедийная составляющая жанровой характеристикой лонгрида не является, так как с использованием мультимедийных средств можно подавать тексты любого жанра. Тем более, что облегчение восприятия текстовой информации с помощью иллюстративности в прессе и мультимедийности в Интернете – тренд последних 10−20 лет. При этом, если в содержательном плане материал ничем не выделяется, ожидать повышенного интереса к нему только благодаря использованию мультимедиа стоит едва ли. Даже при качественном и оригинальном мультимедийном сопровождении материала интерес может возникнуть именно к этому сопровождению, а не к тексту, и, в лучшем случае, будет «длительный просмотр», а  не «длительное прочтение»."
        label.numberOfLines = 0
        return label
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
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 232/255, alpha: 255/255)
        view.addSubview(userProfileImageView)
        view.addSubview(stackView)
        view.addSubview(pushButtonNext)
        view.addSubview(pushButtonPause)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userGenderLabel)
        stackView.addArrangedSubview(userLocationLabel)
        stackView.addArrangedSubview(userEmailLabel)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            userProfileImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            userProfileImageView.topAnchor.constraint(equalTo: guide.topAnchor),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 200),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 200),
        
            // MARK: StackView Constraints
            
            stackView.topAnchor.constraint(equalTo: guide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // MARK: ButtonNext Constraints
            
            pushButtonNext.heightAnchor.constraint(equalToConstant: 80),
            pushButtonNext.leadingAnchor.constraint(equalTo: self.view.centerXAnchor),
            pushButtonNext.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            guide.bottomAnchor.constraint(equalTo: pushButtonNext.bottomAnchor),
            
            // MARK: ButtonPause Constraints
            
            pushButtonPause.topAnchor.constraint(equalTo: pushButtonNext.topAnchor),
            pushButtonPause.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            pushButtonPause.trailingAnchor.constraint(equalTo: self.view.centerXAnchor),
            guide.bottomAnchor.constraint(equalTo: pushButtonPause.bottomAnchor),
            
            // MARK: TitleLable Constraints
            
            titleLabel.topAnchor.constraint(equalTo: userProfileImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            // MARK: ScrollView Constraints
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            scrollView.bottomAnchor.constraint(equalTo: pushButtonNext.topAnchor, constant: -8),
            scrollView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
        ])
        
    }
    
    private func setupBindings() {
        viewModel.didLoadUserData = { [weak self] userData in
            guard let self = self else { return }
            self.fillProfileUserData(userData)
            self.displayUserProfilePicture(userData)
        }
        viewModel.onError = { [weak self] errorString in
            print(errorString)
        }
    }
    
    private func fillProfileUserData(_ userData: UserData){
        if let firstName = userData.first, let lastName = userData.last {
            self.userNameLabel.text = firstName + " " + lastName
            self.userNameLabel.isHidden = false
        } else {
            self.userNameLabel.isHidden = true
        }
        if let string = userData.age, let gender = userData.gender {
            self.userAgeLabel.text = "Age: " + String(string) + ", " + gender
            self.userAgeLabel.isHidden = false
        } else {
            self.userAgeLabel.isHidden = true
        }
        if let country = userData.country, let city = userData.city{
            self.userLocationLabel.text = country + ", " + city
            self.userLocationLabel.isHidden = false
        } else {
            self.userLocationLabel.isHidden = true
        }
        self.userEmailLabel.isHidden = userData.email == nil
        self.userEmailLabel.text = userData.email
    }
    
    private func displayUserProfilePicture(_ userData: UserData){
        guard let picture = userData.large, let url = URL(string: picture) else { return }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let image = try? Data(contentsOf: url) else { return }
            if let image = UIImage(data: image) {
                DispatchQueue.main.async {
                    self?.userProfileImageView.image = image
                }
            }
        }
    }
    
    // MARK: @objc
    
    @objc private func buttonTapped() {
        viewModel.didLoad()
    }
        
//    @objc private func pauseTapped() {
//        setPause()
//    }
    
}
