import SwiftUI

/// A filled pill badge.
public enum BadgeStyle {
    case primary
    case success
    case warning
    case error

}

@MainActor
public struct Badge: View {
    @Environment(\.syzygyTheme) private var theme

    private let text: String
    private let style: BadgeStyle

    public init(_ text: String, style: BadgeStyle) {
        self.text = text
        self.style = style
    }

    public var body: some View {
        Text(text)
            .font(theme.typography.caption)
            .foregroundStyle(theme.colors.onPrimary)
            .padding(.horizontal, theme.spacing.sm)
            .padding(.vertical, theme.spacing.xs)
            .background(badgeColor)
            .clipShape(Capsule())
            .accessibilityLabel(text)
    }

    private var badgeColor: Color {
        switch style {
        case .primary: theme.colors.primary
        case .success: theme.colors.success
        case .warning: theme.colors.warning
        case .error: theme.colors.destructive
        }
    }
}
