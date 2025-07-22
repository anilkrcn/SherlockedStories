//
//  AdManager.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 22.07.2025.
//


import GoogleMobileAds
import SwiftUI

class AdManager: NSObject, ObservableObject, FullScreenContentDelegate {
    @Published var rewardEarned: Bool = false
    private var rewardedAd: RewardedAd?
    private let adUnitID = "ca-app-pub-3940256099942544/1712485313" // Test ID. Gerçek reklam için AdMob panelinden alın.

    override init() {
        super.init()
        loadRewardedAd()
    }

    func loadRewardedAd() {
        let request = Request()
        RewardedAd.load(with: adUnitID, request: request) { ad, error in
            if let error = error {
                print("Reklam yüklenemedi: \(error.localizedDescription)")
                return
            }
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
            print("Reklam yüklendi.")
        }
    }

    func showAd(from rootViewController: UIViewController) {
        if let ad = rewardedAd {
            ad.present(from: rootViewController) {
                let reward = ad.adReward
                print("Kullanıcı ödül aldı: \(reward.amount) \(reward.type)")
                self.rewardEarned = true
            }
        } else {
            print("Reklam hazır değil.")
        }
    }

    // Reklam kapandıysa yenisini yükle
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        loadRewardedAd()
    }
}
