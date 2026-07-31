import SwiftUI

/// A section title with an optional trailing text action (e.g. "See All").
@MainActor
public struct SectionHeader: View {
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
                .font(UIFontToken.headline)
                .foregroundStyle(UIColorToken.textPrimary)

            Spacer()

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(UIFontToken.subheadline)
                    .foregroundStyle(UIColorToken.primary)
            }
        }
        .padding(.horizontal, UISpacing.md)
        .frame(minHeight: 32)
        .accessibilityElement(children: .combine)
    }
}
