import SwiftUI

#Preview("CardView - Light") {
    CardView {
        Text("Card content")
            .font(UIFontToken.body)
            .foregroundStyle(UIColorToken.textPrimary)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("CardView - Dark") {
    CardView {
        Text("Card content")
            .font(UIFontToken.body)
            .foregroundStyle(UIColorToken.textPrimary)
    }
    .padding()
    .preferredColorScheme(.dark)
}
