import SwiftUI

/// A transient success / warning / error toast.
public enum ToastStyle {
    case success
    case warning
    case error

    var color: Color {
        switch self {
        case .success: UIColorToken.success
        case .warning: UIColorToken.warning
        case .error: UIColorToken.destructive
        }
    }

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
    private let message: String
    private let style: ToastStyle

    public init(message: String, style: ToastStyle) {
        self.message = message
        self.style = style
    }

    public var body: some View {
        HStack(spacing: UISpacing.sm) {
            Image(systemName: style.systemImage)
                .foregroundStyle(style.color)

            Text(message)
                .font(UIFontToken.subheadline)
                .foregroundStyle(UIColorToken.textPrimary)
        }
        .padding(.horizontal, UISpacing.md)
        .frame(minHeight: 44)
        .background(UIColorToken.surface)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
        .shadow(radius: 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message)
    }
}
