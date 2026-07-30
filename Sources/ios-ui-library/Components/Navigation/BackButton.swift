import SwiftUI

/// A consistent back navigation button.
@MainActor
public struct BackButton: View {
    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: UISpacing.xs) {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .font(UIFontToken.body)
            .foregroundStyle(UIColorToken.primary)
            .frame(minWidth: 44, minHeight: 44)
        }
        .accessibilityLabel("Back")
    }
}
