import SwiftUI

/// An edge-to-edge, icon-and-label tab bar, styled like the system tab bar
/// but fully token-driven.
@MainActor
public struct TabBar<Tag: Hashable & Sendable>: View {
    @Environment(\.syzygyTheme) private var theme

    private let items: [TabBarItem<Tag>]
    @Binding private var selection: Tag

    public init(items: [TabBarItem<Tag>], selection: Binding<Tag>) {
        self.items = items
        self._selection = selection
    }

    public var body: some View {
        HStack {
            ForEach(items) { item in
                Button {
                    selection = item.tag
                } label: {
                    VStack(spacing: theme.spacing.xs / 2) {
                        Image(systemName: item.systemImage)
                            .font(theme.typography.body)
                        Text(item.label)
                            .font(theme.typography.caption)
                    }
                    .foregroundStyle(selection == item.tag ? theme.colors.primary : theme.colors.textSecondary)
                    .frame(maxWidth: .infinity, minHeight: 44)
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(.top, theme.spacing.xs)
        .background(theme.colors.surface)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(theme.colors.border)
                .frame(height: 1)
        }
    }
}
