//
//  ViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 11/02/2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
    }
    
    private func setUpTabs() {
        let settingsVC = SettingsViewController()
        let translatorVC = TranslatorViewController()
        
        translatorVC.tabBarItem = UITabBarItem(title: "Translator",
                                               image: UIImage(named: "Translator"),
                                               tag: 2)
        
        settingsVC.tabBarItem = UITabBarItem(title: "Settings",
                                             image: UIImage(named: "Settings"),
                                             tag: 1)
        
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .gray
        
        setViewControllers(
            [translatorVC, settingsVC],
            animated: true
        )
    }
    
}
