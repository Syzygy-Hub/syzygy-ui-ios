import SwiftUI

/// A circle or square swatch displaying a single `Color`, with an optional
/// label beneath and a selected-state border using the `focus` token.
@MainActor
public struct ColorSwatch: View {
    @Environment(\.syzygyTheme) private var theme

    public enum Shape {
        case circle
        case square
    }

    private let color: Color
    private let label: String?
    private let shape: Shape
    private let isSelected: Bool
    private let size: CGFloat

    public init(
        color: Color,
        label: String? = nil,
        shape: Shape = .circle,
        isSelected: Bool = false,
        size: CGFloat = 32
    ) {
        self.color = color
        self.label = label
        self.shape = shape
        self.isSelected = isSelected
        self.size = size
    }

    public var body: some View {
        VStack(spacing: theme.spacing.xs) {
            swatch
                .frame(width: size, height: size)
                .overlay(border)

            if let label {
                Text(label)
                    .font(theme.typography.caption)
                    .foregroundStyle(theme.colors.textSecondary)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label ?? "Color swatch")
        .accessibilityAddTraits(isSelected ? [.isSelected] : [])
    }

    @ViewBuilder
    private var swatch: some View {
        switch shape {
        case .circle:
            Circle().fill(color)
        case .square:
            RoundedRectangle(cornerRadius: theme.radius.xs).fill(color)
        }
    }

    @ViewBuilder
    private var border: some View {
        if isSelected {
            switch shape {
            case .circle:
                Circle().stroke(theme.colors.focus, lineWidth: UIBorderWidth.thick)
            case .square:
                RoundedRectangle(cornerRadius: theme.radius.xs)
                    .stroke(theme.colors.focus, lineWidth: UIBorderWidth.thick)
            }
        }
    }
}
