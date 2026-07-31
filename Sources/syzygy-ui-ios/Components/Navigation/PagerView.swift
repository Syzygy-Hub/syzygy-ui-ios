import SwiftUI

/// Swipeable, paged content — e.g. onboarding screens or an image carousel.
/// Distinct from `TabBar`, which is navigation chrome; this has no chrome
/// of its own, just paged content and a binding to the current page index.
/// Tag each child view with `.tag(_:)` matching `currentPage`'s type, the
/// same way you would with a plain `TabView`.
@MainActor
public struct PagerView<Content: View>: View {
    @Binding private var currentPage: Int
    private let showsIndicators: Bool
    private let content: Content

    public init(
        currentPage: Binding<Int>,
        showsIndicators: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self._currentPage = currentPage
        self.showsIndicators = showsIndicators
        self.content = content()
    }

    public var body: some View {
        TabView(selection: $currentPage) {
            content
        }
        #if os(iOS)
        .tabViewStyle(.page(indexDisplayMode: showsIndicators ? .automatic : .never))
        .indexViewStyle(.page(backgroundDisplayMode: .automatic))
        #endif
        .accessibilityElement(children: .contain)
    }
}
