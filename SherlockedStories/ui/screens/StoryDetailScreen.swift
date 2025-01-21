
import SwiftUI

struct StoryDetailScreen: View {
    @State var isFlipped = false
    @ObservedObject var viewModel = StoryDetailViewModel()
    var storyModel = StoryModel()
    var body: some View {
        ZStack{
            Color("SherlockBrown").ignoresSafeArea()
            
            VStack{
                AppBarView()
                    .padding(.bottom)
                ZStack{
//                    CardBackView(isFlipped: isFlipped)
//                        .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
//                    CardFrontView(isFlipped: isFlipped)
//                        .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
                    StoryCard(story: storyModel, isFlipped: isFlipped)
                            .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
                    StoryCard(story: storyModel, isFlipped: isFlipped)
                            .animation(isFlipped ? .linear : .linear.delay(0.35), value: isFlipped)
                    
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        .onAppear(){
            viewModel.loadStories()
            print("\(viewModel.stories.first!.title!)")
        }
    }
}




