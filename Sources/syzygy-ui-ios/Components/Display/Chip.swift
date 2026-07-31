import SwiftUI

/// A compact tag/chip with an optional trailing remove button.
@MainActor
public struct Chip: View {
    private let text: String
    private let onRemove: (() -> Void)?

    public init(_ text: String, onRemove: (() -> Void)? = nil) {
        self.text = text
        self.onRemove = onRemove
    }

    public var body: some View {
        HStack(spacing: UISpacing.xs) {
            Text(text)
                .font(UIFontToken.caption)
                .foregroundStyle(UIColorToken.textPrimary)

            if let onRemove {
                Button(action: onRemove) {
                    Image(systemName: "xmark.circle.fill")
                        .font(UIFontToken.caption)
                        .foregroundStyle(UIColorToken.textSecondary)
                }
                .accessibilityLabel("Remove \(text)")
            }
        }
        .padding(.horizontal, UISpacing.sm)
        .padding(.vertical, UISpacing.xs)
        .background(UIColorToken.surface)
        .overlay(
            Capsule()
                .stroke(UIColorToken.border, lineWidth: 1)
        )
        .clipShape(Capsule())
        .accessibilityElement(children: .combine)
        .accessibilityLabel(text)
    }
}
