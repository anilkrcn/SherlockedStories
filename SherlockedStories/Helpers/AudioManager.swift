import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()

    private var player: AVAudioPlayer?
    @Published var isMuted: Bool = UserDefaults.standard.bool(forKey: "musicMuted") {
        didSet {
            UserDefaults.standard.set(isMuted, forKey: "musicMuted")
            player?.volume = isMuted ? 0 : 0.3
        }
    }

    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "background_music", withExtension: "mp3") else {
            print("Müzik dosyası bulunamadı")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = isMuted ? 0 : 0.3
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Müzik oynatma hatası: \(error)")
        }
    }
}
