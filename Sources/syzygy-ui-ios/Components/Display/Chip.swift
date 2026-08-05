import SwiftUI

/// A compact tag/chip with an optional trailing remove button.
@MainActor
public struct Chip: View {
    @Environment(\.syzygyTheme) private var theme

    private let text: String
    private let onRemove: (() -> Void)?

    public init(_ text: String, onRemove: (() -> Void)? = nil) {
        self.text = text
        self.onRemove = onRemove
    }

    public var body: some View {
        HStack(spacing: theme.spacing.xs) {
            Text(text)
                .font(theme.typography.caption)
                .foregroundStyle(theme.colors.textPrimary)

            if let onRemove {
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .font(theme.typography.caption)
                        .foregroundStyle(theme.colors.textSecondary)
                }
                .accessibilityLabel("Remove \(text)")
            }
        }
        .padding(.horizontal, theme.spacing.sm)
        .padding(.vertical, theme.spacing.xs)
        .background(theme.colors.surface)
        .overlay(
            Capsule()
                .stroke(theme.colors.border, lineWidth: 1)
        )
        .clipShape(Capsule())
        .accessibilityElement(children: .combine)
        .accessibilityLabel(text)
    }
}
