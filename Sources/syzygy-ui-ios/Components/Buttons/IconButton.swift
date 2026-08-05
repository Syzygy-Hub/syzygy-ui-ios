import SwiftUI

/// A compact, icon-only button with a guaranteed 44pt touch target.
@MainActor
public struct IconButton: View {
    @Environment(\.syzygyTheme) private var theme

    private let systemImage: String
    private let accessibilityLabel: String
    private let action: () -> Void

    public init(systemImage: String, accessibilityLabel: String, action: @escaping () -> Void) {
        self.systemImage = systemImage
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.primary)
                .frame(width: 44, height: 44)
        }
        .accessibilityLabel(accessibilityLabel)
    }
}
