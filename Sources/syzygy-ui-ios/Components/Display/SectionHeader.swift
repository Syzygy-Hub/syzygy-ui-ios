import SwiftUI

/// A section title with an optional trailing text action (e.g. "See All").
@MainActor
public struct SectionHeader: View {
    @Environment(\.syzygyTheme) private var theme

    private let title: String
    private let actionTitle: String?
    private let action: (() -> Void)?

    public init(_ title: String, actionTitle: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.actionTitle = actionTitle
        self.action = action
    }

    public var body: some View {
        HStack {
            Text(title)
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.textPrimary)

            Spacer()

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(theme.typography.subheadline)
                    .foregroundStyle(theme.colors.primary)
            }
        }
        .padding(.horizontal, theme.spacing.md)
        .frame(minHeight: 32)
        .accessibilityElement(children: .combine)
    }
}
