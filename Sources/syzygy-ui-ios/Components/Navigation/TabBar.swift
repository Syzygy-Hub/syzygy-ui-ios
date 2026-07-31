import SwiftUI

/// An edge-to-edge, icon-and-label tab bar, styled like the system tab bar
/// but fully token-driven.
@MainActor
public struct TabBar<Tag: Hashable & Sendable>: View {
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
                    VStack(spacing: UISpacing.xs / 2) {
                        Image(systemName: item.systemImage)
                            .font(UIFontToken.body)
                        Text(item.label)
                            .font(UIFontToken.caption)
                    }
                    .foregroundStyle(selection == item.tag ? UIColorToken.primary : UIColorToken.textSecondary)
                    .frame(maxWidth: .infinity, minHeight: 44)
                }
                .accessibilityLabel(item.label)
                .accessibilityAddTraits(selection == item.tag ? [.isSelected] : [])
            }
        }
        .padding(.top, UISpacing.xs)
        .background(UIColorToken.surface)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(UIColorToken.border)
                .frame(height: 1)
        }
    }
}
