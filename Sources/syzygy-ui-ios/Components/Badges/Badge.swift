import SwiftUI

/// A filled pill badge.
public enum BadgeStyle {
    case primary
    case success
    case warning
    case error

    var color: Color {
        switch self {
        case .primary: UIColorToken.primary
        case .success: UIColorToken.success
        case .warning: UIColorToken.warning
        case .error: UIColorToken.destructive
        }
    }
}

@MainActor
public struct Badge: View {
    private let text: String
    private let style: BadgeStyle

    public init(_ text: String, style: BadgeStyle) {
        self.text = text
        self.style = style
    }

    public var body: some View {
        Text(text)
            .font(UIFontToken.caption)
            .foregroundStyle(UIColorToken.onPrimary)
            .padding(.horizontal, UISpacing.sm)
            .padding(.vertical, UISpacing.xs)
            .background(style.color)
            .clipShape(Capsule())
            .accessibilityLabel(text)
    }
}
