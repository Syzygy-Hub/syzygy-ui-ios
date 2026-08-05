import SwiftUI

/// An inline, single-row segmented picker for switching between a small set
/// of content states — distinct from `TabBar`/`BottomNavigationBar`, which
/// are for primary app navigation, not in-place content switching.
@MainActor
public struct SegmentedControl<Option: Hashable>: View {
    @Environment(\.syzygyTheme) private var theme

    private let options: [Option]
    @Binding private var selection: Option
    private let title: (Option) -> String

    public init(options: [Option], selection: Binding<Option>, title: @escaping (Option) -> String) {
        self.options = options
        self._selection = selection
        self.title = title
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button {
                    selection = option
                } label: {
                    Text(title(option))
                        .font(theme.typography.subheadline)
                        .foregroundStyle(option == selection ? theme.colors.onPrimary : theme.colors.textPrimary)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(option == selection ? theme.colors.primary : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
                }
                .accessibilityLabel(title(option))
                .accessibilityAddTraits(option == selection ? [.isSelected] : [])
            }
        }
        .padding(theme.spacing.xs / 2)
        .background(theme.colors.surface)
        .overlay(
            RoundedRectangle(cornerRadius: theme.radius.md)
                .stroke(theme.colors.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
    }
}
