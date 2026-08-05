import SwiftUI

/// A card showing a label, a large value, and an optional trend indicator.
/// Also known as `MetricCard` in some design systems.
@MainActor
public struct StatsCard: View {
    @Environment(\.syzygyTheme) private var theme

    public enum Trend {
        case up
        case down
        case neutral

        var systemImage: String {
            switch self {
            case .up: "arrow.up.right"
            case .down: "arrow.down.right"
            case .neutral: "arrow.right"
            }
        }

    }

    private let label: String
    private let value: String
    private let trend: Trend?
    private let trendValue: String?

    public init(label: String, value: String, trend: Trend? = nil, trendValue: String? = nil) {
        self.label = label
        self.value = value
        self.trend = trend
        self.trendValue = trendValue
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text(label)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textSecondary)

            Text(value)
                .font(theme.typography.title)
                .foregroundStyle(theme.colors.textPrimary)

            if let trend, let trendValue {
                HStack(spacing: theme.spacing.xxs) {
                    Image(systemName: trend.systemImage)
                    Text(trendValue)
                }
                .font(theme.typography.caption)
                .foregroundStyle(trendColor(trend))
            }
        }
        .padding(theme.spacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(theme.colors.surface)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
        .themedElevation(theme.elevation.sm)
        .accessibilityElement(children: .combine)
    }

    private func trendColor(_ trend: Trend) -> Color {
        switch trend {
        case .up: theme.colors.success
        case .down: theme.colors.destructive
        case .neutral: theme.colors.textSecondary
        }
    }
}
