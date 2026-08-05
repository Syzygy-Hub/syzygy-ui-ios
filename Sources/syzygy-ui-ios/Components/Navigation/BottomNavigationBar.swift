import SwiftUI

/// A floating, icon-only bottom navigation pill — a visual alternative to
/// `TabBar` for screens that want a compact, inset navigation surface.
@MainActor
public struct BottomNavigationBar<Tag: Hashable & Sendable>: View {
    @Environment(\.syzygyTheme) private var theme

    private let items: [TabBarItem<Tag>]
    @Binding private var selection: Tag

    public init(items: [TabBarItem<Tag>], selection: Binding<Tag>) {
        self.items = items
        self._selection = selection
    }

    public var body: some View {
        HStack(spacing: theme.spacing.xs) {
            ForEach(items) { item in
                Button {
                    selection = item.tag
                } label: {
                    Image(systemName: item.systemImage)
                        .font(theme.typography.body)
                        .foregroundStyle(
                            selection == item.tag ? theme.colors.onPrimary : theme.colors.textSecondary
                        )
                        .frame(width: 44, height: 44)
                        .background(selection == item.tag ? theme.colors.primary : Color.clear)
                        .clipShape(Circle())
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(.horizontal, theme.spacing.sm)
        .padding(.vertical, theme.spacing.xs)
        .background(theme.colors.surface)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 2)
    }
}
