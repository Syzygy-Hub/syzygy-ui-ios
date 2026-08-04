# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.3.0] - 2026-08-05

### Changed (Breaking)
- **Color token vocabulary alignment** — `UIColorToken` extended to the canonical token set; renamed tokens:
  - `textOnPrimary` → `onPrimary` (all button/badge/navigation components updated)
- **New tokens added**: `onPrimary`, `onError`, `onDestructive`, `onSuccess`, `onWarning`, `onSurface`, `error`, `errorMuted`, `primarySubtle`, `textDisabled`, `textInverse`, `scrim` (Material3 `on*` naming pattern)
- Old `textOnPrimary` removed; 16 component files updated to use new names

### Fixed
- CI `release.yml`: added `VERSION="${VERSION#v}"` defensive strip so bare-version commit messages (`release: 2.3.0`) and `v`-prefixed ones (`release: v2.3.0`) both produce a bare tag and GitHub Release title

## [2.2.1] - 2026-08-04

### Changed
- `Checkbox` → `CheckboxInput`, `RadioButton` → `RadioButtonInput`, `SearchBar` → `SearchInput`, `DividerView` → `DividerLine`, `ModalView` → `ModalDialog` — cross-platform naming alignment (breaking rename)
- `ToastView`: prop `style:` → `variant:`, type `ToastStyle` → `ToastVariant` — matches Android/RN/Flutter naming (breaking rename)
- Radius scale aligned with other platforms: `UIRadius.sm` 6→4, `md` 12→8, `lg` 20→16 (visual breaking change; `xs`, `xl`, `full` unchanged)

### Added
- `ColorSwatch`: `size: CGFloat = 32` parameter lets callers override the swatch diameter/side length

### Fixed
- `ErrorStateView`: replaced magic number `.system(size: 40)` with `errorIconSize` private constant
- README: version badge color updated to `#2F6FED`; component list updated with new names

## [2.2.0] - 2026-08-04

### Added

- **Display**: `PageControl` (aka `DotIndicator`; read-only row of dots syncing with `PagerView`'s `currentPage`), `Accordion` (managed group of expandable sections mirroring `CollapsibleView`'s header/disclosure animation, single- or multi-open via `allowsMultipleOpen`), `Timeline` (aka `ActivityFeed`; connecting-line event list with `TimelineItemAlignment` for leading/trailing icon placement), `ColorSwatch` (circle/square color preview with optional label, border shown when `isSelected`)
- **Inputs**: `SearchableDropdown` (inline-filtering options list; standalone rather than a `Dropdown` wrapper since `Dropdown`'s native `Menu` backing has no seam for a custom filtered subview), `PhoneInput` (tappable flag + dial-code prefix from a 12-country default list, numeric keypad, separate formatted-display and raw-digits bindings), `CurrencyInput` (configurable prefix/suffix currency symbol, `NumberFormatter`-based locale-aware display formatting, raw `Double` value exposed separately)
- **Feedback**: `NetworkStatusBanner` (`NWPathMonitor`-backed offline banner, top- or bottom-anchored, auto-dismissing when connectivity returns, with a `manualOverride` for previews/tests), `ConfirmDialog` (+ `.confirmDialog(isPresented:title:message:...)` modifier, built on `ModalView` the same way `ActionSheet` was built on `BottomSheet`; `isDestructive` styles the confirm button with the `destructive` token)
- **Layout**: `SafeAreaWrapper` (configurable-edges safe-area API; on iOS SwiftUI is already safe-area-aware by default, so this mainly gives a consistent cross-platform-shaped API surface rather than solving a hard problem), `LabeledDivider` (two `DividerView` segments flanking a centered/leading/trailing text label)

### Fixed

- Committed a local `.swiftlint.yml` at the repo root (previously absent — a developer running `swiftlint` locally got SwiftLint's stock defaults instead of this project's actual CI ruleset, since CI fetches the shared config from `syzygy-lint-config` at runtime and the checked-in repo had never had a local copy). Local and CI now lint against an identical ruleset. `swiftlint` was not available in this environment to run and report a violation count against the new config — see the report for a manual read-through of the fetched ruleset instead.

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
