import SwiftUI

/// Shadow blur radius for each elevation level, for injection via SyzygyTheme.
public struct SyzygyElevation: Equatable, Sendable {
    public let none: CGFloat
    public let sm: CGFloat
    public let md: CGFloat
    public let lg: CGFloat

    public init(none: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat) {
        self.none = none; self.sm = sm; self.md = md; self.lg = lg
    }

    /// Matches UIElevation shadow radii: none=0, sm=4, md=8, lg=16.
    public static let `default` = SyzygyElevation(none: 0, sm: 4, md: 8, lg: 16)
}

public extension View {
    /// Applies a themed shadow using a `SyzygyElevation` blur-radius value.
    /// Uses the same vertical offsets and opacity as the corresponding `UIElevation` levels.
    @MainActor
    func themedElevation(_ radius: CGFloat) -> some View {
        let opacity: Double
        let offset: CGFloat
        switch radius {
        case 0:
            opacity = 0; offset = 0
        case 4:
            opacity = 0.08; offset = 1
        case 8:
            opacity = 0.12; offset = 2
        default:
            // lg (16) and any custom values
            opacity = 0.16; offset = 4
        }
        return self.shadow(color: .black.opacity(opacity), radius: radius, x: 0, y: offset)
    }
}
