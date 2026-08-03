import SwiftUI

/// Elevation scale used throughout the design system. iOS has no Android-style
/// dp elevation system, so each level is expressed as a shadow spec (radius,
/// vertical offset, opacity) applied via `.shadow(...)`.
public enum UIElevation {
    public struct Shadow: Sendable {
        public let radius: CGFloat
        public let y: CGFloat
        public let opacity: Double

        public var color: Color { .black.opacity(opacity) }
    }

    public static let none = Shadow(radius: 0, y: 0, opacity: 0)
    public static let sm = Shadow(radius: 4, y: 1, opacity: 0.08)
    public static let md = Shadow(radius: 8, y: 2, opacity: 0.12)
    public static let lg = Shadow(radius: 16, y: 4, opacity: 0.16)
}

public extension View {
    /// Applies a `UIElevation` shadow spec to this view.
    @MainActor
    func elevation(_ shadow: UIElevation.Shadow) -> some View {
        self.shadow(color: shadow.color, radius: shadow.radius, x: 0, y: shadow.y)
    }
}
