//
//  StoriesScreen.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 8.01.2025.
//

import SwiftUI

struct StoriesScreen: View {
    let font = "BebasNeue-Regular"
    let difficulty: String?
    let color: String?
    let diffScore: Int?
    @ObservedObject var viewModel = StoryDetailViewModel()
    var body: some View {
            ZStack{
                Color("SherlockBrown").ignoresSafeArea()
                VStack {
                    AppBarView(title: "\(difficulty!) Stories")
                        .padding(.bottom)
                    ScrollView{
                        VStack{
                            ForEach(0..<viewModel.stories.count/2, id: \.self){index in
                                HStack{
                                    NavigationLink(destination: StoryDetailScreen(storyModel: viewModel.stories[index * 2], color: color!)){
                                        StoryTitleCard(color: color!, font: font, title: viewModel.stories[index * 2].title!)
                                    }
                                    NavigationLink(destination: StoryDetailScreen(storyModel: viewModel.stories[(index * 2) + 1], color: color!)){
                                        StoryTitleCard(color: color!, font: font, title: viewModel.stories[(index * 2) + 1].title!)
                                    }
                                }
                            }
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear {
                viewModel.storiesByDifficulty(diff: diffScore!)
            }
        }
}


