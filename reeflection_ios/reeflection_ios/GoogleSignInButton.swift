import SwiftUI

struct GoogleSignInButton: View {

    let action: () -> Void

    var body: some View {
        
        Button(action: action) {
            HStack(spacing: 10) {
                Image(.googleG)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text("Sign in with Google")
                    .font(.system(size: 14, weight: .medium))
            }
            .padding(.horizontal, 12)
            .frame(height: 40)
            .foregroundStyle(Color(red: 0xE3 / 255, green: 0xE3 / 255, blue: 0xE3 / 255))
            .background(Color(red: 0x13 / 255, green: 0x13 / 255, blue: 0x14 / 255), in: RoundedRectangle(cornerRadius: 4))
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(Color(red: 0x74 / 255, green: 0x77 / 255, blue: 0x75 / 255))
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    GoogleSignInButton {}
        .padding()
}
