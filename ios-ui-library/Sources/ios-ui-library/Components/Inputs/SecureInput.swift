import SwiftUI

/// A password field with a show/hide toggle.
@MainActor
public struct SecureInput: View {
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            HStack(spacing: UISpacing.sm) {
                Group {
                    if isRevealed {
                        TextField(placeholder, text: $text)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)

                Button {
                    isRevealed.toggle()
                } label: {
                    Image(systemName: isRevealed ? "eye.slash" : "eye")
                        .foregroundStyle(UIColorToken.textSecondary)
                        .frame(width: 44, height: 44)
                }
                .accessibilityLabel(isRevealed ? "Hide password" : "Show password")
            }
            .padding(.leading, UISpacing.sm)
            .frame(minHeight: 44)
            .background(UIColorToken.surface)
            .overlay(
                RoundedRectangle(cornerRadius: UIRadius.sm)
                    .stroke(UIColorToken.border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
            .accessibilityLabel(label)
        }
    }
}
