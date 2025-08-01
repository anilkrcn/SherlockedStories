import SwiftUI

struct UnlockAlertView: View {
    let story: StoryModel
    @Binding var showAlert: Bool
    var onUnlock: () -> Void
    @ObservedObject var adManager: AdManager
    @AppStorage("keyCount") private var keyCount = 0
    @Binding var shouldNavigate: Bool // Reklamdan sonra otomatik geçiş için
    @StateObject var viewModel = StoryDetailViewModel()
    @State private var showLoading = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                if keyCount > 0 {
                    Text("“\(story.title ?? "")” hikayesi kilitli.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }else{
                    Text("Kilidi açmak için anahtarınız yok!")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                

                if keyCount > 0 {
                    Button("🔓 Kilidi Aç (Anahtar: \(keyCount))") {
                        keyCount -= 1
                        onUnlock()
                        showAlert = false
                    }
                    .buttonStyle(AlertButtonStyle(color: Color.sherlockLightBrown))
                } else {
                    if showLoading {
                        ProgressView("Reklam Yükleniyor...")
                            .padding()
                    } else {
                        Button("🎥 Reklam İzle ve 1 Anahtar Kazan") {
                            if let rootVC = UIApplication.shared.connectedScenes
                                .compactMap({ $0 as? UIWindowScene })
                                .first?.windows.first?.rootViewController {
                                showLoading = true
                                adManager.showAd(from: rootVC)
                            }
                        }.multilineTextAlignment(.center)
                        .buttonStyle(AlertButtonStyle(color: Color.sherlockLightBrown))
                    }
                }

                Button("❌ Vazgeç") {
                    showAlert = false
                }
                .buttonStyle(AlertButtonStyle(color: Color.kokeshiRed))
            }
            .padding()
            .background(Color.sherlockBeige)
            .cornerRadius(16)
            .frame(maxWidth: 300)
            .shadow(radius: 10)
        }
        .onChange(of: adManager.rewardEarned) { earned in
            if earned {
                keyCount += 1
                adManager.rewardEarned = false // reset
                showAlert = false
                shouldNavigate = false // otomatik geç
               // viewModel.unlocked(storyModel: story, isLocked: false)
                showLoading = false
            }
        }
    }
}


// Custom button style
struct AlertButtonStyle: ButtonStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(color.opacity(configuration.isPressed ? 0.7 : 1))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
