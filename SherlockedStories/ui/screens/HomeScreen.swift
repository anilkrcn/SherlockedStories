

import SwiftUI
import CoreData

struct HomeScreen: View {
    let font = "BebasNeue-Regular"
    var viewModel = SaveViewModel()
    private let interstitialViewModel = InterstitialViewModel()
    func printDatabasePath() {
        let urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        if let applicationSupportURL = urls.first {
            print("Application Support Directory: \(applicationSupportURL.path)")
        }
    }
    var body: some View {
        NavigationView{
            ZStack{
            //Color("KokeshiRed")
            Color("SherlockBrown")
                .ignoresSafeArea()
            //            Image("BackgroundImage")
            //                .resizable()
            //                .scaledToFill()
            //                .ignoresSafeArea()
            //                .opacity(0.2)
            //                .foregroundStyle(Color("KekoshiDRed"))
            
            VStack{
                AppBarView()
                    .padding(.bottom)
                VStack{
                    DifficultySections(diff: "Easy", color: "SherlockYellow", diffScore: 1)
                    DifficultySections(diff: "Medium", color: "SherlockGray", diffScore: 2)
                    DifficultySections(diff: "Hard", color: "SherlockLightBrown", diffScore: 3)
                    
                }
                Spacer()
                //AdBannerView()
                BannerContentView()
                    //.padding(.bottom, 10)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
            .onAppear(){
                //viewModel.save(title: "Gabar", hint: "Bu bir ipucudur dostum")
                //printDatabasePath()
                checkAndPreloadData()
                printDatabasePath()
            }
    }
    }
}

#Preview {
    HomeScreen()
}

struct AppBarView: View {
    let font = "BebasNeue-Regular"
    var title: String = "Sherlocked"
    var body: some View {
        HStack{
            Text(title)
                .font(Font.custom(font, size: 40))
                .padding()
                .foregroundStyle(Color("BrandWhite"))
            Spacer()
            Button(action: {}){
                Image(systemName: "menucard")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .foregroundStyle(Color("BrandWhite"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct DifficultySections: View {
    let font = "BebasNeue-Regular"
    let diff: String?
    let color: String?
    let diffScore: Int?
    var body: some View {
        NavigationLink(destination: StoriesScreen(difficulty: diff, color: color, diffScore: diffScore)){
            Text(diff!)
                .frame(width: 150, height: 150)
                .font(Font.custom(font, size: 35))
                .foregroundStyle(Color("BrandWhite"))
                .background(Color(color!))
                .cornerRadius(10.0)
                .padding()
        }
    }
}
