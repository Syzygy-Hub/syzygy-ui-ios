import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// Semantic color tokens for the design system. Each token is backed by an
/// adaptive color so every consumer automatically supports Light and Dark
/// Mode without needing an asset catalog.
public enum UIColorToken {
    public static let primary = adaptive(light: (0x00, 0x66, 0xFF), dark: (0x3D, 0x8B, 0xFF))
    public static let secondary = adaptive(light: (0x6E, 0x6E, 0x73), dark: (0x9B, 0x9B, 0xA1))
    public static let destructive = adaptive(light: (0xD7, 0x2C, 0x2C), dark: (0xFF, 0x6B, 0x6B))
    public static let success = adaptive(light: (0x1E, 0x8E, 0x3E), dark: (0x4C, 0xD9, 0x64))
    public static let warning = adaptive(light: (0xB2, 0x6A, 0x00), dark: (0xFF, 0xB8, 0x40))

    public static let surface = adaptive(light: (0xFF, 0xFF, 0xFF), dark: (0x1C, 0x1C, 0x1E))
    public static let background = adaptive(light: (0xF2, 0xF2, 0xF7), dark: (0x00, 0x00, 0x00))

    public static let textPrimary = adaptive(light: (0x1C, 0x1C, 0x1E), dark: (0xF2, 0xF2, 0xF7))
    public static let textSecondary = adaptive(light: (0x6E, 0x6E, 0x73), dark: (0x9B, 0x9B, 0xA1))
    public static let textOnPrimary = adaptive(light: (0xFF, 0xFF, 0xFF), dark: (0xFF, 0xFF, 0xFF))

    public static let border = adaptive(light: (0xD1, 0xD1, 0xD6), dark: (0x38, 0x38, 0x3A))

    public static let primaryMuted = adaptive(light: (0xD6, 0xE7, 0xFF), dark: (0x0F, 0x2A, 0x54))
    public static let destructiveMuted = adaptive(light: (0xFB, 0xDA, 0xDA), dark: (0x4A, 0x1A, 0x1A))
    public static let successMuted = adaptive(light: (0xD9, 0xF0, 0xE0), dark: (0x0F, 0x3A, 0x1E))
    public static let warningMuted = adaptive(light: (0xFC, 0xE9, 0xC7), dark: (0x4A, 0x33, 0x0A))
    public static let surfaceSecondary = adaptive(light: (0xF2, 0xF2, 0xF7), dark: (0x2C, 0x2C, 0x2E))
    public static let surfaceTertiary = adaptive(light: (0xE5, 0xE5, 0xEA), dark: (0x3A, 0x3A, 0x3C))
    public static let textTertiary = adaptive(light: (0xAE, 0xAE, 0xB2), dark: (0x6E, 0x6E, 0x73))
    public static let overlay = adaptive(light: (0x00, 0x00, 0x00), dark: (0x00, 0x00, 0x00))
    public static let link = adaptive(light: (0x00, 0x66, 0xFF), dark: (0x3D, 0x8B, 0xFF))
    public static let focus = adaptive(light: (0x00, 0x66, 0xFF), dark: (0x3D, 0x8B, 0xFF))
    public static let separator = adaptive(light: (0xD1, 0xD1, 0xD6), dark: (0x38, 0x38, 0x3A))

    private static func adaptive(
        light: (UInt8, UInt8, UInt8),
        dark: (UInt8, UInt8, UInt8)
    ) -> Color {
        #if canImport(UIKit)
        return Color(UIColor { traits in
            let rgb = traits.userInterfaceStyle == .dark ? dark : light
            return UIColor(
                red: CGFloat(rgb.0) / 255,
                green: CGFloat(rgb.1) / 255,
                blue: CGFloat(rgb.2) / 255,
                alpha: 1
            )
        })
        #else
        return Color(
            red: Double(light.0) / 255,
            green: Double(light.1) / 255,
            blue: Double(light.2) / 255
        )
        #endif
    }
}
