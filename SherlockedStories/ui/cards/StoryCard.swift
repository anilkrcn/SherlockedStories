//
//  StoryCard.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 13.01.2025.
//

import SwiftUI

struct StoryCard: View {
    var story = StoryModel()
    @State var isFlipped: Bool = false
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("SherlockYellow"))
                .frame(width: 300, height: 450)
                .cornerRadius(20.0)
                .padding()
            VStack{
                Text(story.title!).font(.title)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 50)
                    .padding(.top)
                    .foregroundStyle(Color("BrandWhite"))
                    .padding(.bottom)
                HStack {
                    Text("İpucu:  ")
                        .fontWeight(.bold)
                    + Text(story.hint!)
                        .fontWeight(.regular)
                }.padding()
                
                Button("Çözüm"){
                    print("Çözüm Butona tıklandı")
                            withAnimation(.easeIn){
                                isFlipped.toggle()
                            }
                    
                }.frame(width: 100, height: 50).background(Color("SherlockLightBrown")).foregroundColor(Color("BrandWhite"))
                    .font(Font.custom("BebasNeue-Regular", size: 25))
                    .cornerRadius(10.0)
                    .padding()
                
                
                
            }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
        }.rotation3DEffect(
            .degrees(isFlipped ? 90 : 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}




