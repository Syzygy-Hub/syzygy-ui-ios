# syzygy-ui-ios

[![Version](https://img.shields.io/badge/Version-2.5.0-2F6FED.svg)](CHANGELOG.md)
[![Swift](https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white)](https://www.swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-000000?logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml/badge.svg)](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Syzygy-Hub/.github/main/brand/assets/banners/syzygy-banner-dark-2400.png">
  <img src="https://raw.githubusercontent.com/Syzygy-Hub/.github/main/brand/assets/banners/syzygy-banner-light-2400.png" alt="Syzygy" width="500">
</picture>

The cross-platform design system layer of the Syzygy ecosystem — providing SyzygyTheme, runtime theme switching, and UI components across iOS, Android, React Native and Flutter.

Production-ready SwiftUI component library with semantic design tokens, Dark Mode, Dynamic Type, and zero third-party dependencies.

## Role in the Syzygy Ecosystem

`syzygy-ui-ios` is the design system layer. It depends only on `syzygy-foundation-ios` and is independently usable without adopting Core, Services or AI.

Full ecosystem architecture: [ecosystem-fragment.md](https://github.com/Syzygy-Hub/.github/blob/main/docs/ecosystem-fragment.md)

## Requirements
- iOS 17+
- Swift 6
- Xcode 16+

## Installation

### Swift Package Manager
In Xcode: File → Add Package Dependencies

Paste: https://github.com/Syzygy-Hub/syzygy-ui-ios

## Theming

v2.4.0 introduces `SyzygyTheme` — a runtime-swappable snapshot of all visual tokens (colors, radius, spacing, typography, elevation, animation) injected through the SwiftUI `Environment`.

### Wrapping your app

```swift
import syzygy_ui_ios

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            SyzygyThemeProvider { _ in
                ContentView()
            }
        }
    }
}
```

`SyzygyThemeProvider` injects the chosen theme into the environment so every `syzygy-ui-ios` component below it reads tokens from the theme automatically.

### Runtime theme switching

`SyzygyThemeProvider` exposes a `Binding<SyzygyTheme>` so you can swap the theme at runtime without rebuilding the view hierarchy:

```swift
SyzygyThemeProvider(theme: .dark) { $theme in
    VStack {
        ContentView()

        Button("Switch to High Contrast") {
            theme = .highContrast
        }
    }
}
```

### Built-in themes

| Theme | Description |
|---|---|
| `.default` | Adaptive light/dark (matches system appearance via `UIColorToken`) |
| `.dark` | Fixed dark-mode palette with pinned hex values |
| `.highContrast` | WCAG-AA+ contrast, heavier type weights, sharp radius (0 on all corners) |

### Component-level override

Apply a different theme to a subtree without affecting siblings:

```swift
CardView {
    Text("High contrast card")
}
.syzygyTheme(.highContrast)
```

### Custom themes

Build a one-off theme by mutating a preset:

```swift
let brandTheme = SyzygyTheme.default.with(
    colors: SyzygyColors(
        primary: Color(red: 0.2, green: 0.6, blue: 1.0),
        // ... other colors
    ),
    radius: SyzygyRadius(xs: 0, sm: 2, md: 4, lg: 8, xl: 12, full: 9999)
)
```

All `SyzygyTheme` sub-structs (`SyzygyColors`, `SyzygyRadius`, `SyzygySpacing`, `SyzygyTypography`, `SyzygyElevation`, `SyzygyAnimation`) conform to `Equatable` and `Sendable`, so they are safe to pass across actor boundaries and drive `withAnimation` transitions.

## Components

79 components across 9 categories, plus 6 `AnyTransition` helpers in Transitions.

- **Buttons**: PrimaryButton, SecondaryButton, DestructiveButton, GhostButton, IconButton, LoadingButton (built-in loading spinner state), FloatingActionButton, ButtonGroup (single- or multi-select segmented row)
- **Cards**: CardView
- **Badges**: Badge
- **Inputs**: TextInput (with optional character counter), SecureInput, SearchInput (debounced, with clear button), ToggleSwitch, CheckboxInput, RadioButtonInput, SliderInput, Dropdown, SegmentedControl, QuantityStepper, TextArea, OTPInput (auto-advancing OTP/PIN entry), TagInput (MultiSelect chip entry), DatePickerField, TimePickerField, FormField (generic label/content/error/helper wrapper), PasswordStrengthIndicator, SearchableDropdown (inline-filtering, standalone tappable list), PhoneInput (country-code prefix selector, formatted + raw digit bindings), CurrencyInput (locale-aware `NumberFormatter` display, raw numeric value)
- **Display**: Avatar, DividerLine, Chip, ListRow, SectionHeader, LazyImageView, CountBadge, StarRatingView, AvatarGroup, StatsCard (aka MetricCard), RatingInput (interactive counterpart to StarRatingView), PageControl (aka DotIndicator; read-only page dots syncing with `PagerView`), Accordion (managed group of expandable sections, single- or multi-open), Timeline (aka ActivityFeed; connected-line event list, leading or trailing icon alignment), ColorSwatch (circle/square color preview with optional label and selected state)
- **Feedback**: LoadingView, EmptyStateView, ToastView, ShimmerView, ProgressBar, PullToRefresh, ErrorStateView, SkeletonView, CircularProgress (determinate + indeterminate), InlineAlert (aka Banner), Snackbar, NetworkStatusBanner (`NWPathMonitor`-backed self-detecting offline banner, auto-dismissing — see cross-platform note below), ConfirmDialog (+ `.confirmDialog(isPresented:...)` modifier, built on `ModalDialog`)
- **Overlay**: ModalDialog (+ `.modal(isPresented:)` view modifier), BottomSheet (+ `.bottomSheet(isPresented:)` view modifier), CollapsibleView, ActionSheet (+ `.actionSheet(isPresented:actions:)` view modifier), Popover (+ `.styledPopover(isPresented:)` view modifier), Tooltip (+ `.tooltip(_:)` view modifier)
- **Navigation**: BackButton, TabBar, BottomNavigationBar, AppBar, FloatingTabBar (floating + icon+label, distinct from BottomNavigationBar's floating + icon-only), SideMenu (aka Drawer), StepIndicator (aka WizardSteps), Breadcrumbs
- **Layout**: KeyboardAvoidingScrollView, PagerView (swipeable paged content — reports the current page index for you to use as local state or feed into a navigator, as needed; PagerView is a presentational paged-content component, not a navigation element), AdaptiveStack, FlowLayout, StickyHeader, SafeAreaWrapper (configurable-edges safe-area API), LabeledDivider (centered/leading/trailing label breaking a `DividerLine`)
- **Transitions**: `AnyTransition.slideTransition(_:)`, `.crossFadeTransition`, `.slideVerticalTransition(_:)`, `.modalPresentationTransition`, `.scaleTransition`, `.fadeThroughTransition`

**PagerView — placement note**: PagerView is a presentational paged-content component, not a navigation element. It is listed under **Layout** to match `syzygy-ui-android`, `syzygy-ui-rn` and `syzygy-ui-flutter` — wire its `onPageChange` output into your own navigator if you want navigation semantics.

**NetworkStatusBanner — cross-platform note**: On iOS and Android, `NetworkStatusBanner` self-detects connectivity via first-party OS APIs (`NWPathMonitor` / `ConnectivityManager`) and requires no `isOffline` prop. On React Native and Flutter, real network detection requires a third-party package that this library deliberately does not bundle, so the banner is controlled/presentational — pass `isOffline` from your own network state.

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Design Tokens

All tokens live under `Tokens/` and are consumed as static members — e.g. `UIColorToken.primary`, `UISpacing.md`.

### Colors (`UIColorToken`)

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
| `primaryMuted` | `#D6E7FF` | `#0F2A54` |
| `destructiveMuted` | `#FBDADA` | `#4A1A1A` |
| `successMuted` | `#D9F0E0` | `#0F3A1E` |
| `warningMuted` | `#FCE9C7` | `#4A330A` |
| `surfaceSecondary` | `#F2F2F7` | `#2C2C2E` |
| `surfaceTertiary` | `#E5E5EA` | `#3A3A3C` |
| `textTertiary` | `#AEAEB2` | `#6E6E73` |
| `overlay` | `#000000` | `#000000` |
| `link` | `#0066FF` | `#3D8BFF` |
| `focus` | `#0066FF` | `#3D8BFF` |
| `separator` | `#D1D1D6` | `#38383A` |

### Typography (`UIFontToken`)

| Token | Description |
|---|---|
| `largeTitle` | 34pt bold, `.largeTitle` text style |
| `display` | Same as `largeTitle` |
| `title` | `.title`, semibold |
| `headline` | `.headline` |
| `body` | `.body` |
| `callout` | `.callout` |
| `subheadline` | `.subheadline` |
| `footnote` | `.footnote` |
| `caption` | `.caption` |

### Spacing (`UISpacing`)

| Token | Value |
|---|---|
| `xxs` | 2 |
| `xs` | 4 |
| `sm` | 8 |
| `md` | 16 |
| `lg` | 24 |
| `xl` | 32 |
| `xxl` | 48 |
| `xxxl` | 64 |

### Corner Radius (`UIRadius`)

| Token | Value |
|---|---|
| `xs` | 2 |
| `sm` | 6 |
| `md` | 12 |
| `lg` | 20 |
| `xl` | 16 |
| `full` | 9999 (pill/capsule shapes) |

### Elevation (`UIElevation`)

Each level is a shadow spec (radius, y-offset, opacity), applied via `.elevation(_:)`.

| Token | Radius | Y-offset | Opacity |
|---|---|---|---|
| `none` | 0 | 0 | 0 |
| `sm` | 4 | 1 | 0.08 |
| `md` | 8 | 2 | 0.12 |
| `lg` | 16 | 4 | 0.16 |

### Opacity (`UIOpacity`)

| Token | Value |
|---|---|
| `disabled` | 0.38 |
| `secondary` | 0.60 |
| `overlay` | 0.54 |

### Border Width (`UIBorderWidth`)

| Token | Value |
|---|---|
| `thin` | 0.5 |
| `regular` | 1 |
| `thick` | 2 |

### Icon Size (`UIIconSize`)

| Token | Value |
|---|---|
| `sm` | 16 |
| `md` | 20 |
| `lg` | 24 |
| `xl` | 32 |

### Animation (`UIAnimation`)

| Duration | Value (seconds) |
|---|---|
| `fast` | 0.15 |
| `normal` | 0.3 |
| `slow` | 0.5 |

| Easing | Maps to |
|---|---|
| `standard(_:)` | `.easeInOut(duration:)` |
| `decelerate(_:)` | `.easeOut(duration:)` |
| `accelerate(_:)` | `.easeIn(duration:)` |
| `spring(_:)` | `.spring(duration:)` |

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
