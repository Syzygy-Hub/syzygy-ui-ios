import SwiftUI

/// A horizontal step-progress indicator (also known as "WizardSteps"),
/// showing completed / active / pending states connected by lines.
@MainActor
public struct StepIndicator: View {
    @Environment(\.syzygyTheme) private var theme

    private let steps: [String]
    private let currentStep: Int

    public init(steps: [String], currentStep: Int) {
        self.steps = steps
        self.currentStep = currentStep
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, label in
                VStack(spacing: theme.spacing.xs) {
                    indicator(for: index)
                    Text(label)
                        .font(theme.typography.caption)
                        .foregroundStyle(index == currentStep ? theme.colors.textPrimary : theme.colors.textSecondary)
                        .lineLimit(1)
                }

                if index < steps.count - 1 {
                    Rectangle()
                        .fill(index < currentStep ? theme.colors.primary : theme.colors.border)
                        .frame(height: UIBorderWidth.thick)
                        .offset(y: -14)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Step \(currentStep + 1) of \(steps.count)")
    }

    @ViewBuilder
    private func indicator(for index: Int) -> some View {
        if index < currentStep {
            Circle()
                .fill(theme.colors.primary)
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.caption2)
                        .foregroundStyle(theme.colors.onPrimary)
                )
                .frame(width: 24, height: 24)
        } else if index == currentStep {
            Circle()
                .stroke(theme.colors.primary, lineWidth: UIBorderWidth.thick)
                .background(Circle().fill(theme.colors.surface))
                .frame(width: 24, height: 24)
        } else {
            Circle()
                .fill(theme.colors.surfaceSecondary)
                .frame(width: 8, height: 8)
                .frame(width: 24, height: 24)
        }
    }
}
