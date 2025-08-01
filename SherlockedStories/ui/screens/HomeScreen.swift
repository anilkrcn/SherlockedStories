

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
            Color("SherlockBrown")
                .ignoresSafeArea()
            
            VStack{
                AppBarView()
                    .padding(.bottom)
                VStack{
                    DifficultySections(diff: "Kolay", color: "SherlockYellow", diffScore: 1)
                    DifficultySections(diff: "Orta", color: "SherlockGray", diffScore: 2)
                    DifficultySections(diff: "Zor", color: "SherlockLightBrown", diffScore: 3)
                    
                }
                Spacer()
                //AdBannerView()
                BannerContentView()
                    //.padding(.bottom, 10)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
            .onAppear(){
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
    var isVisible: Bool = true
    var isKeyVisible: Bool = false
    @AppStorage("keyCount") var keyCount = 0
    var body: some View {
        HStack{
            Text(title)
                .font(Font.custom(font, size: 40))
                .padding()
                .foregroundStyle(Color("BrandWhite"))
            Spacer()
            
            if isKeyVisible{
                NavigationLink(destination: KeyDetailScreen()){
                    HStack(spacing: 2){
                        Image(systemName: "key.horizontal")
                            .resizable()
                            .frame(width: 32, height: 20)
                            .foregroundStyle(Color("BrandWhite"))
                            .cornerRadius(10)
                            .padding(.leading, 5)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        Text("\(keyCount)")
                            .fontWeight(.medium)
                            .foregroundStyle(Color("BrandWhite"))
                            .padding(.trailing, 5)
                    }
                    .background(Color.sherlockLightBrown)
                    .cornerRadius(15)
                    .padding()
                }
                
            }
            
            if isVisible{
                NavigationLink(destination: SettingsScreen()){
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .foregroundStyle(Color("BrandWhite"))
                        .cornerRadius(10)
                }
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
