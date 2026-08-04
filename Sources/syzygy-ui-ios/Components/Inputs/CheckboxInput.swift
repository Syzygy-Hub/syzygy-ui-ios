import SwiftUI

/// A labeled checkbox with a filled/outline square glyph.
@MainActor
public struct CheckboxInput: View {
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
            HStack(spacing: UISpacing.sm) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .font(UIFontToken.body)
                    .foregroundStyle(isChecked ? UIColorToken.primary : UIColorToken.textSecondary)

                Text(label)
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textPrimary)
            }
            .frame(minHeight: 44)
        }
        .accessibilityLabel(label)
        .accessibilityValue(isChecked ? "Checked" : "Unchecked")
    }
}
