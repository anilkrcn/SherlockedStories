//
//  LockedStoryCard.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 23.07.2025.
//

import SwiftUI

struct LockedStoryCard: View {
    @AppStorage("keyCount") var keyCount = 0
    var story = StoryModel()
    var adManager: AdManager
    var font = "BebasNeue-Regular"
    @State var isLocked: Bool
    var color: String?
    @ObservedObject var viewModel = StoryDetailViewModel()
    @State private var navigate = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(color!))
                .frame(width: 300, height: 450)
                .cornerRadius(20.0)
                .padding()
            
            VStack{
                Text(story.title!).font(Font.custom(font, size: 38))
                    //.fontWeight(.bold)
                    //.frame(width: 100, height: 50)
                    .padding(.top)
                    .foregroundStyle(Color("BrandWhite"))
                    .padding(.bottom)
                Spacer()
                VStack(){
                    if keyCount >= 1{
                        VStack{
                            Button("Kilidi Aç"){
                                isLocked = false
                                viewModel.unlocked(storyModel: story, isLocked: isLocked)
                                keyCount -= 1
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                               navigate = true
                                           }
                            }.padding()
                                .background(Color(color!))
                                .border(Color("BrandWhite"), width: 2)
                                .cornerRadius(15)
                                .foregroundStyle(Color.white)
                                .padding(.bottom, 10)
                            
                        }
                    }
                    
                    NavigationLink(
                        destination: StoryDetailScreen(storyModel: story, color: color!),
                        isActive: $navigate,
                        label: {EmptyView()}).hidden()
                    
                    Button("Reklam İzle +1 Anahtar") {
                        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                            adManager.showAd(from: rootVC)
                            }
                    }.padding()
                        .background(Color(color!))
                        .border(Color("BrandWhite"), width: 2)
                        .cornerRadius(15)
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 10)
                        
                }.onChange(of: adManager.rewardEarned) { earned in
                    if earned {
                        keyCount += 1
                        adManager.rewardEarned = false
                    }
                }
                    
            }.frame(maxWidth: 300, maxHeight: 450, alignment: .top)
            
            Image(systemName: "lock")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 150)
                .foregroundStyle(Color("BrandBlack"))
                .background(Color("BrandGray"))
                .cornerRadius(20.0)
                .opacity(0.3)
                .padding()
        }
    }
}


