import SwiftUI

/// A floating pill-style tab bar showing icon AND label per item. This fills
/// the remaining slot in the {edge-to-edge, floating} x {icon-only,
/// icon+label} matrix: `TabBar` is edge-to-edge + labeled, and
/// `BottomNavigationBar` is floating + icon-only, so `FloatingTabBar` is
/// floating + labeled — distinct from both.
@MainActor
public struct FloatingTabBar<Tag: Hashable & Sendable>: View {
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
        HStack(spacing: UISpacing.xs) {
            ForEach(items) { item in
                Button {
                    selection = item.tag
                    onSelectionChange?(item.tag)
                } label: {
                    VStack(spacing: UISpacing.xxs) {
                        Image(systemName: item.systemImage)
                            .font(UIFontToken.body)
                        Text(item.label)
                            .font(UIFontToken.caption)
                    }
                    .foregroundStyle(selection == item.tag ? UIColorToken.onPrimary : UIColorToken.textSecondary)
                    .padding(.horizontal, UISpacing.sm)
                    .frame(minWidth: 64, minHeight: 48)
                    .background(selection == item.tag ? UIColorToken.primary : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(UISpacing.xs)
        .background(UIColorToken.surface)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.lg))
        .elevation(UIElevation.md)
    }
}
