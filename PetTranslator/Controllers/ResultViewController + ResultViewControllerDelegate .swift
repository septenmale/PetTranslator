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
        view.applyGradient()
        
        configureView()
        setUpViews()
        setupRepeatContainerView()
        setupResultContainerView()
        setupConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.showRepeatButton()
        }
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
    
    private let repeatContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "appPurpleColor")
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repeatImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "repeatImage")
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let petImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dogImage")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func configureView() {
        resultLabel.text = translatedText
        petImageView.image = selectedImage
    }
    
    private func setupResultContainerView() {
        
        resultContainerView.addSubview(resultLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showRepeatButton))
        resultContainerView.addGestureRecognizer(tapGesture)
        
    }
    
    private func setupRepeatContainerView() {
        repeatContainerView.addSubview(repeatImageView)
        repeatContainerView.addSubview(repeatLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(repeatButtonDidTap))
        repeatContainerView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showRepeatButton() {
        UIView.animate(withDuration: 0.3) {
            self.repeatContainerView.isHidden = false
            self.resultContainerView.isHidden = true
            self.lineView.isHidden = true
        }
    }
    
    @objc
    private func repeatButtonDidTap() {
        dismiss(animated: false) { [weak self] in
            self?.delegate?.didDismissResultViewController()
        }
    }
    
    @objc
    private func closeDidTap() {
        dismiss(animated: false) { [weak self] in
            self?.delegate?.didDismissResultViewController()
        }
    }
    
    private func setUpViews() {
        view.addSubview(resultContainerView)
        view.addSubview(repeatContainerView)
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(lineView)
        view.addSubview(petImageView)
    }
    
    private func setupConstraints() {
        
        
        
        
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
            
            repeatContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repeatContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 49),
            repeatContainerView.bottomAnchor.constraint(equalTo: petImageView.topAnchor, constant: -50),
            repeatContainerView.widthAnchor.constraint(equalToConstant: 291),
            repeatContainerView.heightAnchor.constraint(equalToConstant: 54),
            
            repeatImageView.centerYAnchor.constraint(equalTo: repeatContainerView.centerYAnchor),
            repeatImageView.leadingAnchor.constraint(equalTo: repeatContainerView.leadingAnchor, constant: 111.5),
            repeatImageView.trailingAnchor.constraint(equalTo: repeatContainerView.trailingAnchor, constant: -163.5),
            
            repeatLabel.centerYAnchor.constraint(equalTo: repeatContainerView.centerYAnchor),
            repeatLabel.leadingAnchor.constraint(equalTo: repeatContainerView.leadingAnchor, constant: 137.5),
            repeatLabel.trailingAnchor.constraint(equalTo: repeatContainerView.trailingAnchor, constant: -111.5),
            
            petImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            petImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -134),
            
        ])
    }
    
}
