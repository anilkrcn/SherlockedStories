//
//  KeyDetailScreen.swift
//  SherlockedStories
//
//  Created by Anıl Karacan on 20.07.2025.
//

import SwiftUI

struct KeyDetailScreen: View {
    let font = "BebasNeue-Regular"
    @StateObject var adManager = AdManager()
    @AppStorage("keyCount") var keyCount = 0
    var body: some View {
        ZStack{
            Color("SherlockBrown").ignoresSafeArea()
            VStack{
                Spacer()
                KeyCard(keyCount: keyCount, adManager: adManager)
                Spacer()
            }
            
        }
    }
}


