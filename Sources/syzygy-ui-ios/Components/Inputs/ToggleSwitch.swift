import SwiftUI

/// A labeled on/off toggle backed by the native switch control.
@MainActor
public struct ToggleSwitch: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var isOn: Bool

    public init(label: String, isOn: Binding<Bool>) {
        self.label = label
        self._isOn = isOn
    }

    public var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textPrimary)
        }
        .tint(theme.colors.primary)
        .frame(minHeight: 44)
        .accessibilityLabel(label)
    }
}
