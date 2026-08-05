import SwiftUI

/// A top navigation bar with a centered title and optional leading/trailing
/// accessory views.
@MainActor
public struct AppBar<Leading: View, Trailing: View>: View {
    @Environment(\.syzygyTheme) private var theme

    private let title: String
    private let leading: Leading
    private let trailing: Trailing

    public init(
        title: String,
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.title = title
        self.leading = leading()
        self.trailing = trailing()
    }

    public var body: some View {
        HStack {
            leading

            Text(title)
                .font(theme.typography.headline)
                .foregroundStyle(theme.colors.textPrimary)
                .frame(maxWidth: .infinity)

            trailing
        }
        .padding(.horizontal, theme.spacing.sm)
        .frame(minHeight: 44)
        .background(theme.colors.surface)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(theme.colors.border)
                .frame(height: 1)
        }
        .accessibilityElement(children: .contain)
        .accessibilityAddTraits(.isHeader)
    }
}

public extension AppBar where Leading == EmptyView, Trailing == EmptyView {
    init(title: String) {
        self.init(title: title, leading: { EmptyView() }, trailing: { EmptyView() })
    }
}

public extension AppBar where Trailing == EmptyView {
    init(title: String, @ViewBuilder leading: () -> Leading) {
        self.init(title: title, leading: leading, trailing: { EmptyView() })
    }
}

public extension AppBar where Leading == EmptyView {
    init(title: String, @ViewBuilder trailing: () -> Trailing) {
        self.init(title: title, leading: { EmptyView() }, trailing: trailing)
    }
}
