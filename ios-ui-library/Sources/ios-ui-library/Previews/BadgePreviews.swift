import SwiftUI

#Preview("Badge - Light") {
    HStack(spacing: UISpacing.sm) {
        Badge("New", style: .primary)
        Badge("Active", style: .success)
        Badge("Pending", style: .warning)
        Badge("Failed", style: .error)
    }
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Badge - Dark") {
    HStack(spacing: UISpacing.sm) {
        Badge("New", style: .primary)
        Badge("Active", style: .success)
        Badge("Pending", style: .warning)
        Badge("Failed", style: .error)
    }
    .padding()
    .preferredColorScheme(.dark)
}
