//
//  ResultViewController.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 13/02/2025.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private let translatedText: String
    
    init(translatedText: String) {
        self.translatedText = translatedText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
}
