import SwiftUI

/// A styled, optionally-tappable row wrapper with a leading icon, title,
/// subtitle, and a trailing accessory view.
@MainActor
public struct ListRow<Accessory: View>: View {
    private let title: String
    private let subtitle: String?
    private let systemImage: String?
    private let action: (() -> Void)?
    private let accessory: Accessory

    public init(
        title: String,
        subtitle: String? = nil,
        systemImage: String? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder accessory: () -> Accessory
    ) {
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemImage
        self.action = action
        self.accessory = accessory()
    }

    public var body: some View {
        Group {
            if let action {
                Button(action: action) { rowContent }
                    .buttonStyle(.plain)
            } else {
                rowContent
            }
        }
        .accessibilityElement(children: .combine)
    }

    private var rowContent: some View {
        HStack(spacing: UISpacing.sm) {
            if let systemImage {
                Image(systemName: systemImage)
                    .foregroundStyle(UIColorToken.primary)
                    .frame(width: 24)
            }

            VStack(alignment: .leading, spacing: UISpacing.xs) {
                Text(title)
                    .font(UIFontToken.body)
                    .foregroundStyle(UIColorToken.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(UIFontToken.footnote)
                        .foregroundStyle(UIColorToken.textSecondary)
                }
            }

            Spacer()

            accessory
        }
        .padding(.horizontal, UISpacing.md)
        .frame(minHeight: 44)
        .background(UIColorToken.surface)
        .contentShape(Rectangle())
    }
}

public extension ListRow where Accessory == EmptyView {
    init(
        title: String,
        subtitle: String? = nil,
        systemImage: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.init(title: title, subtitle: subtitle, systemImage: systemImage, action: action) {
            EmptyView()
        }
    }
}
