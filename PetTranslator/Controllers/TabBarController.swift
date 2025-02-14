//
//  ViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 11/02/2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarWidth: CGFloat = 216
        let tabBarHeight: CGFloat = 82
        let bottomPadding: CGFloat = 46
        
        let newFrame = CGRect(
            x: (view.frame.width - tabBarWidth) / 2,
            y: view.frame.height - tabBarHeight - bottomPadding,
            width: tabBarWidth,
            height: tabBarHeight
        )
        
        tabBar.frame = newFrame
        
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 16
        tabBar.layer.masksToBounds = true
        
        if let items = tabBar.items {
            for item in items {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -19)
            }
        }
        
    }
    
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
        
        settingsVC.tabBarItem = UITabBarItem(title: "Clicker",
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
