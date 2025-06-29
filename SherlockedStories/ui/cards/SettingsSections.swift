//
//  SettingsSections.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 29.06.2025.
//

import SwiftUI

struct SettingsSections: View {
    let font = "Bebas-Neue Regular"
    let title: String
    var body: some View {
        HStack{
            Text(title)
                .font(Font.custom(font, size: 20))
                .foregroundStyle(Color(.white))
                .padding()
            Spacer()
            Button(action: {}){
                Image(systemName: "arrowshape.right.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color("BrandWhite"))
                    .cornerRadius(10)
                    .padding()
            }
        }.background(Color("SherlockLightBrown"))
            .cornerRadius(15)
            .padding()
    }
}


