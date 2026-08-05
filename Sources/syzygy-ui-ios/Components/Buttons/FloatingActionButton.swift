import SwiftUI

/// A circular, elevated primary action button, typically anchored to a
/// corner of the screen.
@MainActor
public struct FloatingActionButton: View {
    @Environment(\.syzygyTheme) private var theme

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
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.onPrimary)
                .frame(width: 56, height: 56)
                .background(Circle().fill(theme.colors.primary))
        }
        .themedElevation(theme.elevation.lg)
        .accessibilityLabel(accessibilityLabel)
        .accessibilityActivationPoint(CGPoint(x: 0.5, y: 0.5))
    }
}
