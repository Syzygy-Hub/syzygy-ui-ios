import SwiftUI

/// An expandable/collapsible section (accordion) with a tappable header and
/// animated disclosure of its content.
@MainActor
public struct CollapsibleView<Content: View>: View {
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
                        .font(UIFontToken.headline)
                        .foregroundStyle(UIColorToken.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundStyle(UIColorToken.textSecondary)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
                .padding(.horizontal, UISpacing.md)
                .frame(minHeight: 44)
            }
            .accessibilityLabel(title)
            .accessibilityAddTraits(.isButton)
            .accessibilityValue(isExpanded ? "Expanded" : "Collapsed")

            if isExpanded {
                content
                    .padding(.horizontal, UISpacing.md)
                    .padding(.bottom, UISpacing.md)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(UIColorToken.surface)
        .clipShape(RoundedRectangle(cornerRadius: UIRadius.md))
    }
}
