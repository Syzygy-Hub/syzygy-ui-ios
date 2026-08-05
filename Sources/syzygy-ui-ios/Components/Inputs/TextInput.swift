import SwiftUI

/// A labeled text field with an optional error state.
@MainActor
public struct TextInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var text: String
    private let placeholder: String
    private let errorMessage: String?
    private let maxLength: Int?

    public init(
        label: String,
        text: Binding<String>,
        placeholder: String = "",
        errorMessage: String? = nil,
        maxLength: Int? = nil
    ) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.errorMessage = errorMessage
        self.maxLength = maxLength
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            TextField(placeholder, text: $text)
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textPrimary)
                .padding(.horizontal, theme.spacing.sm)
                .frame(minHeight: 44)
                .background(theme.colors.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.radius.sm)
                        .stroke(errorMessage == nil ? theme.colors.border : theme.colors.destructive, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
                .accessibilityLabel(label)

            if let errorMessage {
                Text(errorMessage)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.destructive)
            }

            if let maxLength {
                Text("\(text.count)/\(maxLength)")
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
