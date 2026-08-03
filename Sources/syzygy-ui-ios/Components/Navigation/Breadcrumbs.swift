import SwiftUI

/// A horizontal trail of tappable navigation labels separated by a
/// separator glyph.
@MainActor
public struct Breadcrumbs: View {
    public struct Item: Identifiable {
        public let id = UUID()
        public let label: String
        public let action: () -> Void

        public init(label: String, action: @escaping () -> Void) {
            self.label = label
            self.action = action
        }
    }

    private let items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public var body: some View {
        HStack(spacing: UISpacing.xs) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                Button(action: item.action) {
                    Text(item.label)
                        .font(UIFontToken.subheadline)
                        .foregroundStyle(index == items.count - 1 ? UIColorToken.textPrimary : UIColorToken.link)
                }
                .disabled(index == items.count - 1)

                if index < items.count - 1 {
                    Text("›")
                        .font(UIFontToken.subheadline)
                        .foregroundStyle(UIColorToken.separator)
                }
            }
        }
        .accessibilityElement(children: .contain)
    }
}
