import CoreGraphics

/// Spacing token set for injection via SyzygyTheme.
public struct SyzygySpacing: Equatable, Sendable {
    public let xxs: CGFloat
    public let xs: CGFloat
    public let sm: CGFloat
    public let md: CGFloat
    public let lg: CGFloat
    public let xl: CGFloat
    public let xxl: CGFloat
    public let xxxl: CGFloat

    public init(
        xxs: CGFloat, xs: CGFloat, sm: CGFloat, md: CGFloat,
        lg: CGFloat, xl: CGFloat, xxl: CGFloat, xxxl: CGFloat
    ) {
        self.xxs = xxs; self.xs = xs; self.sm = sm; self.md = md
        self.lg = lg; self.xl = xl; self.xxl = xxl; self.xxxl = xxxl
    }

    public static let `default` = SyzygySpacing(
        xxs: 2, xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48, xxxl: 64
    )
}
