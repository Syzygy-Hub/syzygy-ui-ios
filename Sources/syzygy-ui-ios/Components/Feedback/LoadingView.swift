import SwiftUI

/// A spinner with an optional accompanying message.
@MainActor
public struct LoadingView: View {
    @Environment(\.syzygyTheme) private var theme

    private let message: String?

    public init(message: String? = nil) {
        self.message = message
    }

    public var body: some View {
        VStack(spacing: theme.spacing.md) {
            ProgressView()
                .tint(theme.colors.primary)

            if let message {
                Text(message)
                    .font(theme.typography.subheadline)
                    .foregroundStyle(theme.colors.textSecondary)
            }
        }
        .padding(theme.spacing.lg)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message ?? "Loading")
    }
}
