import SwiftUI

/// Type scale tokens built entirely on top of Dynamic Type text styles so
/// every consumer automatically scales with the user's preferred text size.
public enum UIFontToken {
    public static let largeTitle = Font.system(.largeTitle, design: .default).weight(.bold)
    public static let display = Font.system(.largeTitle, design: .default).weight(.bold)
    public static let title = Font.system(.title, design: .default).weight(.semibold)
    public static let headline = Font.system(.headline, design: .default)
    public static let body = Font.system(.body, design: .default)
    public static let callout = Font.system(.callout, design: .default)
    public static let subheadline = Font.system(.subheadline, design: .default)
    public static let footnote = Font.system(.footnote, design: .default)
    public static let caption = Font.system(.caption, design: .default)
}
