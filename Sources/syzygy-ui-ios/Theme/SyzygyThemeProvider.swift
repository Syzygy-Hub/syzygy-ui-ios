import SwiftUI

// MARK: - Environment Key

private struct SyzygyThemeKey: EnvironmentKey {
    static let defaultValue = SyzygyTheme.default
}

public extension EnvironmentValues {
    var syzygyTheme: SyzygyTheme {
        get { self[SyzygyThemeKey.self] }
        set { self[SyzygyThemeKey.self] = newValue }
    }
}

// MARK: - Provider

/// Injects a `SyzygyTheme` into the component tree.
///
/// ```swift
/// SyzygyThemeProvider(theme: .dark) { $theme in
///     ContentView()
///     Button("Toggle") { theme.wrappedValue = .default }
/// }
/// ```
public struct SyzygyThemeProvider<Content: View>: View {
    @State private var currentTheme: SyzygyTheme
    private let content: (Binding<SyzygyTheme>) -> Content

    public init(
        theme: SyzygyTheme = .default,
        @ViewBuilder content: @escaping (Binding<SyzygyTheme>) -> Content
    ) {
        _currentTheme = State(initialValue: theme)
        self.content = content
    }

    public var body: some View {
        content($currentTheme)
            .environment(\.syzygyTheme, currentTheme)
    }
}

// MARK: - Component-level override modifier

public extension View {
    /// Overrides the `SyzygyTheme` for this view and all its children.
    func syzygyTheme(_ theme: SyzygyTheme) -> some View {
        environment(\.syzygyTheme, theme)
    }
}
