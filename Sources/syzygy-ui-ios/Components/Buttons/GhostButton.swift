import SwiftUI

/// A low-emphasis button with a transparent background and a primary-colored border and label.
@MainActor
public struct GhostButton: View {
    @Environment(\.syzygyTheme) private var theme

    private let title: String
    private let action: () -> Void

    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.primary)
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.horizontal, theme.spacing.md)
        }
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: theme.radius.md)
                .stroke(theme.colors.primary, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
        .accessibilityLabel(title)
    }
}
