import CoreGraphics

/// Corner radius token set for injection via SyzygyTheme.
public struct SyzygyRadius: Equatable, Sendable {
    public let xs: CGFloat
    public let sm: CGFloat
    public let md: CGFloat
    public let lg: CGFloat
    public let xl: CGFloat
    public let full: CGFloat

    public init(xs: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat, xl: CGFloat, full: CGFloat) {
        self.xs = xs; self.sm = sm; self.md = md; self.lg = lg; self.xl = xl; self.full = full
    }

    public static let `default` = SyzygyRadius(xs: 2, sm: 4, md: 8, lg: 16, xl: 24, full: 9999)
    public static let sharp = SyzygyRadius(xs: 0, sm: 0, md: 0, lg: 0, xl: 0, full: 0)
}
