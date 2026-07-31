import SwiftUI

/// A labeled on/off toggle backed by the native switch control.
@MainActor
public struct ToggleSwitch: View {
    private let label: String
    @Binding private var isOn: Bool

    public init(label: String, isOn: Binding<Bool>) {
        self.label = label
        self._isOn = isOn
    }

    public var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)
        }
        .tint(UIColorToken.primary)
        .frame(minHeight: 44)
        .accessibilityLabel(label)
    }
}
