import SwiftUI

/// A small numeric/dot badge meant to overlay an icon (e.g. a bell with an
/// unread count). Distinct from `Badge`, which is a standalone labeled pill.
@MainActor
public struct CountBadge: View {
    @Environment(\.syzygyTheme) private var theme

    private let count: Int?
    private let maxDisplayCount: Int

    public init(count: Int? = nil, maxDisplayCount: Int = 99) {
        self.count = count
        self.maxDisplayCount = maxDisplayCount
    }

    public var body: some View {
        Group {
            if let count, count > 0 {
                Text(displayText(for: count))
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.onPrimary)
                    .padding(.horizontal, count > 9 ? theme.spacing.xs : 0)
                    .frame(minWidth: 16, minHeight: 16)
                    .background(theme.colors.destructive)
                    .clipShape(Capsule())
            } else {
                Circle()
                    .fill(theme.colors.destructive)
                    .frame(width: 10, height: 10)
            }
        }
        .accessibilityLabel(count.map { "\($0) unread" } ?? "New")
    }

    private func displayText(for count: Int) -> String {
        count > maxDisplayCount ? "\(maxDisplayCount)+" : "\(count)"
    }
}
