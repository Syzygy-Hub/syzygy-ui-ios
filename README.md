# syzygy-ui-ios

<img src="https://raw.githubusercontent.com/Syzygy-Hub/syzygy-brand-assets/main/Assets/syzygy-icon-192.png" alt="Syzygy" width="48">

[![Swift](https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white)](https://www.swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-000000?logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml/badge.svg)](https://github.com/Syzygy-Hub/syzygy-ui-ios/actions/workflows/swift.yml)

Production-ready SwiftUI component library with semantic design tokens, Dark Mode, Dynamic Type, and zero third-party dependencies.

## Requirements
- iOS 17+
- Swift 6
- Xcode 16+

## Installation

### Swift Package Manager
In Xcode: File → Add Package Dependencies

Paste: https://github.com/Syzygy-Hub/syzygy-ui-ios

## Usage

### Add import
```swift
import syzygy_ui_ios
```

### Apply design tokens
```swift
import syzygy_ui_ios

// Use color tokens
let background = UIColorToken.background
let primary = UIColorToken.primary

// Use typography tokens
Text("Hello")
    .font(UIFontToken.title)
```

### Use components
```swift
// Primary button
PrimaryButton("Get Started") {
    // handle tap
}

// Text input
TextInput(
    label: "Email",
    text: $email,
    placeholder: "you@example.com"
)

// Text input with character counter
TextInput(
    label: "Bio",
    text: $bio,
    placeholder: "Tell us about yourself",
    maxLength: 100
)

// Secure input
SecureInput(
    label: "Password",
    text: $password
)

// Loading view
LoadingView(message: "Please wait...")

// Empty state
EmptyStateView(
    systemImage: "tray",
    title: "Nothing here yet",
    subtitle: "Add something to get started"
)

// Badge
Badge("New", style: .primary)

// Card
CardView {
    Text("Your content here")
}
```

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
All components use semantic tokens from Tokens/ — colors, typography, spacing, and radius.
Override tokens to theme the entire library instantly.

## License
MIT
