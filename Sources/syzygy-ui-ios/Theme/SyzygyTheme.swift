import SwiftUI

/// The root theme object. Wrap with `SyzygyThemeProvider` to inject into the
/// component tree; access in any component via `@Environment(\.syzygyTheme)`.
public struct SyzygyTheme: Equatable, Sendable {
    public let colors: SyzygyColors
    public let radius: SyzygyRadius
    public let typography: SyzygyTypography
    public let spacing: SyzygySpacing
    public let elevation: SyzygyElevation
    public let animation: SyzygyAnimation

    public init(
        colors: SyzygyColors,
        radius: SyzygyRadius,
        typography: SyzygyTypography,
        spacing: SyzygySpacing,
        elevation: SyzygyElevation,
        animation: SyzygyAnimation
    ) {
        self.colors = colors; self.radius = radius; self.typography = typography
        self.spacing = spacing; self.elevation = elevation; self.animation = animation
    }

    /// Returns a new theme with the specified sub-objects replaced.
    public func with(
        colors: SyzygyColors? = nil,
        radius: SyzygyRadius? = nil,
        typography: SyzygyTypography? = nil,
        spacing: SyzygySpacing? = nil,
        elevation: SyzygyElevation? = nil,
        animation: SyzygyAnimation? = nil
    ) -> SyzygyTheme {
        SyzygyTheme(
            colors: colors ?? self.colors,
            radius: radius ?? self.radius,
            typography: typography ?? self.typography,
            spacing: spacing ?? self.spacing,
            elevation: elevation ?? self.elevation,
            animation: animation ?? self.animation
        )
    }
}

public extension SyzygyTheme {
    /// Light mode — default token values.
    static let `default` = SyzygyTheme(
        colors: .default, radius: .default, typography: .default,
        spacing: .default, elevation: .default, animation: .default
    )

    /// Fixed dark-mode colors, all other tokens unchanged.
    static let dark = SyzygyTheme(
        colors: .dark, radius: .default, typography: .default,
        spacing: .default, elevation: .default, animation: .default
    )

    /// High-contrast accessibility theme.
    static let highContrast = SyzygyTheme(
        colors: .highContrast, radius: .sharp, typography: .highContrast,
        spacing: .default, elevation: .default, animation: .default
    )
}
