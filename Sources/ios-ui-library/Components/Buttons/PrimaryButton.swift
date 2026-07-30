import SwiftUI

/// A filled, high-emphasis call-to-action button.
@MainActor
public struct PrimaryButton: View {
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
                .foregroundStyle(UIColorToken.textOnPrimary)
                .frame(maxWidth: .infinity, minHeight: 44)
                .padding(.horizontal, UISpacing.md)
        }
        .background(UIColorToken.primary)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .accessibilityLabel(title)
    }
}
