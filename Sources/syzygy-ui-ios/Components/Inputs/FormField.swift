import SwiftUI

/// A generic composable field wrapper: a label, an arbitrary content slot,
/// and an optional error or helper message below it. Error text takes
/// precedence over helper text when both are provided.
@MainActor
public struct FormField<Content: View>: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    private let errorMessage: String?
    private let helperText: String?
    private let content: Content

    public init(
        label: String,
        errorMessage: String? = nil,
        helperText: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.label = label
        self.errorMessage = errorMessage
        self.helperText = helperText
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            content

            if let errorMessage {
                Text(errorMessage)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.destructive)
            } else if let helperText {
                Text(helperText)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.textSecondary)
            }
        }
    }
}
