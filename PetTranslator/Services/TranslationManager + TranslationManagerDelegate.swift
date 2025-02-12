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
        "Woof! I want to play!",
        "Meow... I'm hungry!",
        "Bark! Let’s go outside!",
        "Purr... I love you!"
    ]
    
    func translateText() {
        let translatedText = phrases.randomElement() ?? "Woof!"
        translationManagerDelegate?.didTranslateText(translatedText)
    }
}
