import SwiftUI

/// A scrollable container with native pull-to-refresh wired to an async handler.
@MainActor
public struct PullToRefresh<Content: View>: View {
    private let content: Content
    private let onRefresh: () async -> Void

    public init(onRefresh: @escaping () async -> Void, @ViewBuilder content: () -> Content) {
        self.onRefresh = onRefresh
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            content
        }
        .refreshable {
            await onRefresh()
        }
    }
}
