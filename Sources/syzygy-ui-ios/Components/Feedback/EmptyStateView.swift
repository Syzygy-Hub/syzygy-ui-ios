import SwiftUI

/// An icon, title, subtitle, and optional call-to-action for empty states.
@MainActor
public struct EmptyStateView: View {
    @Environment(\.syzygyTheme) private var theme

    private let systemImage: String
    private let title: String
    private let subtitle: String
    private let ctaTitle: String?
    private let ctaAction: (() -> Void)?

    public init(
        systemImage: String,
        title: String,
        subtitle: String,
        ctaTitle: String? = nil,
        ctaAction: (() -> Void)? = nil
    ) {
        self.systemImage = systemImage
        self.title = title
        self.subtitle = subtitle
        self.ctaTitle = ctaTitle
        self.ctaAction = ctaAction
    }

    public var body: some View {
        VStack(spacing: theme.spacing.md) {
            Image(systemName: systemImage)
                .font(.system(size: 40))
                .foregroundStyle(theme.colors.textSecondary)

            Text(title)
                .font(theme.typography.title)
                .foregroundStyle(theme.colors.textPrimary)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textSecondary)
                .multilineTextAlignment(.center)

            if let ctaTitle, let ctaAction {
                PrimaryButton(ctaTitle, action: ctaAction)
                    .padding(.top, theme.spacing.sm)
            }
        }
        .padding(theme.spacing.xl)
        .accessibilityElement(children: .contain)
    }
}
