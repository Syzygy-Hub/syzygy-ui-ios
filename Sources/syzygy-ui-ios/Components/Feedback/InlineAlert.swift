import SwiftUI

/// An inline status banner (also known as a "Banner" in some design systems)
/// with 4 variants, each drawn from the corresponding *Muted color tokens.
@MainActor
public struct InlineAlert: View {
    @Environment(\.syzygyTheme) private var theme

    public enum Variant {
        case info
        case success
        case warning
        case error

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
        HStack(alignment: .top, spacing: theme.spacing.sm) {
            Image(systemName: variant.systemImage)
                .foregroundStyle(variantForeground)

            Text(message)
                .font(theme.typography.subheadline)
                .foregroundStyle(variantForeground)
        }
        .padding(theme.spacing.sm)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(variantBackground)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.sm))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message)
    }

    private var variantBackground: Color {
        switch variant {
        case .info: theme.colors.primaryMuted
        case .success: theme.colors.successMuted
        case .warning: theme.colors.warningMuted
        case .error: theme.colors.destructiveMuted
        }
    }

    private var variantForeground: Color {
        switch variant {
        case .info: theme.colors.primary
        case .success: theme.colors.success
        case .warning: theme.colors.warning
        case .error: theme.colors.destructive
        }
    }
}
