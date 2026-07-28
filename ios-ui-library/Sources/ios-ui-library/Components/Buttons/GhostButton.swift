import SwiftUI

/// A low-emphasis button with a transparent background and a primary-colored border and label.
@MainActor
public struct GhostButton: View {
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
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: UIRadius.md)
                .stroke(UIColorToken.primary, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .accessibilityLabel(title)
    }
}
