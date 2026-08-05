import SwiftUI

/// A horizontal `DividerLine`-based rule with a centered text label breaking
/// the line (e.g. "OR"), built from two `DividerLine` segments flanking the
/// label — sized asymmetrically per `alignment` so the label sits leading,
/// centered, or trailing along the line.
@MainActor
public struct LabeledDivider: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    private let alignment: HorizontalAlignment

    public init(_ label: String, alignment: HorizontalAlignment = .center) {
        self.label = label
        self.alignment = alignment
    }

    public var body: some View {
        HStack(spacing: theme.spacing.sm) {
            if alignment != .leading {
                DividerLine()
            }

            Text(label)
                .font(theme.typography.caption)
                .foregroundStyle(theme.colors.textSecondary)
                .fixedSize()

            if alignment != .trailing {
                DividerLine()
            }
        }
        .accessibilityElement(children: .combine)
    }
}
