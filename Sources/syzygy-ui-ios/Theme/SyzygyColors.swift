import SwiftUI

/// A snapshot of semantic color tokens for injection via SyzygyTheme.
/// The existing `UIColorToken` enum is unchanged — this struct wraps the same values.
public struct SyzygyColors: Equatable, Sendable {
    public let primary: Color
    public let onPrimary: Color
    public let primaryMuted: Color
    public let primarySubtle: Color
    public let error: Color
    public let onError: Color
    public let errorMuted: Color
    public let destructive: Color
    public let onDestructive: Color
    public let destructiveMuted: Color
    public let success: Color
    public let onSuccess: Color
    public let successMuted: Color
    public let warning: Color
    public let onWarning: Color
    public let warningMuted: Color
    public let background: Color
    public let surface: Color
    public let surfaceSecondary: Color
    public let surfaceTertiary: Color
    public let onSurface: Color
    public let textPrimary: Color
    public let textSecondary: Color
    public let textTertiary: Color
    public let textDisabled: Color
    public let textInverse: Color
    public let border: Color
    public let separator: Color
    public let overlay: Color
    public let scrim: Color
    public let link: Color
    public let focus: Color
    public let secondary: Color
    public let disabled: Color
    public let overlayAlpha: Double

    public init(
        primary: Color, onPrimary: Color, primaryMuted: Color, primarySubtle: Color,
        error: Color, onError: Color, errorMuted: Color,
        destructive: Color, onDestructive: Color, destructiveMuted: Color,
        success: Color, onSuccess: Color, successMuted: Color,
        warning: Color, onWarning: Color, warningMuted: Color,
        background: Color, surface: Color, surfaceSecondary: Color, surfaceTertiary: Color, onSurface: Color,
        textPrimary: Color, textSecondary: Color, textTertiary: Color, textDisabled: Color, textInverse: Color,
        border: Color, separator: Color, overlay: Color, scrim: Color, link: Color, focus: Color,
        secondary: Color, disabled: Color, overlayAlpha: Double
    ) {
        self.primary = primary; self.onPrimary = onPrimary
        self.primaryMuted = primaryMuted; self.primarySubtle = primarySubtle
        self.error = error; self.onError = onError; self.errorMuted = errorMuted
        self.destructive = destructive; self.onDestructive = onDestructive
        self.destructiveMuted = destructiveMuted
        self.success = success; self.onSuccess = onSuccess; self.successMuted = successMuted
        self.warning = warning; self.onWarning = onWarning; self.warningMuted = warningMuted
        self.background = background; self.surface = surface
        self.surfaceSecondary = surfaceSecondary; self.surfaceTertiary = surfaceTertiary
        self.onSurface = onSurface
        self.textPrimary = textPrimary; self.textSecondary = textSecondary
        self.textTertiary = textTertiary; self.textDisabled = textDisabled
        self.textInverse = textInverse
        self.border = border; self.separator = separator
        self.overlay = overlay; self.scrim = scrim
        self.link = link; self.focus = focus; self.secondary = secondary; self.disabled = disabled
        self.overlayAlpha = overlayAlpha
    }
}

public extension SyzygyColors {
    /// Default: wraps the adaptive `UIColorToken` values (auto light/dark).
    static let `default` = SyzygyColors(
        primary: UIColorToken.primary, onPrimary: UIColorToken.onPrimary,
        primaryMuted: UIColorToken.primaryMuted, primarySubtle: UIColorToken.primarySubtle,
        error: UIColorToken.error, onError: UIColorToken.onError, errorMuted: UIColorToken.errorMuted,
        destructive: UIColorToken.destructive, onDestructive: UIColorToken.onDestructive,
        destructiveMuted: UIColorToken.destructiveMuted,
        success: UIColorToken.success, onSuccess: UIColorToken.onSuccess, successMuted: UIColorToken.successMuted,
        warning: UIColorToken.warning, onWarning: UIColorToken.onWarning, warningMuted: UIColorToken.warningMuted,
        background: UIColorToken.background, surface: UIColorToken.surface,
        surfaceSecondary: UIColorToken.surfaceSecondary, surfaceTertiary: UIColorToken.surfaceTertiary,
        onSurface: UIColorToken.onSurface,
        textPrimary: UIColorToken.textPrimary, textSecondary: UIColorToken.textSecondary,
        textTertiary: UIColorToken.textTertiary, textDisabled: UIColorToken.textDisabled,
        textInverse: UIColorToken.textInverse,
        border: UIColorToken.border, separator: UIColorToken.separator,
        overlay: UIColorToken.overlay, scrim: UIColorToken.scrim,
        link: UIColorToken.link, focus: UIColorToken.focus,
        secondary: UIColorToken.secondary,
        disabled: Color(red: 0.74, green: 0.74, blue: 0.77),
        overlayAlpha: 0.4
    )

    /// Dark: fixed dark-mode hex values.
    static let dark = SyzygyColors(
        primary: Color(hex: 0x3D8BFF), onPrimary: Color(hex: 0xFFFFFF),
        primaryMuted: Color(hex: 0x0F2A54), primarySubtle: Color(hex: 0x061529),
        error: Color(hex: 0xFF6B6B), onError: Color(hex: 0xFFFFFF), errorMuted: Color(hex: 0x4A1A1A),
        destructive: Color(hex: 0xFF6B6B), onDestructive: Color(hex: 0xFFFFFF),
        destructiveMuted: Color(hex: 0x4A1A1A),
        success: Color(hex: 0x4CD964), onSuccess: Color(hex: 0xFFFFFF), successMuted: Color(hex: 0x0F3A1E),
        warning: Color(hex: 0xFFB840), onWarning: Color(hex: 0xFFFFFF), warningMuted: Color(hex: 0x4A330A),
        background: Color(hex: 0x000000), surface: Color(hex: 0x1C1C1E),
        surfaceSecondary: Color(hex: 0x2C2C2E), surfaceTertiary: Color(hex: 0x3A3A3C),
        onSurface: Color(hex: 0xF2F2F7),
        textPrimary: Color(hex: 0xF2F2F7), textSecondary: Color(hex: 0x9B9BA1),
        textTertiary: Color(hex: 0x6E6E73), textDisabled: Color(hex: 0x48484A),
        textInverse: Color(hex: 0x1C1C1E),
        border: Color(hex: 0x38383A), separator: Color(hex: 0x38383A),
        overlay: Color(hex: 0x000000), scrim: Color(hex: 0x000000),
        link: Color(hex: 0x3D8BFF), focus: Color(hex: 0x3D8BFF),
        secondary: Color(hex: 0x9B9BA1), disabled: Color(hex: 0x3A3A3C),
        overlayAlpha: 0.4
    )

    /// High contrast accessibility theme.
    static let highContrast = SyzygyColors(
        primary: Color(hex: 0x0047CC), onPrimary: Color(hex: 0xFFFFFF),
        primaryMuted: Color(hex: 0xCCDDFF), primarySubtle: Color(hex: 0xE5EEFF),
        error: Color(hex: 0xB71C1C), onError: Color(hex: 0xFFFFFF), errorMuted: Color(hex: 0xFFCDD2),
        destructive: Color(hex: 0xB71C1C), onDestructive: Color(hex: 0xFFFFFF),
        destructiveMuted: Color(hex: 0xFFCDD2),
        success: Color(hex: 0x1B5E20), onSuccess: Color(hex: 0xFFFFFF), successMuted: Color(hex: 0xC8E6C9),
        warning: Color(hex: 0xBF360C), onWarning: Color(hex: 0xFFFFFF), warningMuted: Color(hex: 0xFFE0B2),
        background: Color(hex: 0xFFFFFF), surface: Color(hex: 0xFFFFFF),
        surfaceSecondary: Color(hex: 0xF5F5F5), surfaceTertiary: Color(hex: 0xEEEEEE),
        onSurface: Color(hex: 0x000000),
        textPrimary: Color(hex: 0x000000), textSecondary: Color(hex: 0x000000),
        textTertiary: Color(hex: 0x000000), textDisabled: Color(hex: 0x424242),
        textInverse: Color(hex: 0xFFFFFF),
        border: Color(hex: 0x000000), separator: Color(hex: 0x000000),
        overlay: Color(hex: 0x000000), scrim: Color(hex: 0x000000),
        link: Color(hex: 0x0047CC), focus: Color(hex: 0x0047CC),
        secondary: Color(hex: 0x424242), disabled: Color(hex: 0x9E9E9E),
        overlayAlpha: 0.6
    )
}

// MARK: - Color hex initialiser (internal to this module)
extension Color {
    init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}
