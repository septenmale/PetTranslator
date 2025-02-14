//
//  TranslatorPresenter.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 13/02/2025.
//

import Foundation
// MARK: - TranslatorPresenterDelegate
protocol TranslatorPresenterDelegate: AnyObject {
    func updateUIForRecording()
    func updateUIForProcessing()
    func navigateToResult(with text: String)
    func showPermissionDeniedAlert()
}
// MARK: - TranslatorPresenter
final class TranslatorPresenter {
    // MARK: - Public Properties
    weak var viewDelegate: TranslatorPresenterDelegate?
    // MARK: - Private Properties
    private let permissionsManager = PermissionsManager()
    private let speechRecognizer = SpeechRecognizer()
    private let translationManager = TranslationManager()
    // MARK: - Initializers
    init(viewDelegate: TranslatorPresenterDelegate) {
        self.viewDelegate = viewDelegate
        
        permissionsManager.permissionsManagerDelegate = self
        speechRecognizer.speechRecognizerDelegate = self
        translationManager.translationManagerDelegate = self
    }
    // MARK: - Public Methods
    func microphoneButtonTapped() {
        permissionsManager.checkMicrophonePermission()
    }
    // MARK: - Private Methods
    private func startRecording() {
        viewDelegate?.updateUIForRecording()
        speechRecognizer.startListening()
    }
    
    private func processTranslation() {
        viewDelegate?.updateUIForProcessing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.translationManager.translateText()
        }
    }
    
}
// MARK: - PermissionsManagerDelegate
extension TranslatorPresenter: PermissionsManagerDelegate {
    
    func didGrantMicrophonePermission() {
        startRecording()
    }
    
    func didDenyMicrophonePermission() {
        viewDelegate?.showPermissionDeniedAlert()
    }
    
}
// MARK: - SpeechRecognizerDelegate
extension TranslatorPresenter: SpeechRecognizerDelegate {
    
    func didRecognizeSpeech(_ text: String) {
        processTranslation()
    }
    
    func didFinishRecording() {
        processTranslation()
    }
    
}
// MARK: - TranslationManagerDelegate
extension TranslatorPresenter: TranslationManagerDelegate {
    
    func didTranslateText(_ translatedText: String) {
        viewDelegate?.navigateToResult(with: translatedText)
    }
}
