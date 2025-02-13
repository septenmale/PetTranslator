//
//  ResultViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 13/02/2025.
//

import UIKit

protocol ResultViewControllerDelegate: AnyObject {
    func didDismissResultViewController()
}

final class ResultViewController: UIViewController {
    
    weak var delegate: ResultViewControllerDelegate?
    
    private let translatedText: String
    private let selectedImage: UIImage
    
    init(translatedText: String, selectedImage: UIImage, delegate: ResultViewControllerDelegate?) {
        self.translatedText = translatedText
        self.selectedImage = selectedImage
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        resultLabel.text = translatedText
        petImageView.image = selectedImage
        
        setupConstraints()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Result"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setImage(UIImage(named: "closeButtonForResultVC"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.addTarget(self, action: #selector(closeDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "appPurpleColor")
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "text must be here"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "lineImage")
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let petImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dogImage")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc
    private func closeDidTap() {
        dismiss(animated: false) { [weak self] in
            self?.delegate?.didDismissResultViewController()
        }
    }
    
    private func setupConstraints() {
        
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(lineView)
        view.addSubview(resultContainerView)
        resultContainerView.addSubview(resultLabel)
        view.addSubview(petImageView)
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            
            closeButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 48),
            closeButton.heightAnchor.constraint(equalToConstant: 48),
            
            resultContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 91),
            resultContainerView.bottomAnchor.constraint(equalTo: petImageView.topAnchor, constant: -125),
            resultContainerView.widthAnchor.constraint(equalToConstant: 291),
            resultContainerView.heightAnchor.constraint(equalToConstant: 142),
            
            resultLabel.centerXAnchor.constraint(equalTo: resultContainerView.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: resultContainerView.centerYAnchor),
            
            lineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 259),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 242),
            lineView.bottomAnchor.constraint(equalTo: petImageView.topAnchor, constant: -19.38),
            
            petImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            petImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -134),
            
        ])
    }
    
}

//настроить кнопку возврата + заблокировать микрфоон пока идет запись.
