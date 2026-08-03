import SwiftUI

/// A card showing a label, a large value, and an optional trend indicator.
/// Also known as `MetricCard` in some design systems.
@MainActor
public struct StatsCard: View {
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

        var color: Color {
            switch self {
            case .up: UIColorToken.success
            case .down: UIColorToken.destructive
            case .neutral: UIColorToken.textSecondary
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
        VStack(alignment: .leading, spacing: UISpacing.xs) {
            Text(label)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textSecondary)

            Text(value)
                .font(UIFontToken.title)
                .foregroundStyle(UIColorToken.textPrimary)

            if let trend, let trendValue {
                HStack(spacing: UISpacing.xxs) {
                    Image(systemName: trend.systemImage)
                    Text(trendValue)
                }
                .font(UIFontToken.caption)
                .foregroundStyle(trend.color)
            }
        }
        .padding(UISpacing.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(UIColorToken.surface)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .elevation(UIElevation.sm)
        .accessibilityElement(children: .combine)
    }
}
