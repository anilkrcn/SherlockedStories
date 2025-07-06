import SwiftUI

struct SettingsSections: View {
    let font = "Bebas-Neue Regular"
    let title: String
    let urlString: String

    var body: some View {
        if let url = URL(string: urlString) {
            Link(destination: url) {
                HStack {
                    Text(title)
                        .font(Font.custom(font, size: 20))
                        .foregroundStyle(Color(.white))
                        .padding()
                    Spacer()
                    Image(systemName: "arrowshape.right.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color("BrandWhite"))
                        .cornerRadius(10)
                        .padding()
                }
                .background(Color("SherlockLightBrown"))
                .cornerRadius(15)
                .padding()
            }
        }
    }
}
