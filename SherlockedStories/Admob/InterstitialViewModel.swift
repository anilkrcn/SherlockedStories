
// [START load_ad]
import GoogleMobileAds

class InterstitialViewModel: NSObject, FullScreenContentDelegate, ObservableObject {
    private var interstitialAd: InterstitialAd?
    @Published var tapCount: Int = 0
    var lastAdDisplayTime: Date? = Date()

    func buttonTapped() {
            
            if tapCount == 3 {
                if canShowAd() {
                    showAd()
                    tapCount = 0 // Tıklama sayısını sıfırla
                } else {
                    print("Reklam için 5 dakika geçmedi.")
                }
            }else if tapCount == 1{
                Task{
                    await loadAd()
                }
                tapCount+=1
            }else{
                tapCount+=1
            }
        }
        
        func canShowAd() -> Bool {
            // Eğer hiç reklam gösterilmediyse doğrudan reklam gösterilebilir
            guard let lastTime = lastAdDisplayTime else {
                return true
            }
            
            // Şimdiki zaman ile son reklam zamanı arasındaki farkı hesapla
            let timeInterval = Date().timeIntervalSince(lastTime)
            // 30 saniye denemek için yapıldı. Düzeltmeyi unutma!!!
            return timeInterval >= 30 // 5 dakika = 300 saniye
        }
  func loadAd() async {
    do {
      interstitialAd = try await InterstitialAd.load(
        with: "ca-app-pub-3940256099942544/4411468910", request: Request())
      // [START set_the_delegate]
      interstitialAd?.fullScreenContentDelegate = self
      // [END set_the_delegate]
    } catch {
      print("Failed to load interstitial ad with error: \(error.localizedDescription)")
    }
  }
  // [END load_ad]

  // [START show_ad]
  func showAd() {
    guard let interstitialAd = interstitialAd else {
      return print("Ad wasn't ready.")
    }

    interstitialAd.present(from: nil)
      lastAdDisplayTime = Date()
  }
  // [END show_ad]

  // MARK: - GADFullScreenContentDelegate methods

  // [START ad_events]
  func adDidRecordImpression(_ ad: FullScreenPresentingAd) {
    print("\(#function) called")
  }

  func adDidRecordClick(_ ad: FullScreenPresentingAd) {
    print("\(#function) called")
  }

  func ad(
    _ ad: FullScreenPresentingAd,
    didFailToPresentFullScreenContentWithError error: Error
  ) {
    print("\(#function) called")
  }

  func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("\(#function) called")
  }

  func adWillDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("\(#function) called")
  }

  func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
    print("\(#function) called")
    // Clear the interstitial ad.
    interstitialAd = nil
  }
  // [END ad_events]
}
