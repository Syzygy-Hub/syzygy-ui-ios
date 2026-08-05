import SwiftUI

/// A labeled checkbox with a filled/outline square glyph.
@MainActor
public struct CheckboxInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var isChecked: Bool

    public init(label: String, isChecked: Binding<Bool>) {
        self.label = label
        self._isChecked = isChecked
    }

    public var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack(spacing: theme.spacing.sm) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .font(theme.typography.body)
                    .foregroundStyle(isChecked ? theme.colors.primary : theme.colors.textSecondary)

                Text(label)
                    .font(theme.typography.body)
                    .foregroundStyle(theme.colors.textPrimary)
            }
            .frame(minHeight: 44)
        }
        .accessibilityLabel(label)
        .accessibilityValue(isChecked ? "Checked" : "Unchecked")
    }
}
