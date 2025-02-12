
import SwiftUI
import GoogleMobileAds

struct AdBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> BannerView {
        let bannerView = BannerView(adSize: AdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
        bannerView.load(Request())
        return bannerView
    }

    func updateUIView(_ uiView: BannerView, context: Context) {}
}



class AdManager: ObservableObject {
    @Published var interstitialAd: InterstitialAd?
    private var lastAdShownTime: Date?

    func loadInterstitial() {
        let request = Request()
        InterstitialAd.load(with: "ca-app-pub-xxxxxxxxxxxxxxxx/xxxxxxxxxx", request: request) { ad, error in
            if let error = error {
                print("Reklam yüklenirken hata oluştu: \(error.localizedDescription)")
                return
            }
            self.interstitialAd = ad
        }
    }

    func isAdReady() -> Bool {
        guard let lastShown = lastAdShownTime else { return true }
        return Date().timeIntervalSince(lastShown) > 300 // 5 dakika geçti mi?
    }

    func showInterstitial(from rootViewController: UIViewController) {
        if let interstitial = interstitialAd {
            interstitial.present(from: rootViewController)
            self.lastAdShownTime = Date()
            self.loadInterstitial() // Yeni reklamı yükle
        } else {
            print("Reklam henüz hazır değil.")
        }
    }
}

