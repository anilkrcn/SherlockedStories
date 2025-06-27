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
    var color: String?
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(color!))
                .frame(width: 300, height: 450)
                .cornerRadius(20.0)
                .padding()
           Image("BackgroundImage")
                .resizable()
                .frame(width: 300, height: 450)
                .cornerRadius(20.0)
                .opacity(0.05)
                
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
                        .font(.system(size: 15))
                    + Text(story.hint!)
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                }.padding()
                Spacer()
                Button("Çözüm"){
                    print("Çözüm Butona tıklandı")
                    onSolve()
                    
                }.frame(width: 100, height: 50).foregroundColor(Color("BrandWhite"))
                    .font(Font.custom("BebasNeue-Regular", size: 25))
                    .border(Color("BrandBlack"), width: 2)
                    .cornerRadius(10.0)
                    .padding()
            }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
        }
    }
}

struct StoryCardBackView: View{
    var story = StoryModel()
    var onBack: () -> Void
    var color: String?
    @State var isSolved: Bool
    var viewModel = StoryDetailViewModel()
    var body: some View {
            ZStack{
                Rectangle()
                    .fill(Color(color!))
                    .frame(width: 300, height: 450)
                    .cornerRadius(20.0)
                    .padding()
                Image("BackgroundImage")
                     .resizable()
                     .frame(width: 300, height: 450)
                     .cornerRadius(20.0)
                     .opacity(0.05)
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
                            .font(.system(size: 13))
                        + Text(story.solution!)
                            .fontWeight(.regular)
                            .font(.system(size: 13))
                    }.padding()
                    Spacer()
                    HStack {
                                Button(action: {
                                    isSolved.toggle()
                                    viewModel.update(storyModel: story, isSolved: isSolved)
                                }) {
                                    Image(systemName: isSolved ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(Color.brandBlack)
                                }
                                Text("Çözüldü")
                            }
                    Button("Geri Dön"){
                        print("Geri Dön tıklandı")
                        onBack()
                    }.frame(width: 100, height: 50).foregroundColor(Color("BrandWhite"))
                        .font(Font.custom("BebasNeue-Regular", size: 25))
                        .border(Color("BrandBlack"), width: 2)
                        .cornerRadius(10.0)
                        .padding()
                    
                }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
            }
        }
}





