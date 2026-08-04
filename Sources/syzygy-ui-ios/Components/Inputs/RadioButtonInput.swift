import SwiftUI

/// A single labeled radio option. Compose several in a group and drive
/// `isSelected` from shared parent state to build a radio group.
@MainActor
public struct RadioButtonInput: View {
    private let label: String
    private let isSelected: Bool
    private let action: () -> Void

    public init(label: String, isSelected: Bool, action: @escaping () -> Void) {
        self.label = label
        self.isSelected = isSelected
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: UISpacing.sm) {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .font(UIFontToken.body)
                    .foregroundStyle(isSelected ? UIColorToken.primary : UIColorToken.textSecondary)

                Text(label)
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textPrimary)
            }
            .frame(minHeight: 44)
        }
        .accessibilityLabel(label)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
    }
}
