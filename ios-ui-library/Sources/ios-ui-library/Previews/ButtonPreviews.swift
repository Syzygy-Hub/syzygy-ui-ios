import SwiftUI

#Preview("PrimaryButton - Light") {
    PrimaryButton("Continue") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("PrimaryButton - Dark") {
    PrimaryButton("Continue") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("SecondaryButton - Light") {
    SecondaryButton("Cancel") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("SecondaryButton - Dark") {
    SecondaryButton("Cancel") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("DestructiveButton - Light") {
    DestructiveButton("Delete Account") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("DestructiveButton - Dark") {
    DestructiveButton("Delete Account") {}
        .padding()
        .preferredColorScheme(.dark)
}

#Preview("IconButton - Light") {
    IconButton(systemImage: "heart", accessibilityLabel: "Favorite") {}
        .padding()
        .preferredColorScheme(.light)
}

#Preview("IconButton - Dark") {
    IconButton(systemImage: "heart", accessibilityLabel: "Favorite") {}
        .padding()
        .preferredColorScheme(.dark)
}
