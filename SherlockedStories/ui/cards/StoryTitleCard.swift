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
    var isLocked: Bool
    var isSolved: Bool
    var body: some View {
        if isLocked{
            ZStack{
                Text(title)
                    .frame(width: 150, height: 150)
                    .font(Font.custom(font, size: 35))
                    .foregroundStyle(Color("BrandWhite"))
                    .background(Color(color))
                    .cornerRadius(10.0)
                    .padding()
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color("BrandBlack"))
                    .background(Color("BrandGray"))
                    .cornerRadius(10.0)
                    .opacity(0.3)
                    .padding()
            }
        }else{
            Text(title)
                .frame(width: 150, height: 150)
                .font(Font.custom(font, size: 35))
                .foregroundStyle(Color("BrandWhite"))
                .background(Color(color))
                .cornerRadius(10.0)
                .padding()
        }
    }
}

