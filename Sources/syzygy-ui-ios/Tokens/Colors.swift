import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// Semantic color tokens for the design system. Each token is backed by an
/// adaptive color so every consumer automatically supports Light and Dark
/// Mode without needing an asset catalog.
public enum UIColorToken {

    // MARK: — Brand

    public static let primary = adaptive(light: 0x0066FF, dark: 0x3D8BFF)
    /// Text/icon color for content rendered on top of `primary`. Always white.
    public static let onPrimary = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)
    public static let primaryMuted = adaptive(light: 0xD6E7FF, dark: 0x0F2A54)
    /// Lightest tint of `primary` — for large-area background washes.
    /// ⚠️ No prior equivalent; hex inferred as lighter than `primaryMuted`.
    public static let primarySubtle = adaptive(light: 0xEBF4FF, dark: 0x061529)

    // MARK: — Error (form/system errors)

    /// Same hex as `destructive`; kept as a separate token for semantic clarity.
    public static let error = adaptive(light: 0xD72C2C, dark: 0xFF6B6B)
    /// Text/icon color for content rendered on top of `error`.
    /// ⚠️ No prior `textOnError` equivalent; using white by convention.
    public static let onError = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)
    /// Same hex as `destructiveMuted`.
    public static let errorMuted = adaptive(light: 0xFBDADA, dark: 0x4A1A1A)

    // MARK: — Destructive (delete/irreversible actions)

    public static let destructive = adaptive(light: 0xD72C2C, dark: 0xFF6B6B)
    /// Text/icon color for content rendered on top of `destructive`.
    /// ⚠️ No prior `textOnDestructive` equivalent; using white by convention.
    public static let onDestructive = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)
    public static let destructiveMuted = adaptive(light: 0xFBDADA, dark: 0x4A1A1A)

    // MARK: — Success

    public static let success = adaptive(light: 0x1E8E3E, dark: 0x4CD964)
    /// Text/icon color for content rendered on top of `success`.
    /// ⚠️ No prior `textOnSuccess` equivalent; using white by convention.
    public static let onSuccess = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)
    public static let successMuted = adaptive(light: 0xD9F0E0, dark: 0x0F3A1E)

    // MARK: — Warning

    public static let warning = adaptive(light: 0xB26A00, dark: 0xFFB840)
    /// Text/icon color for content rendered on top of `warning`.
    /// ⚠️ No prior `textOnWarning` equivalent; using white by convention.
    public static let onWarning = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)
    public static let warningMuted = adaptive(light: 0xFCE9C7, dark: 0x4A330A)

    // MARK: — Surface

    public static let background = adaptive(light: 0xF2F2F7, dark: 0x000000)
    public static let surface = adaptive(light: 0xFFFFFF, dark: 0x1C1C1E)
    public static let surfaceSecondary = adaptive(light: 0xF2F2F7, dark: 0x2C2C2E)
    public static let surfaceTertiary = adaptive(light: 0xE5E5EA, dark: 0x3A3A3C)
    /// Primary content color for content rendered on any surface. Mirrors `textPrimary`.
    public static let onSurface = adaptive(light: 0x1C1C1E, dark: 0xF2F2F7)

    // MARK: — Text

    public static let textPrimary = adaptive(light: 0x1C1C1E, dark: 0xF2F2F7)
    public static let textSecondary = adaptive(light: 0x6E6E73, dark: 0x9B9BA1)
    public static let textTertiary = adaptive(light: 0xAEAEB2, dark: 0x6E6E73)
    /// ⚠️ No prior equivalent; hex inferred between `textTertiary` and `border`.
    public static let textDisabled = adaptive(light: 0xBEBEC2, dark: 0x48484A)
    public static let textInverse = adaptive(light: 0xFFFFFF, dark: 0x1C1C1E)

    // MARK: — UI

    public static let border = adaptive(light: 0xD1D1D6, dark: 0x38383A)
    public static let separator = adaptive(light: 0xD1D1D6, dark: 0x38383A)
    /// Semi-transparent black used behind modals/sheets. Apply `.opacity()` in SwiftUI.
    public static let overlay = adaptive(light: 0x000000, dark: 0x000000)
    /// Same hex as `overlay`; consumers apply an opacity modifier.
    public static let scrim = adaptive(light: 0x000000, dark: 0x000000)
    public static let link = adaptive(light: 0x0066FF, dark: 0x3D8BFF)
    public static let focus = adaptive(light: 0x0066FF, dark: 0x3D8BFF)

    // MARK: — Legacy (kept for non-breaking secondary uses)

    public static let secondary = adaptive(light: 0x6E6E73, dark: 0x9B9BA1)

    // MARK: — Private helpers

    /// A packed 0xRRGGBB literal, decoded into its channels — replaces a
    /// 3-element tuple parameter (flagged by SwiftLint's `large_tuple`).
    private struct RGB: ExpressibleByIntegerLiteral {
        let redChannel: UInt8
        let greenChannel: UInt8
        let blueChannel: UInt8

        init(integerLiteral value: UInt32) {
            redChannel = UInt8((value >> 16) & 0xFF)
            greenChannel = UInt8((value >> 8) & 0xFF)
            blueChannel = UInt8(value & 0xFF)
        }
    }

    private static func adaptive(
        light: RGB,
        dark: RGB
    ) -> Color {
        #if canImport(UIKit)
        return Color(UIColor { traits in
            let rgb = traits.userInterfaceStyle == .dark ? dark : light
            return UIColor(
                red: CGFloat(rgb.redChannel) / 255,
                green: CGFloat(rgb.greenChannel) / 255,
                blue: CGFloat(rgb.blueChannel) / 255,
                alpha: 1
            )
        })
        #else
        return Color(
            red: Double(light.redChannel) / 255,
            green: Double(light.greenChannel) / 255,
            blue: Double(light.blueChannel) / 255
        )
        #endif
    }
}
