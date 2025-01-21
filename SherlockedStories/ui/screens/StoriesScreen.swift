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
                                    NavigationLink(destination: StoryDetailScreen(storyModel: viewModel.stories[index * 2])){
                                        StoryTitleCard(color: color!, font: font, title: viewModel.stories[index * 2].title!)
                                    }
                                    NavigationLink(destination: StoryDetailScreen(storyModel: viewModel.stories[(index * 2) + 1])){
                                        StoryTitleCard(color: color!, font: font, title: viewModel.stories[(index * 2) + 1].title!)
                                    }
                                }
                            }
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .onAppear {
                viewModel.loadStories()
                print("\(viewModel.stories.count)")
                print("\(viewModel.stories[0].title!)")
            }
        }
}


