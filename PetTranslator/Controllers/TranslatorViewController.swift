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
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        setupConstraints()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Translator"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupConstraints() {
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(equalToConstant: 58)
        ])
        
    }
    
}
