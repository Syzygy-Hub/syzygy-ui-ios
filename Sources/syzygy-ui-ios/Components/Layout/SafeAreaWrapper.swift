import SwiftUI

/// A cross-platform-shaped API for respecting safe-area insets on specific
/// edges. On iOS, SwiftUI views are already safe-area-aware by default —
/// `.ignoresSafeArea()` is what *opts out* of that behavior, so there is no
/// hard problem being solved here the way there might be on a platform
/// without built-in safe-area layout. This component's value on iOS is
/// mainly a consistent, configurable-edges API surface (matching a
/// hypothetical Android counterpart), implemented here by explicitly
/// ignoring safe areas on all edges and then re-applying padding only for
/// the edges the consumer asks for, via `GeometryReader`'s safe area insets.
@MainActor
public struct SafeAreaWrapper<Content: View>: View {
    private let edges: Set<Edge>
    private let content: Content

    public init(edges: Set<Edge> = [.top, .bottom, .leading, .trailing], @ViewBuilder content: () -> Content) {
        self.edges = edges
        self.content = content()
    }

    public var body: some View {
        GeometryReader { proxy in
            content
                .padding(.top, edges.contains(.top) ? proxy.safeAreaInsets.top : 0)
                .padding(.bottom, edges.contains(.bottom) ? proxy.safeAreaInsets.bottom : 0)
                .padding(.leading, edges.contains(.leading) ? proxy.safeAreaInsets.leading : 0)
                .padding(.trailing, edges.contains(.trailing) ? proxy.safeAreaInsets.trailing : 0)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .ignoresSafeArea()
    }
}
