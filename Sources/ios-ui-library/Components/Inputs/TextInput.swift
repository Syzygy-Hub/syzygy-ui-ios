import SwiftUI

/// A labeled text field with an optional error state.
@MainActor
public struct TextInput: View {
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            TextField(placeholder, text: $text)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)
                .padding(.horizontal, UISpacing.sm)
                .frame(minHeight: 44)
                .background(UIColorToken.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: UIRadius.sm)
                        .stroke(errorMessage == nil ? UIColorToken.border : UIColorToken.destructive, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
                .accessibilityLabel(label)

            if let errorMessage {
                Text(errorMessage)
                    .font(UIFontToken.caption)
                    .foregroundStyle(UIColorToken.destructive)
            }

            if let maxLength {
                Text("\(text.count)/\(maxLength)")
                    .font(UIFontToken.caption)
                    .foregroundStyle(UIColorToken.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
