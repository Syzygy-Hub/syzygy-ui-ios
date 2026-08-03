import SwiftUI

/// A generic composable field wrapper: a label, an arbitrary content slot,
/// and an optional error or helper message below it. Error text takes
/// precedence over helper text when both are provided.
@MainActor
public struct FormField<Content: View>: View {
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            content

            if let errorMessage {
                Text(errorMessage)
                    .font(UIFontToken.caption)
                    .foregroundStyle(UIColorToken.destructive)
            } else if let helperText {
                Text(helperText)
                    .font(UIFontToken.caption)
                    .foregroundStyle(UIColorToken.textSecondary)
            }
        }
    }
}
