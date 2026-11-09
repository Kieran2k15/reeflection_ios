import SwiftUI

struct UserAvatarView: View {

    let name: String
    var size: CGFloat = 34

    var body: some View {
        
        Text(initials)
            .font(.system(size: size * 0.38, weight: .semibold))
            .tracking(size * 0.02)
            .foregroundStyle(.white)
            .frame(width: size, height: size)
            .background(colour, in: Circle())
            .accessibilityLabel(name)
    }

    var initials: String {
        let words = name.split(whereSeparator: \.isWhitespace)
        let letters = words.prefix(2).compactMap(\.first).map { String($0).uppercased() }
        return letters.isEmpty ? "?" : letters.joined()
    }
    
    var colour: Color {
        let palette: [Color] = [.teal, .blue, .indigo, .purple, .pink, .orange, .green, .cyan]
        return palette[Int(Self.stableHash(name) % UInt64(palette.count))]
    }
    
    static func stableHash(_ text: String) -> UInt64 {
            var hash: UInt64 = 0xcbf29ce484222325
            for byte in text.utf8 {
                hash ^= UInt64(byte)
                hash = hash &* 0x100000001b3
            }
            return hash
        }
}

#Preview {
    HStack(spacing: 16) {
        UserAvatarView(name: "Barry Cuda")
    }
    .padding()
}
