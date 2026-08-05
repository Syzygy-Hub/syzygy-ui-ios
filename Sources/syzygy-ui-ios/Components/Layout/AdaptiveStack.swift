import SwiftUI

/// A stack that lays out children horizontally when available width is at
/// or above `breakpoint`, and vertically below it.
@MainActor
public struct AdaptiveStack<Content: View>: View {
    @Environment(\.syzygyTheme) private var theme

    private let breakpoint: CGFloat
    private let spacing: CGFloat
    private let content: Content

    public init(breakpoint: CGFloat = 500, spacing: CGFloat = UISpacing.md, @ViewBuilder content: () -> Content) {
        self.breakpoint = breakpoint
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            Group {
                if geometry.size.width >= breakpoint {
                    HStack(spacing: spacing) { content }
                } else {
                    VStack(spacing: spacing) { content }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
