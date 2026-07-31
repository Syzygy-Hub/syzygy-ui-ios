import SwiftUI

/// A filled button for irreversible or destructive actions.
@MainActor
public struct DestructiveButton: View {
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
        .background(UIColorToken.destructive)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .accessibilityLabel(title)
    }
}
