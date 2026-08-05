import SwiftUI

/// Typography token set for injection via SyzygyTheme.
public struct SyzygyTypography: Equatable, Sendable {
    public let largeTitle: Font
    public let display: Font
    public let title: Font
    public let headline: Font
    public let body: Font
    public let callout: Font
    public let subheadline: Font
    public let footnote: Font
    public let caption: Font

    public init(
        largeTitle: Font, display: Font, title: Font, headline: Font, body: Font,
        callout: Font, subheadline: Font, footnote: Font, caption: Font
    ) {
        self.largeTitle = largeTitle; self.display = display; self.title = title
        self.headline = headline; self.body = body; self.callout = callout
        self.subheadline = subheadline; self.footnote = footnote; self.caption = caption
    }

    /// Default: mirrors UIFontToken scale (Dynamic Type, system font).
    public static let `default` = SyzygyTypography(
        largeTitle: Font.system(.largeTitle, design: .default).weight(.bold),
        display: Font.system(.largeTitle, design: .default).weight(.bold),
        title: Font.system(.title, design: .default).weight(.semibold),
        headline: Font.system(.headline, design: .default),
        body: Font.system(.body, design: .default),
        callout: Font.system(.callout, design: .default),
        subheadline: Font.system(.subheadline, design: .default),
        footnote: Font.system(.footnote, design: .default),
        caption: Font.system(.caption, design: .default)
    )

    /// High-contrast: one step heavier weights throughout.
    public static let highContrast = SyzygyTypography(
        largeTitle: Font.system(.largeTitle, design: .default).weight(.black),
        display: Font.system(.largeTitle, design: .default).weight(.black),
        title: Font.system(.title, design: .default).weight(.bold),
        headline: Font.system(.headline, design: .default).weight(.bold),
        body: Font.system(.body, design: .default).weight(.semibold),
        callout: Font.system(.callout, design: .default).weight(.semibold),
        subheadline: Font.system(.subheadline, design: .default).weight(.semibold),
        footnote: Font.system(.footnote, design: .default).weight(.medium),
        caption: Font.system(.caption, design: .default).weight(.medium)
    )
}
