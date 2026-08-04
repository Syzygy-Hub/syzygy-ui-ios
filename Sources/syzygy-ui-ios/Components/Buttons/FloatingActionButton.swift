import SwiftUI

/// A circular, elevated primary action button, typically anchored to a
/// corner of the screen.
@MainActor
public struct FloatingActionButton: View {
    private let icon: Image
    private let accessibilityLabel: String
    private let action: () -> Void

    public init(icon: Image, accessibilityLabel: String, action: @escaping () -> Void) {
        self.icon = icon
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }

    public init(systemName: String, accessibilityLabel: String, action: @escaping () -> Void) {
        self.init(icon: Image(systemName: systemName), accessibilityLabel: accessibilityLabel, action: action)
    }

    public var body: some View {
        Button(action: action) {
            icon
                .font(UIFontToken.headline)
                .foregroundStyle(UIColorToken.onPrimary)
                .frame(width: 56, height: 56)
                .background(Circle().fill(UIColorToken.primary))
        }
        .elevation(UIElevation.lg)
        .accessibilityLabel(accessibilityLabel)
    }
}
