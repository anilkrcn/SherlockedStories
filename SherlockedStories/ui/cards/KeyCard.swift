//
//  KeyCard.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 22.07.2025.
//

import SwiftUI

struct KeyCard: View {
    @AppStorage("keyCount") var keyCount = 0
    var adManager: AdManager
    var font = "BebasNeue-Regular"
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.sherlockBeige)
                .frame(width: 300, height: 450)
                .cornerRadius(20.0)
                .padding()                
            VStack{
                HStack{
                    Image(systemName: "key.horizontal")
                        .resizable()
                        .frame(width: 32, height: 20)
                        .foregroundStyle(Color("BrandWhite"))
                    Text("ile kilitli hikayeleri açabilirsin!")
                        .font(Font.custom(font, size: 24))
                        .padding()
                }
                Spacer()
                VStack(spacing: 2){
                    Spacer()
                    HStack{
                        Image(systemName: "key.horizontal")
                            .resizable()
                            .frame(width: 62, height: 40)
                            .foregroundStyle(Color("BrandWhite"))
                            .padding(.leading, 5)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        Text("\(keyCount)")
                            .font(Font.custom(font, size: 50))
                            .padding(.trailing, 5)
                        }
                        .background(Color.sherlockLightBrown)
                        .cornerRadius(15)
                        .padding()
                    
                    Spacer()
                    
                    Button("Reklam İzle ve +1 Anahtar Kazan") {
                        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
                            adManager.showAd(from: rootVC)
                            }
                    }.padding()
                        .background(Color.sherlockLightBrown)
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
        }
    }
}


