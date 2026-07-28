import Testing
import SwiftUI
@testable import ios_ui_library

@Suite("Design Tokens")
struct TokenTests {
    @Test func spacingValues() {
        #expect(UISpacing.xs == 4)
        #expect(UISpacing.sm == 8)
        #expect(UISpacing.md == 16)
        #expect(UISpacing.lg == 24)
        #expect(UISpacing.xl == 32)
        #expect(UISpacing.xxl == 48)
    }

    @Test func radiusValues() {
        #expect(UIRadius.sm == 6)
        #expect(UIRadius.md == 12)
        #expect(UIRadius.lg == 20)
        #expect(UIRadius.full == 9999)
    }

    @Test func colorTokensExist() {
        _ = UIColorToken.primary
        _ = UIColorToken.secondary
        _ = UIColorToken.destructive
        _ = UIColorToken.success
        _ = UIColorToken.warning
        _ = UIColorToken.surface
        _ = UIColorToken.background
        _ = UIColorToken.textPrimary
        _ = UIColorToken.textSecondary
        _ = UIColorToken.textOnPrimary
        _ = UIColorToken.border
    }

    @Test func fontTokensExist() {
        _ = UIFontToken.display
        _ = UIFontToken.title
        _ = UIFontToken.headline
        _ = UIFontToken.body
        _ = UIFontToken.callout
        _ = UIFontToken.subheadline
        _ = UIFontToken.footnote
        _ = UIFontToken.caption
    }
}

@Suite("Component Initialization")
@MainActor
struct ComponentInitTests {
    @Test func primaryButton() {
        _ = PrimaryButton("Continue") {}
    }

    @Test func secondaryButton() {
        _ = SecondaryButton("Cancel") {}
    }

    @Test func destructiveButton() {
        _ = DestructiveButton("Delete") {}
    }

    @Test func ghostButton() {
        _ = GhostButton("Learn More") {}
    }

    @Test func iconButton() {
        _ = IconButton(systemImage: "heart", accessibilityLabel: "Favorite") {}
    }

    @Test func textInput() {
        _ = TextInput(label: "Email", text: .constant(""))
    }

    @Test func secureInput() {
        _ = SecureInput(label: "Password", text: .constant(""))
    }

    @Test func loadingView() {
        _ = LoadingView(message: "Loading")
    }

    @Test func emptyStateView() {
        _ = EmptyStateView(systemImage: "tray", title: "Empty", subtitle: "Nothing here")
    }

    @Test func toastView() {
        _ = ToastView(message: "Done", style: .success)
    }

    @Test func cardView() {
        _ = CardView { Text("Content") }
    }

    @Test func badge() {
        _ = Badge("New", style: .primary)
    }

    @Test func backButton() {
        _ = BackButton {}
    }
}
