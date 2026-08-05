import SwiftUI

/// A horizontal trail of tappable navigation labels separated by a
/// separator glyph.
@MainActor
public struct Breadcrumbs: View {
    @Environment(\.syzygyTheme) private var theme

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
        HStack(spacing: theme.spacing.xs) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                Button(action: item.action) {
                    Text(item.label)
                        .font(theme.typography.subheadline)
                        .foregroundStyle(index == items.count - 1 ? theme.colors.textPrimary : theme.colors.link)
                }
                .disabled(index == items.count - 1)

                if index < items.count - 1 {
                    Text("›")
                        .font(theme.typography.subheadline)
                        .foregroundStyle(theme.colors.separator)
                }
            }
        }
        .accessibilityElement(children: .contain)
    }
}
