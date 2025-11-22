import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                Image(.imgGanadi4)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                    .padding(.top, 24)
                
                HStack(spacing: 10) {
                    Text("iOS")
                    Text("조영서")
                    Spacer()
                    Text("YB")
                }
                .font(.headline)
                .padding(.horizontal, 32)
                
                HStack {
                    Text("03년생")
                    Spacer()
                    Text("INTJ")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
                .padding(.bottom, 1000)
                
                Text(".☆≡｡ﾟ.☆≡｡ﾟ.☆≡｡ﾟ ^ↀᴥↀ^ .☆≡｡ﾟ.☆≡｡ﾟ.☆≡｡ﾟ")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .background(.black)
            }
        }
        directMessageButton
            .frame(width: 300, height: 50)
    }
    
    private var directMessageButton: some View {
        Button {} label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray)
                .frame(height: 56)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                        .font(.headline)
                }
        }
    }
}

#Preview {
    ProfileView()
}
