//
//  SettingsScreen.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 29.06.2025.
//

import SwiftUI

struct SettingsScreen: View {
    let font = "BebasNeue-Regular"
    var body: some View {
        ZStack{
            Color("SherlockBrown")
                .ignoresSafeArea()
            VStack{
                AppBarView(title:"Ayarlar")
                    .padding(.bottom)
                Spacer()
                ScrollView{
                    VStack(spacing: -10){
                        SettingsSections(title: "Gizlilik Politikası")
                        SettingsSections(title: "Kullanım Şartları")
                        SettingsSections(title: "Bizi Değerlendirin")
                        SettingsSections(title: "Hakkında")
                    }
                }
                Spacer()
                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    SettingsScreen()
}
