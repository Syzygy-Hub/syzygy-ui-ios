import SwiftUI

/// A row of dots indicating position within a paged sequence (also known as
/// a "DotIndicator"), syncing with `PagerView`'s `currentPage`. Read-only
/// display by design — `PagerView` already renders its own native page dots
/// when `showsIndicators` is true, so this component exists for cases where
/// you want a *custom-styled* indicator elsewhere on screen (e.g. above the
/// pager, or paired with a non-`PagerView` paged layout) rather than a
/// tappable control; pass the same `currentPage` value you feed to `PagerView`.
@MainActor
public struct PageControl: View {
    @Environment(\.syzygyTheme) private var theme

    private let pageCount: Int
    private let currentPage: Int
    private let activeColor: Color
    private let inactiveColor: Color

    public init(
        pageCount: Int,
        currentPage: Int,
        activeColor: Color = UIColorToken.primary,
        inactiveColor: Color = UIColorToken.border
    ) {
        self.pageCount = pageCount
        self.currentPage = currentPage
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
    }

    public var body: some View {
        HStack(spacing: theme.spacing.xs) {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? activeColor : inactiveColor)
                    .frame(width: index == currentPage ? 8 : 6, height: index == currentPage ? 8 : 6)
                    .animation(UIAnimation.Easing.standard(UIAnimation.Duration.fast), value: currentPage)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Page \(currentPage + 1) of \(pageCount)")
    }
}
