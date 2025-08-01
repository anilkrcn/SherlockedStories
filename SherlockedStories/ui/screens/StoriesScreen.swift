import SwiftUI

struct StoriesScreen: View {
    let font = "BebasNeue-Regular"
    let difficulty: String?
    let color: String?
    let diffScore: Int?

    @State private var tapCount = 0
    @State private var lastAdDisplayTime: Date? = nil
    @ObservedObject var interstitialViewModel = InterstitialViewModel()
    @ObservedObject var viewModel = StoryDetailViewModel()
    
    @State private var showUnlockAlert = false
    @State private var selectedStory: StoryModel?
    @State private var navigateToDetail = false
    @AppStorage("keyCount") private var keyCount = 0

    var adManager = AdManager()

    var body: some View {
        
            ZStack {
                Color("SherlockBrown").ignoresSafeArea()

                VStack {
                    AppBarView(title: "\(difficulty!) HİKAYELER", isVisible: false, isKeyVisible: true)
                        .padding(.bottom)

                    ScrollView {
                        VStack {
                            ForEach(0..<viewModel.stories.count/2, id: \.self) { index in
                                let first = viewModel.stories[index * 2]
                                let second = viewModel.stories[(index * 2) + 1]

                                HStack {
                                    storyButton(for: first)
                                    storyButton(for: second)
                                }
                            }

                            Spacer().frame(height: 20)

                            Text("YENİ HİKAYELER YAKINDA...")
                                .font(Font.custom(font, size: 20))
                                .foregroundStyle(Color(color!))
                        }
                    }
                }

                if showUnlockAlert, let story = selectedStory {
                    UnlockAlertView(
                        story: story,
                        showAlert: $showUnlockAlert,
                        onUnlock: {
                            // Eğer kullanıcıda anahtar varsa açmak için
                            viewModel.unlocked(storyModel: story, isLocked: false)
                            navigateToDetail = true
                        },
                        adManager: adManager,
                        shouldNavigate: $navigateToDetail
                    )
                }


                NavigationLink(
                    destination: selectedStory.map { StoryDetailScreen(storyModel: $0, color: color!) },
                    isActive: $navigateToDetail
                ) {
                    EmptyView()
                }
            }
            .onAppear {
                viewModel.storiesByDifficulty(diff: diffScore!)
                lastAdDisplayTime = interstitialViewModel.lastAdDisplayTime
                tapCount = interstitialViewModel.tapCount
                interstitialViewModel.buttonTapped()
            }
        
    }

    // Tekil buton yapısı
    @ViewBuilder
    private func storyButton(for story: StoryModel) -> some View {
        Button {
            if story.isLocked {
                selectedStory = story
                showUnlockAlert = true
            } else {
                selectedStory = story
                navigateToDetail = true
            }
        } label: {
            StoryTitleCard(
                color: color!,
                font: font,
                title: story.title!,
                isLocked: story.isLocked,
                isSolved: story.isSolved
            )
        }
    }
}
