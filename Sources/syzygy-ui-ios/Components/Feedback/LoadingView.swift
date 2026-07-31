import SwiftUI

/// A spinner with an optional accompanying message.
@MainActor
public struct LoadingView: View {
    private let message: String?

    public init(message: String? = nil) {
        self.message = message
    }

    public var body: some View {
        VStack(spacing: UISpacing.md) {
            ProgressView()
                .tint(UIColorToken.primary)

            if let message {
                Text(message)
                    .font(UIFontToken.subheadline)
                    .foregroundStyle(UIColorToken.textSecondary)
            }
        }
        .padding(UISpacing.lg)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message ?? "Loading")
    }
}
