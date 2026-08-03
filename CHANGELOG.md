# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2026-08-03

### Added

- **Buttons**: `LoadingButton` (built-in loading spinner state, disabled while loading), `FloatingActionButton` (circular elevated primary action button), `ButtonGroup` (segmented button row, single- or multi-select)
- **Inputs**: `TextArea` (multi-line, configurable min/max lines), `OTPInput` (auto-advancing OTP/PIN entry boxes), `TagInput` (MultiSelect text input rendering dismissible chips), `DatePickerField`, `TimePickerField` (native `DatePicker` presented via popover), `FormField` (generic label/content/error/helper wrapper), `PasswordStrengthIndicator` (length + character-class heuristic)
- **Display**: `AvatarGroup` (overlapping `Avatar` stack with "+N" overflow), `StatsCard` (aka `MetricCard`; label, value, optional trend indicator), `RatingInput` (interactive counterpart to the read-only `StarRatingView`)
- **Feedback**: `SkeletonView` (shimmering placeholder shape, rectangle or circle), `CircularProgress` (determinate ring or indeterminate spinner), `InlineAlert` (aka `Banner`; info/success/warning/error variants), `Snackbar` (bottom-anchored, auto-dismissing, consumer-composed via `.overlay(alignment: .bottom)`)
- **Overlay**: `ActionSheet` (+ `.actionSheet(isPresented:actions:)` modifier, built on `BottomSheet`), `Popover` (+ `.styledPopover(isPresented:)` convenience wrapper around the native `.popover`), `Tooltip` (+ `.tooltip(_:)` modifier, revealed via long-press)
- **Navigation**: `SideMenu` (aka `Drawer`; slide-in leading-edge panel with scrim), `FloatingTabBar` (floating + icon-and-label, filling the gap alongside edge-to-edge+labeled `TabBar` and floating+icon-only `BottomNavigationBar`), `StepIndicator` (aka `WizardSteps`), `Breadcrumbs`
- **Layout**: `AdaptiveStack` (width-based HStack/VStack switch), `FlowLayout` (wrapping row container conforming to `Layout`), `StickyHeader` (pinned header over scrolling content)
- **Transitions**: `AnyTransition.scaleTransition`, `.fadeThroughTransition` (sequential fade-out-then-fade-in)
- **Design Tokens**: `primaryMuted`, `destructiveMuted`, `successMuted`, `warningMuted`, `surfaceSecondary`, `surfaceTertiary`, `textTertiary`, `overlay`, `link`, `focus`, `separator` (Colors); `largeTitle` (Typography); `xxs`, `xxxl` (Spacing); `xs`, `xl` (Radius); `Elevation` (new file — shadow specs for `none`/`sm`/`md`/`lg`, applied via `.elevation(_:)`); `Opacity` (new file — `disabled`/`secondary`/`overlay`); `BorderWidth` (new file — `thin`/`regular`/`thick`); `IconSize` (new file — `sm`/`md`/`lg`/`xl`); `Animation` (new file — `Duration.fast/normal/slow` and `Easing.standard/decelerate/accelerate/spring(_:)`)

### Fixed

- `PagerView` moved from the Navigation category to Display — it's presentational paged content, not navigation chrome.
- CI's iOS Simulator destination pinned to `OS=26.2` (was previously unpinned, which could silently pick up whatever OS version happens to be preinstalled on the runner image and drift over time).

### Changed

- README's Design Tokens section condensed from prose descriptions to compact per-category reference tables.

## [2.0.0] - 2026-08-01

### Changed — BREAKING

- **Repository renamed and transferred**: `ios-ui-library` has moved from `github.com/aks5686/ios-ui-library` to `github.com/Syzygy-Hub/syzygy-ui-ios`.
  - Package name, product name, and target name changed from `ios-ui-library` to `syzygy-ui-ios`.
  - Module import changed from `import ios_ui_library` to `import syzygy_ui_ios`.
  - **Consumers must update their SPM package URL** to `https://github.com/Syzygy-Hub/syzygy-ui-ios` and update their import statement. No API-level renames were made to existing components — only the package/module name changed.

### Added

- **Inputs**: `SearchBar` (leading icon, clear button, built-in debounce), `ToggleSwitch`, `Checkbox`, `RadioButton`, `SliderInput`, `Dropdown`, `SegmentedControl` (inline picker for switching content in place, distinct from `TabBar`), `QuantityStepper` (+/- quantity control, named to avoid colliding with `SwiftUI.Stepper`)
- **Display**: `Avatar` (initials or image, three sizes), `DividerView`, `Chip` (with optional remove button), `ListRow` (styled tappable row wrapper), `SectionHeader`, `LazyImageView` (async image loading with a `ShimmerView` placeholder and error fallback), `CountBadge` (small numeric/dot overlay badge, distinct from `Badge`), `StarRatingView` (read-only or interactive)
- **Feedback**: `ShimmerView` (animated skeleton loader), `ProgressBar` (determinate linear progress), `PullToRefresh` (async refreshable scroll wrapper), `ErrorStateView` (retry pattern, mirrors `EmptyStateView`)
- **Overlay**: `ModalView` with a `.modal(isPresented:)` presentation modifier, `BottomSheet` with a `.bottomSheet(isPresented:)` presentation modifier, `CollapsibleView` (accordion-style expandable section)
- **Navigation**: `TabBar` (edge-to-edge, icon + label), `BottomNavigationBar` (floating icon-only pill), `AppBar` (top bar with leading/trailing accessories), `PagerView` (swipeable paged content, distinct from `TabBar`, which is navigation chrome)
- **Layout** (new category): `KeyboardAvoidingScrollView` (keyboard-avoiding scroll wrapper for forms built outside `Form`/`List`)
- **Transitions**: `AnyTransition.slideTransition(_:)` (left-to-right / right-to-left), `.crossFadeTransition`, `.slideVerticalTransition(_:)` (top-to-bottom / bottom-to-top), `.modalPresentationTransition` (slide-up + fade)

### Documentation

- Added a Syzygy banner to the top of README.md, below the badge row.
- Added a "Design Tokens" section documenting the actual `UIColorToken`, `UIFontToken`, `UISpacing`, and `UIRadius` values.
- Reordered README.md's sections to: Requirements, Installation, Components, Design Tokens, Usage, Contributing & Releases, License.
- Condensed the Usage section's code examples.

## [1.0.4] - v1.0.4

- Fix SPM root package structure.

## [1.0.3] - v1.0.3

- TextInput character counter, CI improvements and release docs.

## [1.0.2] - v1.0.2

- CI-gated release workflow and usage docs.

## [1.0.1] - v1.0.1

- Add GhostButton component.

## [1.0.0] - v1.0.0

- Initial release.
