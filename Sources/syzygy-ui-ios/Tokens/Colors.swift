import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// Semantic color tokens for the design system. Each token is backed by an
/// adaptive color so every consumer automatically supports Light and Dark
/// Mode without needing an asset catalog.
public enum UIColorToken {
    public static let primary = adaptive(light: 0x0066FF, dark: 0x3D8BFF)
    public static let secondary = adaptive(light: 0x6E6E73, dark: 0x9B9BA1)
    public static let destructive = adaptive(light: 0xD72C2C, dark: 0xFF6B6B)
    public static let success = adaptive(light: 0x1E8E3E, dark: 0x4CD964)
    public static let warning = adaptive(light: 0xB26A00, dark: 0xFFB840)

    public static let surface = adaptive(light: 0xFFFFFF, dark: 0x1C1C1E)
    public static let background = adaptive(light: 0xF2F2F7, dark: 0x000000)

    public static let textPrimary = adaptive(light: 0x1C1C1E, dark: 0xF2F2F7)
    public static let textSecondary = adaptive(light: 0x6E6E73, dark: 0x9B9BA1)
    public static let textOnPrimary = adaptive(light: 0xFFFFFF, dark: 0xFFFFFF)

    public static let border = adaptive(light: 0xD1D1D6, dark: 0x38383A)

    public static let primaryMuted = adaptive(light: 0xD6E7FF, dark: 0x0F2A54)
    public static let destructiveMuted = adaptive(light: 0xFBDADA, dark: 0x4A1A1A)
    public static let successMuted = adaptive(light: 0xD9F0E0, dark: 0x0F3A1E)
    public static let warningMuted = adaptive(light: 0xFCE9C7, dark: 0x4A330A)
    public static let surfaceSecondary = adaptive(light: 0xF2F2F7, dark: 0x2C2C2E)
    public static let surfaceTertiary = adaptive(light: 0xE5E5EA, dark: 0x3A3A3C)
    public static let textTertiary = adaptive(light: 0xAEAEB2, dark: 0x6E6E73)
    public static let overlay = adaptive(light: 0x000000, dark: 0x000000)
    public static let link = adaptive(light: 0x0066FF, dark: 0x3D8BFF)
    public static let focus = adaptive(light: 0x0066FF, dark: 0x3D8BFF)
    public static let separator = adaptive(light: 0xD1D1D6, dark: 0x38383A)

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
