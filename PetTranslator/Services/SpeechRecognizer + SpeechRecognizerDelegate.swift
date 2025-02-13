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
    func didFinishRecording()
}

final class SpeechRecognizer: NSObject {
    
    weak var speechRecognizerDelegate: SpeechRecognizerDelegate?
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
    private let audioEngine = AVAudioEngine()
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    func startListening() {
        let node = audioEngine.inputNode
        
        if node.inputFormat(forBus: 0).channelCount > 0 {
            node.removeTap(onBus: 0)
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.stopListening()
        }
    }
    
    func stopListening() {
        speechRecognizerDelegate?.didFinishRecording()
        
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
    }
    
}
