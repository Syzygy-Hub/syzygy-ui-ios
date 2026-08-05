import SwiftUI

/// An expandable/collapsible section (accordion) with a tappable header and
/// animated disclosure of its content.
@MainActor
public struct CollapsibleView<Content: View>: View {
    @Environment(\.syzygyTheme) private var theme

    private let title: String
    private let content: Content

    @State private var isExpanded: Bool

    public init(title: String, initiallyExpanded: Bool = false, @ViewBuilder content: () -> Content) {
        self.title = title
        self._isExpanded = State(initialValue: initiallyExpanded)
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(title)
                        .font(theme.typography.headline)
                        .foregroundStyle(theme.colors.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundStyle(theme.colors.textSecondary)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .padding(.horizontal, theme.spacing.md)
                .frame(minHeight: 44)
            }
            .accessibilityLabel(title)
            .accessibilityAddTraits(.isButton)
            .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")

            if isExpanded {
                content
                    .padding(.horizontal, theme.spacing.md)
                    .padding(.bottom, theme.spacing.md)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(theme.colors.surface)
        .clipShape(RoundedRectangle(cornerRadius: theme.radius.md))
    }
}
