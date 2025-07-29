
import SwiftUI

struct StoriesScreen: View {
    let font = "BebasNeue-Regular"
    let difficulty: String?
    let color: String?
    let diffScore: Int?
    @State var tapCount = 0
    @State var lastAdDisplayTime: Date? = nil
    @ObservedObject var interstitialViewModel = InterstitialViewModel()
    //@State var adCounter: Int = 1
    @ObservedObject var viewModel = StoryDetailViewModel()
    
    var adManager =  AdManager()
    
    var body: some View {
            ZStack{
                Color("SherlockBrown").ignoresSafeArea()
                VStack {
                    AppBarView(title: "\(difficulty!) HİKAYELER", isVisible: false, isKeyVisible: true)
                        .padding(.bottom)
                    ScrollView{
                        VStack{
                            ForEach(0..<viewModel.stories.count/2, id: \.self){index in
                                let firstTitleCard = viewModel.stories[index * 2]
                                let secondTitleCard = viewModel.stories[(index * 2) + 1]
                                HStack{
                                    NavigationLink(destination: firstTitleCard.isLocked ? AnyView(LockedStoryScreen(storyModel: firstTitleCard, color: color!)) : AnyView(StoryDetailScreen(storyModel: firstTitleCard, color: color!))){
                                        StoryTitleCard(color: color!, font: font, title: firstTitleCard.title!, isLocked: firstTitleCard.isLocked, isSolved: firstTitleCard.isSolved)
                                    }
                                    NavigationLink(destination: secondTitleCard.isLocked ? AnyView(LockedStoryScreen(storyModel: secondTitleCard, color: color!)) : AnyView(StoryDetailScreen(storyModel: secondTitleCard, color: color!))){
                                        StoryTitleCard(color: color!, font: font, title: secondTitleCard.title!, isLocked: secondTitleCard.isLocked, isSolved: secondTitleCard.isSolved)
                                    }
                                }
                            }
                            Spacer().frame(height: 20)
                            Text("YENİ HİKAYELER YAKINDA...")
                                .font(Font.custom(font, size: 20))
                                .foregroundStyle(Color(color!))
                
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear {
                viewModel.storiesByDifficulty(diff: diffScore!)
                lastAdDisplayTime = interstitialViewModel.lastAdDisplayTime
                tapCount = interstitialViewModel.tapCount
                interstitialViewModel.buttonTapped()
                print(tapCount)
                print(lastAdDisplayTime ?? "No value")
            }
        }
}


