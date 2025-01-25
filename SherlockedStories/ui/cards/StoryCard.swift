//
//  StoryCard.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 13.01.2025.
//

import SwiftUI

struct StoryCard: View {
    var story = StoryModel()
    var onSolve: () -> Void
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
                    //.frame(width: 100, height: 50)
                    .padding(.top)
                    .foregroundStyle(Color("BrandWhite"))
                    .padding(.bottom)
                Spacer()
                HStack {
                    Text("İpucu:  ")
                        .fontWeight(.bold)
                    + Text(story.hint!)
                        .fontWeight(.regular)
                }.padding()
                Spacer()
                Button("Çözüm"){
                    print("Çözüm Butona tıklandı")
                    onSolve()
                    
                }.frame(width: 100, height: 50).background(Color("SherlockLightBrown")).foregroundColor(Color("BrandWhite"))
                    .font(Font.custom("BebasNeue-Regular", size: 25))
                    .cornerRadius(10.0)
                    .padding()
            }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
        }
    }
}

struct StoryCardBackView: View{
    var story = StoryModel()
    var onBack: () -> Void
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
//                        .frame(width: 100, height: 50)
                        .padding(.top)
                        .foregroundStyle(Color("BrandWhite"))
                        .padding(.bottom)
                    Spacer()
                    HStack {
                        Text("Çözüm:  ")
                            .fontWeight(.bold)
                        + Text(story.solution!)
                            .fontWeight(.regular)
                    }.padding()
                    Spacer()
                    Button("Geri Dön"){
                        print("Geri Dön tıklandı")
                        onBack()
                    }.frame(width: 100, height: 50).background(Color("SherlockLightBrown")).foregroundColor(Color("BrandWhite"))
                        .font(Font.custom("BebasNeue-Regular", size: 25))
                        .cornerRadius(10.0)
                        .padding()
                    
                }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
            }
        }
}





