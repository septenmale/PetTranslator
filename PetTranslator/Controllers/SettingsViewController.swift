//
//  SettingsViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 11/02/2025.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Private Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let tableViewTitles = [
        "Rate Us",
        "Share App",
        "Contact Us",
        "Restore Purchases",
        "Privacy Policy",
        "Terms of Use",
    ]
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyGradient()
        
        setupTableView()
        setupViews()
        setupConstraints()
    }
    // MARK: - Private Methods
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -196)
        ])
        
    }
    
}
// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = tableViewTitles[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}
// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

