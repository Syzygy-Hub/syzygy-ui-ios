import SwiftUI

/// A consistent back navigation button.
@MainActor
public struct BackButton: View {
    @Environment(\.syzygyTheme) private var theme

    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: theme.spacing.xs) {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .font(theme.typography.body)
            .foregroundStyle(theme.colors.primary)
            .frame(minWidth: 44, minHeight: 44)
        }
        .accessibilityLabel("Back")
    }
}
