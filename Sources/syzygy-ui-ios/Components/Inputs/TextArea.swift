import SwiftUI

/// A labeled multi-line text input, sized to a fixed number of visible lines.
@MainActor
public struct TextArea: View {
    private let label: String
    @Binding private var text: String
    private let placeholder: String
    private let minLines: Int
    private let maxLines: Int

    public init(
        label: String,
        text: Binding<String>,
        placeholder: String = "",
        minLines: Int = 3,
        maxLines: Int = 6
    ) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.minLines = minLines
        self.maxLines = maxLines
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(UIFontToken.body)
                        .foregroundStyle(UIColorToken.textTertiary)
                        .padding(.horizontal, UISpacing.xs)
                        .padding(.vertical, UISpacing.xs)
                }

                TextEditor(text: $text)
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textPrimary)
                    .scrollContentBackground(.hidden)
            }
            .padding(.horizontal, UISpacing.xs)
            .frame(minHeight: lineHeight * CGFloat(minLines), maxHeight: lineHeight * CGFloat(maxLines))
            .background(UIColorToken.surface)
            .overlay(
                RoundedRectangle(cornerRadius: UIRadius.sm)
                    .stroke(UIColorToken.border, lineWidth: UIBorderWidth.thin)
            )
            .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
            .accessibilityLabel(label)
        }
    }

    private var lineHeight: CGFloat {
        #if canImport(UIKit)
        UIFont.preferredFont(forTextStyle: .body).lineHeight + UISpacing.sm
        #else
        22
        #endif
    }
}
