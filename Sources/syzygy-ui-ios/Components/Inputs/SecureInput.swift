import SwiftUI

/// A password field with a show/hide toggle.
@MainActor
public struct SecureInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var text: String
    private let placeholder: String
    @State private var isRevealed = false

    public init(label: String, text: Binding<String>, placeholder: String = "") {
        self.label = label
        self._text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            HStack(spacing: theme.spacing.sm) {
                Group {
                    if isRevealed {
                        TextField(placeholder, text: $text)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textPrimary)

                Button {
                    isRevealed.toggle()
                } label: {
                    Image(systemName: isRevealed ? "eye.slash" : "eye")
                        .foregroundStyle(theme.colors.textSecondary)
                        .frame(width: 44, height: 44)
                }
                .accessibilityLabel(isRevealed ? "Hide password" : "Show password")
            }
            .padding(.leading, theme.spacing.sm)
            .frame(minHeight: 44)
            .background(theme.colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.sm)
                    .stroke(theme.colors.border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
            .accessibilityLabel(label)
        }
    }
}
