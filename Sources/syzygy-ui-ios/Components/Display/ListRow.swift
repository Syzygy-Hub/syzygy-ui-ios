import SwiftUI

/// A styled, optionally-tappable row wrapper with a leading icon, title,
/// subtitle, and a trailing accessory view.
@MainActor
public struct ListRow<Accessory: View>: View {
    @Environment(\.syzygyTheme) private var theme

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
        HStack(spacing: theme.spacing.sm) {
            if let systemImage {
                Image(systemName: systemImage)
                    .foregroundStyle(theme.colors.primary)
                    .frame(width: 24)
            }

            VStack(alignment: .leading, spacing: theme.spacing.xs) {
                Text(title)
                    .font(theme.typography.body)
                    .foregroundStyle(theme.colors.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(theme.typography.footnote)
                        .foregroundStyle(theme.colors.textSecondary)
                }
            }

            Spacer()

            accessory
        }
        .padding(.horizontal, theme.spacing.md)
        .frame(minHeight: 44)
        .background(theme.colors.surface)
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
