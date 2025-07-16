import SwiftUI

struct SettingsScreen: View {
    @State private var showOnboarding = false
    @Environment(\.openURL) var openURL

    var body: some View {
        NavigationView {
            ZStack{
                Color("SherlockBrown")
                    .ignoresSafeArea()
                VStack{
                    AppBarView(title: "Ayarlar", isVisible: false)
                        .padding(.bottom)
                ScrollView {
                    VStack(spacing: 20) {
                        // Yardım Bölümü
                        SettingsSectionView(
                            title: "Yardım",
                            items: [
                                SettingsButton(title: "Nasıl Oynanır?", action: { showOnboarding = true })
                            ]
                        )
                        
                        // Yasal Bölüm
                        SettingsSectionView(
                            title: "Yasal",
                            items: [
                                SettingsButton(title: "Gizlilik Politikası", action: {
                                    openURL(URL(string: "https://anilkrcn.github.io/privacy-policy/PrivacyPolicy")!)
                                }),
                                SettingsButton(title: "Kullanım Koşulları", action: {
                                    openURL(URL(string: "https://anilkrcn.github.io/privacy-policy/sherlockedstories.html")!)
                                })
                            ]
                        )
                    }
                    .padding()
                    .background(Color(.sherlockBrown)) // Form arka planı
                }
                //.navigationTitle("Ayarlar")
                .sheet(isPresented: $showOnboarding) {
                    OnboardingContentView {
                        showOnboarding = false
                    }
                }
            }
        }
        }
    }
}
