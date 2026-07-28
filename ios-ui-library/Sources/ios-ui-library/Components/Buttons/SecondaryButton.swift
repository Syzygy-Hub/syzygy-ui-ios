import SwiftUI

/// An outlined, medium-emphasis button.
@MainActor
public struct SecondaryButton: View {
    private let title: String
    private let action: () -> Void

    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(UIFontToken.headline)
                .foregroundStyle(UIColorToken.primary)
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.horizontal, UISpacing.md)
        }
        .background(UIColorToken.surface)
        .overlay(
            RoundedRectangle(cornerRadius: UIRadius.md)
                .stroke(UIColorToken.primary, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .accessibilityLabel(title)
    }
}
