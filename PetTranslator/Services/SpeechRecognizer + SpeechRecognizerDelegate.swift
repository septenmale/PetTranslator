//
//  SpeechReckegni.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 12/02/2025.
//

import Speech
import AVFoundation

protocol SpeechRecognizerDelegate: AnyObject {
    func didRecognizeSpeech(_ text: String)
}

final class SpeechRecognizer: NSObject {
    
    weak var speechRecognizerDelegate: SpeechRecognizerDelegate?
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
    private let audioEngine = AVAudioEngine()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func startListening() {
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        let node = audioEngine.inputNode
        recognitionRequest?.shouldReportPartialResults = false
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!) { result, error in
            if let result = result {
                let recognizedText = result.bestTranscription.formattedString
                self.stopListening()
                self.speechRecognizerDelegate?.didRecognizeSpeech(recognizedText)
            }
        }
        
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }
        
        try? AVAudioSession.sharedInstance().setCategory(.record, mode: .default, options: .duckOthers)
        try? AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        audioEngine.prepare()
        try? audioEngine.start()
    }
    
    func stopListening() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
    }
    
}
