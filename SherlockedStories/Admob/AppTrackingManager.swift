//
//  AppTrackingManager.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 4.07.2025.
//


import AppTrackingTransparency
import AdSupport

class AppTrackingManager {
    static func requestTrackingAuthorization() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("Tracking izin verildi")
                case .denied:
                    print("Tracking reddedildi")
                case .notDetermined:
                    print("Tracking kararı verilmedi")
                case .restricted:
                    print("Tracking kısıtlı")
                @unknown default:
                    break
                }
            }
        }
    }
}
