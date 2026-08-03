import SwiftUI

/// A header that sticks to the top of a scroll container while `content`
/// scrolls beneath it, using `LazyVStack` with pinned section headers.
@MainActor
public struct StickyHeader<Header: View, Content: View>: View {
    private let header: Header
    private let content: Content

    public init(@ViewBuilder header: () -> Header, @ViewBuilder content: () -> Content) {
        self.header = header()
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section {
                    content
                } header: {
                    header
                        .background(UIColorToken.surface)
                }
            }
        }
    }
}
