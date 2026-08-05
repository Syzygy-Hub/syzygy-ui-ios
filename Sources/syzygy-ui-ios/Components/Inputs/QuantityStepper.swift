import SwiftUI

/// A +/- quantity control. Named `QuantityStepper` (rather than `Stepper`)
/// to avoid colliding with `SwiftUI.Stepper`, the same pattern used by
/// `SliderInput`/`DividerLine` elsewhere in this library.
@MainActor
public struct QuantityStepper: View {
    @Environment(\.syzygyTheme) private var theme

    @Binding private var value: Int
    private let range: ClosedRange<Int>
    private let step: Int

    public init(value: Binding<Int>, range: ClosedRange<Int> = 0...99, step: Int = 1) {
        self._value = value
        self.range = range
        self.step = step
    }

    public var body: some View {
        HStack(spacing: 0) {
            Button {
                value = max(range.lowerBound, value - step)
            } label: {
                Image(systemName: "minus")
                    .font(theme.typography.body)
                    .foregroundStyle(value <= range.lowerBound ? theme.colors.textSecondary : theme.colors.primary)
                    .frame(width: 44, height: 44)
            }
            .disabled(value <= range.lowerBound)
            .accessibilityLabel("Decrease")

            Text("\(value)")
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textPrimary)
                .frame(minWidth: 32)
                .accessibilityHidden(true)

            Button {
                value = min(range.upperBound, value + step)
            } label: {
                Image(systemName: "plus")
                    .font(theme.typography.body)
                    .foregroundStyle(value >= range.upperBound ? theme.colors.textSecondary : theme.colors.primary)
                    .frame(width: 44, height: 44)
            }
            .disabled(value >= range.upperBound)
            .accessibilityLabel("Increase")
        }
        .background(theme.colors.surface)
        .overlay(
            RoundedRectangle(cornerRadius: theme.radius.sm)
                .stroke(theme.colors.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Quantity")
        .accessibilityValue("\(value)")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment: value = min(range.upperBound, value + step)
            case .decrement: value = max(range.lowerBound, value - step)
            @unknown default: break
            }
        }
    }
}
