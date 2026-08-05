import SwiftUI

/// A vertical list of events (also known as an "ActivityFeed"), each with a
/// dot/icon on a connecting vertical line, a title, optional subtitle, and
/// optional timestamp. The connecting line is drawn with simple fixed-height
/// `Rectangle()` segments between dots rather than a custom `Layout` —
/// simpler to reason about and sufficient since rows lay out top-to-bottom
/// with no reordering; a custom `Layout` would only pay off if segments
/// needed to span variable-height content precisely.
public enum TimelineItemAlignment {
    case leading
    case trailing
}

@MainActor
public struct TimelineItem: Identifiable {
    public let id = UUID()
    public let title: String
    public let subtitle: String?
    public let timestamp: String?
    public let systemImage: String

    public init(title: String, subtitle: String? = nil, timestamp: String? = nil, systemImage: String = "circle.fill") {
        self.title = title
        self.subtitle = subtitle
        self.timestamp = timestamp
        self.systemImage = systemImage
    }
}

@MainActor
public struct Timeline: View {
    @Environment(\.syzygyTheme) private var theme

    private let items: [TimelineItem]
    private let alignment: TimelineItemAlignment

    public init(items: [TimelineItem], alignment: TimelineItemAlignment = .leading) {
        self.items = items
        self.alignment = alignment
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                row(item, isLast: index == items.count - 1)
            }
        }
    }

    private func row(_ item: TimelineItem, isLast: Bool) -> some View {
        let dot = VStack(spacing: 0) {
            Image(systemName: item.systemImage)
                .font(.system(size: UIIconSize.sm))
                .foregroundStyle(theme.colors.primary)
                .frame(width: UIIconSize.md, height: UIIconSize.md)

            if !isLast {
                Rectangle()
                    .fill(theme.colors.border)
                    .frame(width: 2)
                    .frame(minHeight: theme.spacing.xl)
            }
        }

        let text = VStack(alignment: alignment == .leading ? .leading : .trailing, spacing: theme.spacing.xxs) {
            Text(item.title)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textPrimary)

            if let subtitle = item.subtitle {
                Text(subtitle)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.textSecondary)
            }

            if let timestamp = item.timestamp {
                Text(timestamp)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.textTertiary)
            }
        }
        .padding(.bottom, theme.spacing.md)

        return HStack(alignment: .top, spacing: theme.spacing.sm) {
            if alignment == .leading {
                dot
                text
                Spacer(minLength: 0)
            } else {
                Spacer(minLength: 0)
                text
                dot
            }
        }
        .accessibilityElement(children: .combine)
    }
}
