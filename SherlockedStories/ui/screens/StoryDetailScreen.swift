
import SwiftUI

struct StoryDetailScreen: View {
    @State var isFlipped = false
    @ObservedObject var viewModel = StoryDetailViewModel()
    @State var rotationAngle = 0.0
    var storyModel = StoryModel()
    var color: String?
    var body: some View {
        ZStack{
            Color("SherlockBrown").ignoresSafeArea()
            
            VStack{
                AppBarView(isVisible: false)
                    .padding(.bottom)
                Spacer()
                ZStack{
                    if isFlipped{
                        StoryCardBackView(story: storyModel, onBack: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                rotationAngle -= 180 // Geri dönüş
                                isFlipped.toggle()
                            }
                        }, color: color!, isSolved: storyModel.isSolved)
                        .opacity(rotationAngle > 90 ? 1 : 0)
                        .scaleEffect(x: -1)
                    }else{
                        StoryCard(story: storyModel, onSolve: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                rotationAngle += 180 // Geri dönüş
                                isFlipped.toggle()
                            }
                        }, color: color!)
                        .opacity(rotationAngle < 90 ? 1 : 0)
                    }
                }.rotation3DEffect(
                    .degrees(rotationAngle),
                    axis: (x: 0, y: 1, z: 0), // Y ekseninde döner
                    anchor: .center
                )
               Spacer()
                BannerContentView()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        .onAppear(){
            viewModel.loadStories()
        }
    }
}




