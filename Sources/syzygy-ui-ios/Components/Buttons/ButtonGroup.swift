import SwiftUI

/// A horizontal segmented row of buttons. Supports single-select (the usual
/// segmented-control behavior) or, with `multiSelect: true`, independent
/// toggling of each option.
@MainActor
public struct ButtonGroup: View {
    private let options: [String]
    private let multiSelect: Bool
    @Binding private var selection: Set<String>

    /// Single-select convenience initializer backed by a single string binding.
    public init(options: [String], selection: Binding<String>) {
        self.options = options
        self.multiSelect = false
        self._selection = Binding(
            get: { [selection.wrappedValue] },
            set: { newValue in
                if let first = newValue.first {
                    selection.wrappedValue = first
                }
            }
        )
    }

    /// Multi-select initializer backed by a `Set` of selected options.
    public init(options: [String], selection: Binding<Set<String>>, multiSelect: Bool = true) {
        self.options = options
        self.multiSelect = multiSelect
        self._selection = selection
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                let isSelected = selection.contains(option)

                Button {
                    toggle(option)
                } label: {
                    Text(option)
                        .font(UIFontToken.subheadline)
                        .foregroundStyle(isSelected ? UIColorToken.onPrimary : UIColorToken.textPrimary)
                        .frame(maxWidth: .infinity, minHeight: 36)
                        .background(isSelected ? UIColorToken.primary : Color.clear)
                }
                .accessibilityAddTraits(isSelected ? [.isSelected] : [])
            }
        }
        .background(UIColorToken.surfaceSecondary)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
        .overlay(
            RoundedRectangle(cornerRadius: UIRadius.sm)
                .stroke(UIColorToken.border, lineWidth: UIBorderWidth.thin)
        )
    }

    private func toggle(_ option: String) {
        if multiSelect {
            if selection.contains(option) {
                selection.remove(option)
            } else {
                selection.insert(option)
            }
        } else {
            selection = [option]
        }
    }
}
