//
//  PermissionsManager.swift
//  PetTranslator
//
//  Created by Viktor Zavhorodnii on 12/02/2025.
//

import AVFoundation
import Speech

protocol PermissionsManagerDelegate: AnyObject {
    func didGrantMicrophonePermission()
    func didDenyMicrophonePermission()
}

final class PermissionsManager {
    
    weak var permissionsManagerDelegate: PermissionsManagerDelegate?
    
    func checkMicrophonePermission() {
        if #available(iOS 17.0, *) {
            switch AVAudioApplication.shared.recordPermission {
            case .granted:
                permissionsManagerDelegate?.didGrantMicrophonePermission()
            case .denied:
                permissionsManagerDelegate?.didDenyMicrophonePermission()
            case .undetermined:
                requestMicrophonePermission()
            @unknown default:
                permissionsManagerDelegate?.didDenyMicrophonePermission()
            }
        } else {
            switch AVAudioSession.sharedInstance().recordPermission {
            case .granted:
                permissionsManagerDelegate?.didGrantMicrophonePermission()
            case .denied:
                permissionsManagerDelegate?.didDenyMicrophonePermission()
            case .undetermined:
                requestMicrophonePermission()
            @unknown default:
                permissionsManagerDelegate?.didDenyMicrophonePermission()
            }
        }
    }
    
    private func requestMicrophonePermission() {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { granted in
                DispatchQueue.main.async {
                    granted ? self.permissionsManagerDelegate?.didGrantMicrophonePermission()
                    : self.permissionsManagerDelegate?.didDenyMicrophonePermission()
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                DispatchQueue.main.async {
                    granted ? self.permissionsManagerDelegate?.didGrantMicrophonePermission()
                    : self.permissionsManagerDelegate?.didDenyMicrophonePermission()
                }
            }
        }
    }
    
}
