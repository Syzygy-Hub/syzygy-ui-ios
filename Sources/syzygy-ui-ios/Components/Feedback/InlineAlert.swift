import SwiftUI

/// An inline status banner (also known as a "Banner" in some design systems)
/// with 4 variants, each drawn from the corresponding *Muted color tokens.
@MainActor
public struct InlineAlert: View {
    public enum Variant {
        case info
        case success
        case warning
        case error

        var background: Color {
            switch self {
            case .info: UIColorToken.primaryMuted
            case .success: UIColorToken.successMuted
            case .warning: UIColorToken.warningMuted
            case .error: UIColorToken.destructiveMuted
            }
        }

        var foreground: Color {
            switch self {
            case .info: UIColorToken.primary
            case .success: UIColorToken.success
            case .warning: UIColorToken.warning
            case .error: UIColorToken.destructive
            }
        }

        var systemImage: String {
            switch self {
            case .info: "info.circle.fill"
            case .success: "checkmark.circle.fill"
            case .warning: "exclamationmark.triangle.fill"
            case .error: "xmark.circle.fill"
            }
        }
    }

    private let message: String
    private let variant: Variant

    public init(message: String, variant: Variant) {
        self.message = message
        self.variant = variant
    }

    public var body: some View {
        HStack(alignment: .top, spacing: UISpacing.sm) {
            Image(systemName: variant.systemImage)
                .foregroundStyle(variant.foreground)

            Text(message)
                .font(UIFontToken.subheadline)
                .foregroundStyle(variant.foreground)
        }
        .padding(UISpacing.sm)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(variant.background)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.sm))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message)
    }
}
