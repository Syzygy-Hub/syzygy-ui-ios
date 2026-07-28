# ios-ui-library

[![Swift](https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white)](https://www.swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-000000?logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CI](https://github.com/aks5686/ios-ui-library/actions/workflows/swift.yml/badge.svg)](https://github.com/aks5686/ios-ui-library/actions/workflows/swift.yml)

Production-ready SwiftUI component library with semantic design tokens, Dark Mode, Dynamic Type, and zero third-party dependencies.

## Requirements
- iOS 17+
- Swift 6
- Xcode 16+

## Installation

### Swift Package Manager
In Xcode: File → Add Package Dependencies

Paste: https://github.com/aks5686/ios-ui-library

## Usage

### Add import
```swift
import ios_ui_library
```

### Apply design tokens
```swift
import ios_ui_library

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

## Components
- Buttons: PrimaryButton, SecondaryButton, DestructiveButton, GhostButton, IconButton
- Inputs: TextInput, SecureInput
- Feedback: LoadingView, EmptyStateView, ToastView
- Cards: CardView
- Badges: Badge
- Navigation: BackButton

## Design Tokens
All components use semantic tokens from Tokens/ — colors, typography, spacing, and radius.
Override tokens to theme the entire library instantly.

## License
MIT
