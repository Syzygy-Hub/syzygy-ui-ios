import SwiftUI

/// A transient success / warning / error toast.
public enum ToastVariant {
    case success
    case warning
    case error

    var systemImage: String {
        switch self {
        case .success: "checkmark.circle.fill"
        case .warning: "exclamationmark.triangle.fill"
        case .error: "xmark.circle.fill"
        }
    }
}

@MainActor
public struct ToastView: View {
    @Environment(\.syzygyTheme) private var theme

    private let message: String
    private let variant: ToastVariant

    public init(message: String, variant: ToastVariant) {
        self.message = message
        self.variant = variant
    }

    public var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Image(systemName: variant.systemImage)
                .foregroundStyle(variantColor)

            Text(message)
                .font(theme.typography.subheadline)
                .foregroundStyle(theme.colors.textPrimary)
        }
        .padding(.horizontal, theme.spacing.md)
        .frame(minHeight: 44)
        .background(theme.colors.surface)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
        .shadow(radius: 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message)
    }

    private var variantColor: Color {
        switch variant {
        case .success: theme.colors.success
        case .warning: theme.colors.warning
        case .error: theme.colors.destructive
        }
    }
}
