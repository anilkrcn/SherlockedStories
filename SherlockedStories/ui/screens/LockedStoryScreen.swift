//
//  LockedStoryScreen.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 23.07.2025.
//

import SwiftUI

struct LockedStoryScreen: View {
    let font = "BebasNeue-Regular"
    @StateObject var adManager = AdManager()
    @AppStorage("keyCount") var keyCount = 0
    var storyModel = StoryModel()
    var color: String?
    var body: some View {
        ZStack{
            Color("SherlockBrown").ignoresSafeArea()
            VStack{
                Spacer()
                LockedStoryCard(story: storyModel, adManager: adManager, isLocked: true, color: color!)
                Spacer()
            }
            
        }
    }
}

#Preview {
    LockedStoryScreen()
}
