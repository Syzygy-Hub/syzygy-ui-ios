import SwiftUI

/// A circle or square swatch displaying a single `Color`, with an optional
/// label beneath and a selected-state border using the `focus` token.
@MainActor
public struct ColorSwatch: View {
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
        VStack(spacing: UISpacing.xs) {
            swatch
                .frame(width: size, height: size)
                .overlay(border)

            if let label {
                Text(label)
                    .font(UIFontToken.caption)
                    .foregroundStyle(UIColorToken.textSecondary)
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
            RoundedRectangle(cornerRadius: UIRadius.xs).fill(color)
        }
    }

    @ViewBuilder
    private var border: some View {
        if isSelected {
            switch shape {
            case .circle:
                Circle().stroke(UIColorToken.focus, lineWidth: UIBorderWidth.thick)
            case .square:
                RoundedRectangle(cornerRadius: UIRadius.xs).stroke(UIColorToken.focus, lineWidth: UIBorderWidth.thick)
            }
        }
    }
}
