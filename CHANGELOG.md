# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

### Fixed

- CI's `lint` job in `swift.yml` now fetches the shared SwiftLint ruleset from `syzygy-lint-config` (pinned to `v1.0.0`) and runs `swiftlint --config .swiftlint.yml`, instead of running with bare tool defaults.
- Added the Syzygy brand icon to the top of README.md, above the badge row.

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
