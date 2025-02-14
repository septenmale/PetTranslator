//
//  MockTranslatorPresenterDelegate.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 14/02/2025.
//

import XCTest
@testable import PetTranslator

final class MockTranslatorPresenterDelegate: TranslatorPresenterDelegate {
    
    var didUpdateUIForRecording = false
    var didUpdateUIForProcessing = false
    var didNavigateToResult = false
    var didShowPermissionDeniedAlert = false
    var lastTranslatedText: String?
    
    func updateUIForRecording() {
        didUpdateUIForRecording = true
    }
    
    func updateUIForProcessing() {
        didUpdateUIForProcessing = true
    }
    
    func navigateToResult(with text: String) {
        didNavigateToResult = true
        lastTranslatedText = text
    }
    
    func showPermissionDeniedAlert() {
        didShowPermissionDeniedAlert = true
    }
    
}
