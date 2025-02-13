//
//  TranslatorPresenter.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 13/02/2025.
//

import Foundation

protocol TranslatorPresenterDelegate: AnyObject {
    func updateUIForRecording()
    func updateUIForProcessing()
    func navigateToResult(with text: String)
    func showPermissionDeniedAlert()
}

final class TranslatorPresenter {
    
    weak var viewDelegate: TranslatorPresenterDelegate?
    
    private let permissionsManager = PermissionsManager()
    private let speechRecognizer = SpeechRecognizer()
    private let translationManager = TranslationManager()
    
    init(viewDelegate: TranslatorPresenterDelegate) {
        self.viewDelegate = viewDelegate
        
        permissionsManager.permissionsManagerDelegate = self
        speechRecognizer.speechRecognizerDelegate = self
        translationManager.translationManagerDelegate = self
    }
    
    func microphoneButtonTapped() {
        permissionsManager.checkMicrophonePermission()
    }
    
    private func startRecording() {
        viewDelegate?.updateUIForRecording()
        speechRecognizer.startListening()
    }
    
    private func processTranslation() {
        viewDelegate?.updateUIForProcessing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.translationManager.translateText()
        }
    }
    
}

extension TranslatorPresenter: PermissionsManagerDelegate {
    
    func didGrantMicrophonePermission() {
        startRecording()
    }
    
    func didDenyMicrophonePermission() {
        viewDelegate?.showPermissionDeniedAlert()
    }
    
}

extension TranslatorPresenter: SpeechRecognizerDelegate {
    
    func didRecognizeSpeech(_ text: String) {
        processTranslation()
    }
    //TODO: Check it out
    func didFinishRecording() {
        processTranslation()
    }
    
}

extension TranslatorPresenter: TranslationManagerDelegate {
    
    func didTranslateText(_ translatedText: String) {
        viewDelegate?.navigateToResult(with: translatedText)
    }
}
