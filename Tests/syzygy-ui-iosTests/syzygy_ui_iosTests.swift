import Testing
import SwiftUI
@testable import syzygy_ui_ios

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
        #expect(UIRadius.sm == 4)
        #expect(UIRadius.md == 8)
        #expect(UIRadius.lg == 16)
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
        _ = UIColorToken.onPrimary
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

    @Test func textInputWithMaxLength() {
        _ = TextInput(label: "Bio", text: .constant("Hello"), maxLength: 100)
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
        _ = ToastView(message: "Done", variant: .success)
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

    // MARK: Inputs

    @Test func searchInput() {
        _ = SearchInput(text: .constant(""))
    }

    @Test func toggleSwitch() {
        _ = ToggleSwitch(label: "Notifications", isOn: .constant(true))
    }

    @Test func checkboxInput() {
        _ = CheckboxInput(label: "Remember me", isChecked: .constant(false))
    }

    @Test func radioButtonInput() {
        _ = RadioButtonInput(label: "Small", isSelected: true) {}
    }

    @Test func sliderInput() {
        _ = SliderInput(label: "Volume", value: .constant(0.5))
    }

    @Test func dropdown() {
        _ = Dropdown(label: "Country", selection: .constant("USA"), options: ["USA", "Canada"]) { $0 }
    }

    @Test func segmentedControl() {
        _ = SegmentedControl(options: ["Day", "Week"], selection: .constant("Day")) { $0 }
    }

    @Test func quantityStepper() {
        _ = QuantityStepper(value: .constant(3))
    }

    // MARK: Display

    @Test func avatarWithInitials() {
        _ = Avatar(initials: "AK")
    }

    @Test func dividerLine() {
        _ = DividerLine()
    }

    @Test func chip() {
        _ = Chip("Swift")
    }

    @Test func chipWithRemove() {
        _ = Chip("Swift", onRemove: {})
    }

    @Test func listRow() {
        _ = ListRow(title: "Settings")
    }

    @Test func listRowWithAccessory() {
        _ = ListRow(title: "Settings") {
            Image(systemName: "chevron.right")
        }
    }

    @Test func sectionHeader() {
        _ = SectionHeader("Recent Activity")
    }

    @Test func lazyImageView() {
        _ = LazyImageView(url: nil)
    }

    @Test func countBadgeWithCount() {
        _ = CountBadge(count: 3)
    }

    @Test func countBadgeDot() {
        _ = CountBadge()
    }

    @Test func starRatingView() {
        _ = StarRatingView(rating: 3)
    }

    @Test func starRatingViewInteractive() {
        _ = StarRatingView(rating: 0, onRatingChanged: { _ in })
    }

    // MARK: Feedback

    @Test func shimmerView() {
        _ = ShimmerView()
    }

    @Test func progressBar() {
        _ = ProgressBar(progress: 0.5)
    }

    @Test func pullToRefresh() {
        _ = PullToRefresh(onRefresh: {}, content: { Text("Content") })
    }

    @Test func errorStateView() {
        _ = ErrorStateView(title: "Error", subtitle: "Something went wrong", retryAction: {})
    }

    // MARK: Overlay

    @Test func modalDialog() {
        _ = ModalDialog { Text("Content") }
    }

    @Test func bottomSheet() {
        _ = BottomSheet { Text("Content") }
    }

    @Test func collapsibleView() {
        _ = CollapsibleView(title: "Details") { Text("Content") }
    }

    // MARK: Navigation

    @Test func tabBar() {
        let items = [TabBarItem(tag: "home", systemImage: "house", label: "Home")]
        _ = TabBar(items: items, selection: .constant("home"))
    }

    @Test func bottomNavigationBar() {
        let items = [TabBarItem(tag: "home", systemImage: "house", label: "Home")]
        _ = BottomNavigationBar(items: items, selection: .constant("home"))
    }

    @Test func appBar() {
        _ = AppBar(title: "Settings")
    }

    @Test func appBarWithLeadingAndTrailing() {
        _ = AppBar(title: "Settings") {
            BackButton {}
        } trailing: {
            IconButton(systemImage: "ellipsis", accessibilityLabel: "More") {}
        }
    }

    @Test func pagerView() {
        _ = PagerView(currentPage: .constant(0)) {
            Text("Page 1").tag(0)
            Text("Page 2").tag(1)
        }
    }

    // MARK: Layout

    @Test func keyboardAvoidingScrollView() {
        _ = KeyboardAvoidingScrollView { Text("Content") }
    }
}

// MARK: - v2.1+ component behaviour

@Suite("v2.1+ Components")
@MainActor
struct V21ComponentTests {

    // MARK: LoadingButton

    @Test func loadingButtonInitNotLoading() {
        _ = LoadingButton(label: "Save", isLoading: false) {}
    }

    @Test func loadingButtonInitLoading() {
        _ = LoadingButton(label: "Save", isLoading: true) {}
    }

    // MARK: ButtonGroup

    @Test func buttonGroupSingleSelectInit() {
        _ = ButtonGroup(options: ["A", "B", "C"], selection: .constant("A"))
    }

    @Test func buttonGroupMultiSelectInit() {
        _ = ButtonGroup(options: ["A", "B"], selection: .constant(Set<String>(["A"])), multiSelect: true)
    }

    // MARK: InlineAlert variants and systemImage

    @Test func inlineAlertInfoSystemImage() {
        #expect(InlineAlert.Variant.info.systemImage == "info.circle.fill")
    }

    @Test func inlineAlertSuccessSystemImage() {
        #expect(InlineAlert.Variant.success.systemImage == "checkmark.circle.fill")
    }

    @Test func inlineAlertWarningSystemImage() {
        #expect(InlineAlert.Variant.warning.systemImage == "exclamationmark.triangle.fill")
    }

    @Test func inlineAlertErrorSystemImage() {
        #expect(InlineAlert.Variant.error.systemImage == "xmark.circle.fill")
    }

    @Test func inlineAlertInfoInit() {
        _ = InlineAlert(message: "Note", variant: .info)
    }

    @Test func inlineAlertErrorInit() {
        _ = InlineAlert(message: "Error occurred", variant: .error)
    }

    // MARK: StatsCard trend systemImages

    @Test func statsCardTrendUpSystemImage() {
        #expect(StatsCard.Trend.up.systemImage == "arrow.up.right")
    }

    @Test func statsCardTrendDownSystemImage() {
        #expect(StatsCard.Trend.down.systemImage == "arrow.down.right")
    }

    @Test func statsCardTrendNeutralSystemImage() {
        #expect(StatsCard.Trend.neutral.systemImage == "arrow.right")
    }

    @Test func statsCardInitNoTrend() {
        _ = StatsCard(label: "Revenue", value: "$1,200")
    }

    @Test func statsCardInitWithTrend() {
        _ = StatsCard(label: "Revenue", value: "$1,200", trend: .up, trendValue: "+12%")
    }

    // MARK: Accordion

    @Test func accordionSingleSectionInit() {
        let sections = [AccordionSection(id: "a", title: "Section A") { Text("Hello") }]
        _ = Accordion(sections: sections)
    }

    @Test func accordionMultipleOpenInit() {
        let sections = [
            AccordionSection(id: "a", title: "A") { Text("A content") },
            AccordionSection(id: "b", title: "B") { Text("B content") }
        ]
        _ = Accordion(sections: sections, allowsMultipleOpen: true)
    }

    @Test func accordionInitiallyExpanded() {
        let sections = [AccordionSection(id: "a", title: "A") { Text("Content") }]
        _ = Accordion(sections: sections, initiallyExpanded: ["a"])
    }

    // MARK: OTPInput

    @Test func otpInputDefaultLength() {
        _ = OTPInput(code: .constant(""))
    }

    @Test func otpInputCustomLength() {
        _ = OTPInput(length: 4, code: .constant(""))
    }

    // MARK: TagInput

    @Test func tagInputInit() {
        _ = TagInput(tags: .constant([]))
    }

    @Test func tagInputWithPlaceholder() {
        _ = TagInput(tags: .constant(["swift"]), placeholder: "Enter tag")
    }

    // MARK: StepIndicator

    @Test func stepIndicatorInit() {
        _ = StepIndicator(steps: ["Start", "Middle", "End"], currentStep: 0)
    }

    @Test func stepIndicatorCurrentStepMiddle() {
        _ = StepIndicator(steps: ["A", "B", "C"], currentStep: 1)
    }
}

