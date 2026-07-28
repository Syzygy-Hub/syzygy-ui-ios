import SwiftUI

/// An icon, title, subtitle, and optional call-to-action for empty states.
@MainActor
public struct EmptyStateView: View {
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
        VStack(spacing: UISpacing.md) {
            Image(systemName: systemImage)
                .font(.system(size: 40))
                .foregroundStyle(UIColorToken.textSecondary)

            Text(title)
                .font(UIFontToken.title)
                .foregroundStyle(UIColorToken.textPrimary)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(UIFontToken.body)
                .foregroundStyle(UIColorToken.textSecondary)
                .multilineTextAlignment(.center)

            if let ctaTitle, let ctaAction {
                PrimaryButton(ctaTitle, action: ctaAction)
                    .padding(.top, UISpacing.sm)
            }
        }
        .padding(UISpacing.xl)
        .accessibilityElement(children: .contain)
    }
}
