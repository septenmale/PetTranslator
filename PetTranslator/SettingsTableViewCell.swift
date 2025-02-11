//
//  SettingsTableViewCell.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 11/02/2025.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "SettingsCell"
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right")) // TODO: поменять на макет
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(named: "settingsTableViewBackgroundColor")
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 16),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = bounds.inset(by: UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0))
        
        textLabel?.frame.origin.y = (contentView.frame.height - (textLabel?.frame.height ?? 0)) / 2
    }
}
