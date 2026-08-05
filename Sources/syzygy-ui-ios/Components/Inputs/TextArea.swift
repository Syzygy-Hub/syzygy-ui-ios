import SwiftUI

/// A labeled multi-line text input, sized to a fixed number of visible lines.
@MainActor
public struct TextArea: View {
    @Environment(\.syzygyTheme) private var theme

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
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(theme.typography.body)
                        .foregroundStyle(theme.colors.textTertiary)
                        .padding(.horizontal, theme.spacing.xs)
                        .padding(.vertical, theme.spacing.xs)
                }

                TextEditor(text: $text)
                    .font(theme.typography.body)
                    .foregroundStyle(theme.colors.textPrimary)
                    .scrollContentBackground(.hidden)
            }
            .padding(.horizontal, theme.spacing.xs)
            .frame(minHeight: lineHeight * CGFloat(minLines), maxHeight: lineHeight * CGFloat(maxLines))
            .background(theme.colors.surface)
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.sm)
                    .stroke(theme.colors.border, lineWidth: UIBorderWidth.thin)
            )
            .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
            .accessibilityLabel(label)
        }
    }

    private var lineHeight: CGFloat {
        #if canImport(UIKit)
        UIFont.preferredFont(forTextStyle: .body).lineHeight + theme.spacing.sm
        #else
        22
        #endif
    }
}
