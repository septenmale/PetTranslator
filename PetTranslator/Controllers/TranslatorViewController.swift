//
//  TranslatorViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 11/02/2025.
//

import UIKit

final class TranslatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: add gradient
        // TODO: try to fina an appproptiate font
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        setupMicrophoneButton()
        setupButtonStackView()
        setupViews()
        setupConstraints()
        highlightChosenPet()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Translator"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let humanLabel: UILabel = {
        let label = UILabel()
        label.text = "HUMAN"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let swapArrowsView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrowsSwap")
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let petLabel: UILabel = {
        let label = UILabel()
        label.text = "PET"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let microphoneContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let microphoneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "microphoneImage")
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let microphoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Start Speak"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dogOrCatContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var catButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "catButtonBackgroundColor")
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "catImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addTarget(self, action: #selector(catButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var dogButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "dogButtonBackgroundColor")
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "dogImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addTarget(self, action: #selector(dogButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let petImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dogImage")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupMicrophoneButton() {
        microphoneContainerView.addSubview(microphoneImageView)
        microphoneContainerView.addSubview(microphoneLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(microphoneButtonDidTap))
        microphoneContainerView.addGestureRecognizer(tapGesture)
    }
    
    private func setupButtonStackView() {
        dogOrCatContainerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(catButton)
        buttonStackView.addArrangedSubview(dogButton)
    }
    
    @objc
    private func microphoneButtonDidTap() {
        print("Mic did tap")
    }
    
    @objc
    private func catButtonDidTap() {
        print("Cat button did tap")
        guard petImageView.image == UIImage(named: "dogImage") else { return }
        petImageView.image = UIImage(named: "catImage")
        
        highlightChosenPet()
    }
    
    @objc
    private func dogButtonDidTap() {
        print("Dog button did tap")
        guard petImageView.image == UIImage(named: "catImage") else { return }
        petImageView.image = UIImage(named: "dogImage")
        
        highlightChosenPet()
    }
    
    private func highlightChosenPet() {
        if petImageView.image == UIImage(named: "dogImage") {
            catButton.alpha = 0.6
            dogButton.alpha = 1
        } else {
            catButton.alpha = 1
            dogButton.alpha = 0.6
        }
    }
    
    private func setupViews() {
        
        view.addSubview(titleLabel)
        view.addSubview(humanLabel)
        view.addSubview(swapArrowsView)
        view.addSubview(petLabel)
        view.addSubview(microphoneContainerView)
        view.addSubview(dogOrCatContainerView)
        view.addSubview(petImageView)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(equalToConstant: 58),
            
            humanLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            humanLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 76.5),
            humanLabel.trailingAnchor.constraint(equalTo: swapArrowsView.leadingAnchor, constant: -44.5),
            humanLabel.heightAnchor.constraint(equalToConstant: 29),
            
            swapArrowsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 30.5),
            swapArrowsView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            swapArrowsView.widthAnchor.constraint(equalToConstant: 24),
            swapArrowsView.heightAnchor.constraint(equalToConstant: 24),
            
            petLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            petLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -92),
            petLabel.leadingAnchor.constraint(equalTo: swapArrowsView.trailingAnchor, constant: 60),
            petLabel.heightAnchor.constraint(equalToConstant: 29),
            
            microphoneContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            microphoneContainerView.bottomAnchor.constraint(equalTo: petImageView.topAnchor, constant: -51),
            microphoneContainerView.widthAnchor.constraint(equalToConstant: 178),
            microphoneContainerView.heightAnchor.constraint(equalToConstant: 176),
            
            microphoneImageView.centerXAnchor.constraint(equalTo: microphoneContainerView.centerXAnchor),
            microphoneImageView.topAnchor.constraint(equalTo: microphoneContainerView.topAnchor, constant: 44),
            microphoneImageView.bottomAnchor.constraint(equalTo: microphoneContainerView.bottomAnchor, constant: -62),
            
            microphoneLabel.centerXAnchor.constraint(equalTo: microphoneContainerView.centerXAnchor),
            microphoneLabel.topAnchor.constraint(equalTo: microphoneImageView.bottomAnchor, constant: 24),
            microphoneLabel.bottomAnchor.constraint(equalTo: microphoneContainerView.bottomAnchor, constant: -16),
            
            dogOrCatContainerView.topAnchor.constraint(equalTo: microphoneContainerView.topAnchor),
            dogOrCatContainerView.leadingAnchor.constraint(equalTo: microphoneContainerView.trailingAnchor, constant: 35),
            dogOrCatContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            dogOrCatContainerView.bottomAnchor.constraint(equalTo: microphoneContainerView.bottomAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: dogOrCatContainerView.topAnchor, constant: 12),
            buttonStackView.leadingAnchor.constraint(equalTo: dogOrCatContainerView.leadingAnchor, constant: 18.5),
            buttonStackView.trailingAnchor.constraint(equalTo: dogOrCatContainerView.trailingAnchor, constant: -18.5),
            buttonStackView.bottomAnchor.constraint(equalTo: dogOrCatContainerView.bottomAnchor, constant: -12),
            
            petImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            petImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -134),
            
        ])
        
    }
    
}
