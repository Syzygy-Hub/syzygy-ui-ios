# syzygy-ui-ios

[![Swift](https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white)](https://www.swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-000000?logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml/badge.svg)](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Syzygy-Hub/syzygy-brand-assets/main/Assets/syzygy-banner-dark-2400.png">
  <img src="https://raw.githubusercontent.com/Syzygy-Hub/syzygy-brand-assets/main/Assets/syzygy-banner-light-2400.png" alt="Syzygy" width="500">
</picture>

Production-ready SwiftUI component library with semantic design tokens, Dark Mode, Dynamic Type, and zero third-party dependencies.

## Requirements
- iOS 17+
- Swift 6
- Xcode 16+

## Installation

### Swift Package Manager
In Xcode: File → Add Package Dependencies

Paste: https://github.com/Syzygy-Hub/syzygy-ui-ios

## Components

- **Buttons**: PrimaryButton, SecondaryButton, DestructiveButton, GhostButton, IconButton
- **Cards**: CardView
- **Badges**: Badge
- **Inputs**: TextInput (with optional character counter), SecureInput, SearchBar (debounced, with clear button), ToggleSwitch, Checkbox, RadioButton, SliderInput, Dropdown, SegmentedControl, QuantityStepper
- **Display**: Avatar, DividerView, Chip, ListRow, SectionHeader, LazyImageView, CountBadge, StarRatingView
- **Feedback**: LoadingView, EmptyStateView, ToastView, ShimmerView, ProgressBar, PullToRefresh, ErrorStateView
- **Overlay**: ModalView (+ `.modal(isPresented:)` view modifier), BottomSheet (+ `.bottomSheet(isPresented:)` view modifier), CollapsibleView
- **Navigation**: BackButton, TabBar, BottomNavigationBar, AppBar, PagerView
- **Layout**: KeyboardAvoidingScrollView
- **Transitions**: `AnyTransition.slideTransition(_:)`, `.crossFadeTransition`, `.slideVerticalTransition(_:)`, `.modalPresentationTransition`

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Design Tokens

All tokens live under `Tokens/` and are consumed as static members — e.g. `UIColorToken.primary`, `UISpacing.md`.

### Colors (`UIColorToken`)
Each color is an adaptive `Color` with separate light/dark values, so no `.preferredColorScheme` handling is needed in consumer code.

| Token | Light | Dark |
|---|---|---|
| `primary` | `#0066FF` | `#3D8BFF` |
| `secondary` | `#6E6E73` | `#9B9BA1` |
| `destructive` | `#D72C2C` | `#FF6B6B` |
| `success` | `#1E8E3E` | `#4CD964` |
| `warning` | `#B26A00` | `#FFB840` |
| `surface` | `#FFFFFF` | `#1C1C1E` |
| `background` | `#F2F2F7` | `#000000` |
| `textPrimary` | `#1C1C1E` | `#F2F2F7` |
| `textSecondary` | `#6E6E73` | `#9B9BA1` |
| `textOnPrimary` | `#FFFFFF` | `#FFFFFF` |
| `border` | `#D1D1D6` | `#38383A` |

### Typography (`UIFontToken`)
Each token wraps a Dynamic Type text style, so text scales with the user's preferred size automatically.

`display` · `title` · `headline` · `body` · `callout` · `subheadline` · `footnote` · `caption`

```swift
Text("Hello").font(UIFontToken.title)
```

### Spacing (`UISpacing`)

| Token | Value |
|---|---|
| `xs` | 4 |
| `sm` | 8 |
| `md` | 16 |
| `lg` | 24 |
| `xl` | 32 |
| `xxl` | 48 |

### Corner Radius (`UIRadius`)

| Token | Value |
|---|---|
| `sm` | 6 |
| `md` | 12 |
| `lg` | 20 |
| `full` | 9999 (pill/capsule shapes) |

## Usage

```swift
import syzygy_ui_ios

// Design tokens
Text("Hello")
    .font(UIFontToken.title)
    .foregroundStyle(UIColorToken.primary)

// Components
PrimaryButton("Get Started") { /* handle tap */ }

TextInput(label: "Email", text: $email, placeholder: "you@example.com")

CardView {
    Text("Your content here")
}
```

See the [Components](#components) list above for everything else available.

## Contributing & Releases

### Making a release
Releases are fully automated. To publish a new version:

1. Make your changes and ensure all tests pass:
```sh
   swift build
   swift test
```

2. Commit with the release prefix:
```sh
   git commit -m "release: v1.2.0 — description of changes"
   git push origin main
```

3. The CI pipeline will automatically:
   - Run all tests
   - Create a GitHub release with the version tag
   - SPM users can immediately use the new version

### Version format
Follow semver: `v{major}.{minor}.{patch}`
- Patch: `v1.0.1` — bug fixes
- Minor: `v1.1.0` — new components or features
- Major: `v2.0.0` — breaking changes

### Swift Package Manager
This library is distributed via SPM. Users reference it directly via the GitHub URL — no additional publishing step needed.

## License
MIT
