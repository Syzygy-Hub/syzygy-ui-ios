import SwiftUI

/// A horizontal `DividerView`-based rule with a centered text label breaking
/// the line (e.g. "OR"), built from two `DividerView` segments flanking the
/// label — sized asymmetrically per `alignment` so the label sits leading,
/// centered, or trailing along the line.
@MainActor
public struct LabeledDivider: View {
    private let label: String
    private let alignment: HorizontalAlignment

    public init(_ label: String, alignment: HorizontalAlignment = .center) {
        self.label = label
        self.alignment = alignment
    }

    public var body: some View {
        HStack(spacing: UISpacing.sm) {
            if alignment != .leading {
                DividerView()
            }

            Text(label)
                .font(UIFontToken.caption)
                .foregroundStyle(UIColorToken.textSecondary)
                .fixedSize()

            if alignment != .trailing {
                DividerView()
            }
        }
        .accessibilityElement(children: .combine)
    }
}
