import SwiftUI

struct OnboardingContentView: View {
    let onDismiss: () -> Void

    var body: some View {
        ZStack{
            Color(.sherlockBeige)
                .ignoresSafeArea()
            
            
                VStack(spacing: 24) {
                    Spacer()
                    
                    Image(systemName: "person.3.sequence.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(.sherlockBrown)
                    
                    Text("Nasıl Oynanır?")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("🎯 Amaç:")
                            .font(.headline)
                        Text("Hikayeyi çözerek olayın ardındaki gerçeği keşfetmek.")
                        
                        Text("🧑‍🤝‍🧑 Oyuncular:")
                            .font(.headline)
                        Text("En az 2 kişi gerçek ortamda bir arada olmalıdır.")
                        
                        Text("🧑‍🏫 Yönetici:")
                            .font(.headline)
                        Text("• Bir kişi yönetici olarak seçilir.\n• Hikayenin tamamını sessizce okur.\n• Diğer oyunculara sadece **ipucunu** okur.")
                        
                        Text("❓ Sorular ve Cevaplar:")
                            .font(.headline)
                        Text("• Oyuncular yöneticiye sorular sorar.\n• Soruların cevabı yalnızca '**Evet**', '**Hayır**' veya '**Alakasız**' olabilir.\n• Yönetici, hikayeye uygun olacak şekilde cevap verir.")
                        
                        Text("🧩 Hedef:")
                            .font(.headline)
                        Text("Oyuncular doğru soruları sorarak hikayenin tamamını anlamaya çalışır.")
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    
                   // Spacer()
                    
                    Button(action: {
                        onDismiss()
                    }) {
                        Text("Başla")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.sherlockBrown)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
                .padding()
            
        }
    }
}

