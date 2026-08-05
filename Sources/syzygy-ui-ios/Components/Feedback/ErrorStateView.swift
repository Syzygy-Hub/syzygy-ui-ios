import SwiftUI

private let errorIconSize: CGFloat = 40

/// An icon, title, subtitle, and retry action for error states.
/// Mirrors `EmptyStateView`'s structure with a destructive-tinted icon
/// and a mandatory retry action.
@MainActor
public struct ErrorStateView: View {
    @Environment(\.syzygyTheme) private var theme

    private let systemImage: String
    private let title: String
    private let subtitle: String
    private let retryTitle: String
    private let retryAction: () -> Void

    public init(
        systemImage: String = "exclamationmark.triangle",
        title: String,
        subtitle: String,
        retryTitle: String = "Retry",
        retryAction: @escaping () -> Void
    ) {
        self.systemImage = systemImage
        self.title = title
        self.subtitle = subtitle
        self.retryTitle = retryTitle
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack(spacing: theme.spacing.md) {
            Image(systemName: systemImage)
                .font(.system(size: errorIconSize))
                .foregroundStyle(theme.colors.destructive)

            Text(title)
                .font(theme.typography.title)
                .foregroundStyle(theme.colors.textPrimary)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(theme.typography.body)
                .foregroundStyle(theme.colors.textSecondary)
                .multilineTextAlignment(.center)

            PrimaryButton(retryTitle, action: retryAction)
                .padding(.top, theme.spacing.sm)
        }
        .padding(theme.spacing.xl)
        .accessibilityElement(children: .contain)
    }
}
