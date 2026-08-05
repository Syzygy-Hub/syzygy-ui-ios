import SwiftUI

/// A filled button for irreversible or destructive actions.
@MainActor
public struct DestructiveButton: View {
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
                .foregroundStyle(theme.colors.onPrimary)
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.horizontal, theme.spacing.md)
        }
        .background(theme.colors.destructive)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
        .accessibilityLabel(title)
    }
}
