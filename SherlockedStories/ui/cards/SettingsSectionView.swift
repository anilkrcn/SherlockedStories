import SwiftUI

struct SettingsSectionView: View {
    let title: String
    let items: [SettingsButton]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            VStack(spacing: 10) {
                ForEach(items.indices, id: \.self) { index in
                    Button(action: items[index].action) {
                        HStack {
                            Text(items[index].title)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding()
                        .background(Color("SherlockBeige"))
                        .cornerRadius(12)
                    }
                }
            }
            //.background(Color.blue)
            //.clipShape(RoundedRectangle(cornerRadius: 12))
            //.padding()
        }
    }
}
