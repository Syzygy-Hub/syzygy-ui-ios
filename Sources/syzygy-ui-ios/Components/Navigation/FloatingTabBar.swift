import SwiftUI

/// A floating pill-style tab bar showing icon AND label per item. This fills
/// the remaining slot in the {edge-to-edge, floating} x {icon-only,
/// icon+label} matrix: `TabBar` is edge-to-edge + labeled, and
/// `BottomNavigationBar` is floating + icon-only, so `FloatingTabBar` is
/// floating + labeled — distinct from both.
@MainActor
public struct FloatingTabBar<Tag: Hashable & Sendable>: View {
    @Environment(\.syzygyTheme) private var theme

    private let items: [TabBarItem<Tag>]
    @Binding private var selection: Tag
    private let onSelectionChange: ((Tag) -> Void)?

    public init(
        items: [TabBarItem<Tag>],
        selection: Binding<Tag>,
        onSelectionChange: ((Tag) -> Void)? = nil
    ) {
        self.items = items
        self._selection = selection
        self.onSelectionChange = onSelectionChange
    }

    public var body: some View {
        HStack(spacing: theme.spacing.xs) {
            ForEach(items) { item in
                Button {
                    selection = item.tag
                    onSelectionChange?(item.tag)
                } label: {
                    VStack(spacing: theme.spacing.xxs) {
                        Image(systemName: item.systemImage)
                            .font(theme.typography.body)
                        Text(item.label)
                            .font(theme.typography.caption)
                    }
                    .foregroundStyle(selection == item.tag ? theme.colors.onPrimary : theme.colors.textSecondary)
                    .padding(.horizontal, theme.spacing.sm)
                    .frame(minWidth: 64, minHeight: 48)
                    .background(selection == item.tag ? theme.colors.primary : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(theme.spacing.xs)
        .background(theme.colors.surface)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.lg))
        .themedElevation(theme.elevation.md)
    }
}
