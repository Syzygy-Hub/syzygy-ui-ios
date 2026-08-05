import SwiftUI

/// A labeled slider with a live value readout. Named `SliderInput` to avoid
/// colliding with `SwiftUI.Slider` and UIKit's `UISlider`.
@MainActor
public struct SliderInput: View {
    @Environment(\.syzygyTheme) private var theme

    private let label: String
    @Binding private var value: Double
    private let range: ClosedRange<Double>
    private let step: Double?

    public init(
        label: String,
        value: Binding<Double>,
        range: ClosedRange<Double> = 0...1,
        step: Double? = nil
    ) {
        self.label = label
        self._value = value
        self.range = range
        self.step = step
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            HStack {
                Text(label)
                    .font(theme.typography.subheadline)
                    .foregroundStyle(theme.colors.textSecondary)

                Spacer()

                Text(value.formatted())
                    .font(theme.typography.subheadline)
                    .foregroundStyle(theme.colors.textSecondary)
            }

            Group {
                if let step {
                    Slider(value: $value, in: range, step: step)
                } else {
                    Slider(value: $value, in: range)
                }
            }
            .tint(theme.colors.primary)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(label)
        .accessibilityValue(value.formatted())
    }
}
