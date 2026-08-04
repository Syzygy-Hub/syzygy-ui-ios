import SwiftUI

/// A floating, icon-only bottom navigation pill — a visual alternative to
/// `TabBar` for screens that want a compact, inset navigation surface.
@MainActor
public struct BottomNavigationBar<Tag: Hashable & Sendable>: View {
    private let items: [TabBarItem<Tag>]
    @Binding private var selection: Tag

    public init(items: [TabBarItem<Tag>], selection: Binding<Tag>) {
        self.items = items
        self._selection = selection
    }

    public var body: some View {
        HStack(spacing: UISpacing.xs) {
            ForEach(items) { item in
                Button {
                    selection = item.tag
                } label: {
                    Image(systemName: item.systemImage)
                        .font(UIFontToken.body)
                        .foregroundStyle(
                            selection == item.tag ? UIColorToken.onPrimary : UIColorToken.textSecondary
                        )
                        .frame(width: 44, height: 44)
                        .background(selection == item.tag ? UIColorToken.primary : Color.clear)
                        .clipShape(Circle())
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(.horizontal, UISpacing.sm)
        .padding(.vertical, UISpacing.xs)
        .background(UIColorToken.surface)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 2)
    }
}
