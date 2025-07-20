//
//  KeyDetailScreen.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 20.07.2025.
//

import SwiftUI

struct KeyDetailScreen: View {
    let font = "BebasNeue-Regular"
    var keyCount: Int = 0
    var body: some View {
        ZStack{
            Color("SherlockBrown").ignoresSafeArea()
            VStack{
                
                HStack{
                    Image(systemName: "key.horizontal")
                        .resizable()
                        .frame(width: 32, height: 20)
                        .foregroundStyle(Color("BrandWhite"))
                    Text("ile kilitli hikayeleri açabilirsin!")
                        .font(Font.custom(font, size: 24))
                }
                
                HStack{
                    Image(systemName: "key.horizontal")
                        .resizable()
                        .frame(width: 52, height: 40)
                        .foregroundStyle(Color("BrandWhite"))
                    Text("\(keyCount)")
                        .font(Font.custom(font, size: 50))
                }
                .background(Color.sherlockLightBrown)
                .cornerRadius(15)
                    
                
            }
        }
    }
}

#Preview {
    KeyDetailScreen()
}
