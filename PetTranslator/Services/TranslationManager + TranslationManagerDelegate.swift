//
//  TranslationManager + TranslationManagerDelegate.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 12/02/2025.
//

import Foundation

protocol TranslationManagerDelegate: AnyObject {
    func didTranslateText(_ translatedText: String)
}

final class TranslationManager {
    
    weak var translationManagerDelegate: TranslationManagerDelegate?
    
    private let phrases = [
        "I want to play!",
        "I'm hungry!",
        "Let’s go outside!",
        "I love you!"
    ]
    
    func translateText() {
        let translatedText = phrases.randomElement() ?? "Woof!"
        translationManagerDelegate?.didTranslateText(translatedText)
    }
}
