//
//  StoryTitleCard.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 21.01.2025.
//

import SwiftUI

struct StoryTitleCard: View {
    var color: String
    var font: String
    var title: String
    var body: some View {
        Text(title)
            .frame(width: 150, height: 150)
            .font(Font.custom(font, size: 35))
            .foregroundStyle(Color("BrandWhite"))
            .background(Color(color))
            .cornerRadius(10.0)
            .padding()
    }
}

