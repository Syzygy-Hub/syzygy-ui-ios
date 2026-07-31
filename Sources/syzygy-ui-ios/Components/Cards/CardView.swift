import SwiftUI

/// A generic card container with a token-driven shadow and corner radius.
@MainActor
public struct CardView<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(UISpacing.md)
            .background(UIColorToken.surface)
            .clipShape(RoundedRectangle(cornerRadius: UIRadius.lg))
            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}
