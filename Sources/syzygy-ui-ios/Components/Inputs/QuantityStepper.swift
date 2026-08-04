import SwiftUI

/// A +/- quantity control. Named `QuantityStepper` (rather than `Stepper`)
/// to avoid colliding with `SwiftUI.Stepper`, the same pattern used by
/// `SliderInput`/`DividerLine` elsewhere in this library.
@MainActor
public struct QuantityStepper: View {
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
                    .font(UIFontToken.body)
                    .foregroundStyle(value <= range.lowerBound ? UIColorToken.textSecondary : UIColorToken.primary)
                    .frame(width: 44, height: 44)
            }
            .disabled(value <= range.lowerBound)
            .accessibilityLabel("Decrease")

            Text("\(value)")
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textPrimary)
                .frame(minWidth: 32)
                .accessibilityHidden(true)

            Button {
                value = min(range.upperBound, value + step)
            } label: {
                Image(systemName: "plus")
                    .font(UIFontToken.body)
                    .foregroundStyle(value >= range.upperBound ? UIColorToken.textSecondary : UIColorToken.primary)
                    .frame(width: 44, height: 44)
            }
            .disabled(value >= range.upperBound)
            .accessibilityLabel("Increase")
        }
        .background(UIColorToken.surface)
        .overlay(
            RoundedRectangle(cornerRadius: UIRadius.sm)
                .stroke(UIColorToken.border, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
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
