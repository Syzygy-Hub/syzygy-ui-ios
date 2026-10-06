import Testing
import SwiftUI
@testable import syzygy_ui_ios

// MARK: - Theme layer

@Suite("Theme Layer")
struct ThemeTests {
    // MARK: SyzygyTheme creation

    @Test func themeDefaultPresetExists() {
        let theme = SyzygyTheme.default
        _ = theme.colors
        _ = theme.radius
        _ = theme.typography
        _ = theme.spacing
        _ = theme.elevation
        _ = theme.animation
    }

    @Test func themeDarkPresetExists() {
        _ = SyzygyTheme.dark
    }

    @Test func themeHighContrastPresetExists() {
        _ = SyzygyTheme.highContrast
    }

    @Test func themeDefaultRadiusXlIs24() {
        #expect(SyzygyTheme.default.radius.xl == 24)
    }

    @Test func themeDefaultSpacingMdIs16() {
        #expect(SyzygyTheme.default.spacing.md == 16)
    }

    @Test func themeDefaultSpacingValues() {
        let spacing = SyzygyTheme.default.spacing
        #expect(spacing.xxs == 2)
        #expect(spacing.xs == 4)
        #expect(spacing.sm == 8)
        #expect(spacing.md == 16)
        #expect(spacing.lg == 24)
        #expect(spacing.xl == 32)
        #expect(spacing.xxl == 48)
        #expect(spacing.xxxl == 64)
    }

    @Test func themeDefaultRadiusValues() {
        let radius = SyzygyTheme.default.radius
        #expect(radius.xs == 2)
        #expect(radius.sm == 4)
        #expect(radius.md == 8)
        #expect(radius.lg == 16)
        #expect(radius.xl == 24)
        #expect(radius.full == 9999)
    }

    @Test func themeHighContrastRadiusIsSharp() {
        let highContrastRadius = SyzygyTheme.highContrast.radius
        #expect(highContrastRadius.xs == 0)
        #expect(highContrastRadius.sm == 0)
        #expect(highContrastRadius.md == 0)
        #expect(highContrastRadius.lg == 0)
        #expect(highContrastRadius.xl == 0)
    }

    // MARK: copyWith (.with)

    @Test func themeWithRadiusReplacesRadius() {
        let customRadius = SyzygyRadius(xs: 1, sm: 2, md: 3, lg: 4, xl: 5, full: 100)
        let modified = SyzygyTheme.default.with(radius: customRadius)
        #expect(modified.radius.xl == 5)
        #expect(modified.radius.full == 100)
    }

    @Test func themeWithRadiusKeepsOtherTokens() {
        let customRadius = SyzygyRadius(xs: 0, sm: 0, md: 0, lg: 0, xl: 0, full: 0)
        let modified = SyzygyTheme.default.with(radius: customRadius)
        #expect(modified.spacing.md == 16)
    }

    @Test func themeWithNoArgsReturnsCopy() {
        let original = SyzygyTheme.default
        let copy = original.with()
        #expect(copy == original)
    }

    @Test func themeWithSpacingReplacesSpacing() {
        let customSpacing = SyzygySpacing(
            xxs: 1, xs: 2, sm: 3, md: 4, lg: 5, xl: 6, xxl: 7, xxxl: 8
        )
        let modified = SyzygyTheme.default.with(spacing: customSpacing)
        #expect(modified.spacing.md == 4)
        #expect(modified.spacing.xl == 6)
    }

    // MARK: SyzygyRadius token access

    @Test func syzygyRadiusDefaultValues() {
        let defaultRadius = SyzygyRadius.default
        #expect(defaultRadius.xs == 2)
        #expect(defaultRadius.sm == 4)
        #expect(defaultRadius.md == 8)
        #expect(defaultRadius.lg == 16)
        #expect(defaultRadius.xl == 24)
        #expect(defaultRadius.full == 9999)
    }

    @Test func syzygyRadiusSharpAllZeros() {
        let sharpRadius = SyzygyRadius.sharp
        #expect(sharpRadius.xs == 0)
        #expect(sharpRadius.sm == 0)
        #expect(sharpRadius.md == 0)
        #expect(sharpRadius.lg == 0)
        #expect(sharpRadius.xl == 0)
        #expect(sharpRadius.full == 0)
    }

    @Test func syzygySpacingDefaultValues() {
        let defaultSpacing = SyzygySpacing.default
        #expect(defaultSpacing.xxs == 2)
        #expect(defaultSpacing.xs == 4)
        #expect(defaultSpacing.sm == 8)
        #expect(defaultSpacing.md == 16)
        #expect(defaultSpacing.lg == 24)
        #expect(defaultSpacing.xl == 32)
        #expect(defaultSpacing.xxl == 48)
        #expect(defaultSpacing.xxxl == 64)
    }
}

@Suite("Navigation Transitions")
struct NavigationTransitionTests {
    @Test func slideTransitionExists() {
        _ = AnyTransition.slideTransition(.leftToRight)
        _ = AnyTransition.slideTransition(.rightToLeft)
    }

    @Test func crossFadeTransitionExists() {
        _ = AnyTransition.crossFadeTransition
    }

    @Test func slideVerticalTransitionExists() {
        _ = AnyTransition.slideVerticalTransition(.topToBottom)
        _ = AnyTransition.slideVerticalTransition(.bottomToTop)
    }

    @Test func modalPresentationTransitionExists() {
        _ = AnyTransition.modalPresentationTransition
    }
}
