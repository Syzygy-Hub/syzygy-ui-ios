import SwiftUI

private let errorIconSize: CGFloat = 40

/// An icon, title, subtitle, and retry action for error states.
/// Mirrors `EmptyStateView`'s structure with a destructive-tinted icon
/// and a mandatory retry action.
@MainActor
public struct ErrorStateView: View {
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
        VStack(spacing: UISpacing.md) {
            Image(systemName: systemImage)
                .font(.system(size: errorIconSize))
                .foregroundStyle(UIColorToken.destructive)

            Text(title)
                .font(UIFontToken.title)
                .foregroundStyle(UIColorToken.textPrimary)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textSecondary)
                .multilineTextAlignment(.center)

            PrimaryButton(retryTitle, action: retryAction)
                .padding(.top, UISpacing.sm)
        }
        .padding(UISpacing.xl)
        .accessibilityElement(children: .contain)
    }
}
